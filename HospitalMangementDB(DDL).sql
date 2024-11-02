USE master 
GO

DROP DATABASE IF EXISTS HospitalManagementDB
GO

CREATE DATABASE HospitalManagementDB
ON (
    Name= 'HospitalManagementDB_Data_1',
    FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HospitalManagementDB_Data_1.mdf',
    Size= 25MB,
    MaxSize= 100MB,
    FileGrowth= 5%
)
LOG ON (
    Name= 'HospitalManagementDB_Log_1',
    FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HospitalManagementDB_Log_1.ldf',
    Size= 2MB,
    MaxSize= 25MB,
    FileGrowth= 1%
)
GO

USE HospitalManagementDB
GO 

IF OBJECT_ID('Patients') IS NOT NULL
    DROP TABLE Patients
GO 

CREATE TABLE Patients
    (PatientID int PRIMARY KEY IDENTITY,
    PatientName varchar(50) NOT NULL,
    DateOfBirth date NOT NULL,
    Gender varchar(10) NOT NULL,
    Phone varchar(15) NOT NULL,
    Address varchar(100) NOT NULL)
GO

DROP TABLE IF EXISTS Doctors
GO 

CREATE TABLE Doctors
    (DoctorID int PRIMARY KEY IDENTITY,
    DoctorName varchar(50) NOT NULL,
    Specialty varchar(50) NOT NULL,
    Phone varchar(15) NOT NULL)
GO

DROP TABLE IF EXISTS Appointments
GO 

CREATE TABLE Appointments
    (AppointmentID int PRIMARY KEY IDENTITY,
    PatientID int REFERENCES Patients(PatientID) ON DELETE CASCADE ON UPDATE CASCADE,
    DoctorID int REFERENCES Doctors(DoctorID) ON DELETE CASCADE ON UPDATE CASCADE,
    AppointmentDate date NOT NULL,
    AppointmentTime time NOT NULL,
    Status varchar(20) NOT NULL)
GO

DROP TABLE IF EXISTS Treatments
GO 

CREATE TABLE Treatments
    (TreatmentID int PRIMARY KEY IDENTITY,
    TreatmentDescription varchar(100) NOT NULL,
    Cost money NOT NULL)
GO

DROP TABLE IF EXISTS PatientTreatments
GO 

CREATE TABLE PatientTreatments
    (PatientID int REFERENCES Patients(PatientID) ON DELETE CASCADE ON UPDATE CASCADE,
    TreatmentID int REFERENCES Treatments(TreatmentID) ON DELETE CASCADE ON UPDATE CASCADE,
    TreatmentDate date NOT NULL,
    PRIMARY KEY (PatientID, TreatmentID, TreatmentDate))
GO

DROP TABLE IF EXISTS Billing
GO 

CREATE TABLE Billing
    (BillID int PRIMARY KEY IDENTITY,
    PatientID int REFERENCES Patients(PatientID) ON DELETE CASCADE ON UPDATE CASCADE,
    Amount money NOT NULL,
    BillDate date NOT NULL,
    Status varchar(20) NOT NULL)
GO

DROP TABLE IF EXISTS Invoice
GO 

CREATE TABLE Invoice
    (InvoiceID int PRIMARY KEY IDENTITY,
    BillID int REFERENCES Billing(BillID) ON DELETE CASCADE ON UPDATE CASCADE,
    InvoiceNumber int NOT NULL,
    InvoiceDate date NOT NULL,
    TotalAmount money NOT NULL)
GO

---------------------------------------------------------------------------------
--  Create A view / Updateable VIEW with ENCRYPTION, SCHEMABINDING

CREATE OR ALTER VIEW AllPatientInfo WITH ENCRYPTION, SCHEMABINDING AS 
SELECT P.PatientName, D.DoctorName, A.AppointmentDate, A.AppointmentTime, T.TreatmentDescription, B.Amount
FROM dbo.Patients AS P
JOIN dbo.Appointments AS A ON P.PatientID = A.PatientID
JOIN dbo.Doctors AS D ON A.DoctorID = D.DoctorID
LEFT JOIN dbo.PatientTreatments AS PT ON P.PatientID = PT.PatientID
LEFT JOIN dbo.Treatments AS T ON PT.TreatmentID = T.TreatmentID
JOIN dbo.Billing AS B ON P.PatientID = B.PatientID
GO


select * from AllPatientInfo
---------------------------------------------------------------------------------
--NON UPDATEABLE VIEW 
CREATE OR ALTER VIEW PatientBillingInfo WITH ENCRYPTION AS 
SELECT PatientName, COUNT(BillID) AS TotalBills, SUM(Amount) AS TotalAmount 
FROM AllPatientInfo
GROUP BY PatientName
GO


--------------------------------------------------------------------------------
--INDEX CLUSTERED / NON CLUSTERED

CREATE CLUSTERED INDEX ix_Patients
ON Patients(PatientID)
GO

CREATE NONCLUSTERED INDEX ix_Appointments
ON Appointments(AppointmentDate)
GO

-------------------------------------------------------------------------------------------------
-- PROCEDURE FOR INSERT UPDATE DELETE AND OUTPUT PARAMETER

CREATE OR ALTER PROC spManagePatient
    @Functionality varchar(10)='',
    @PatientID int,
    @PatientName varchar(50),
    @DateOfBirth date,
    @Gender varchar(10),
    @Phone varchar(15),
    @Address varchar(100),
    @Count int output
AS 
BEGIN
    IF @Functionality='SELECT'
        SELECT * FROM Patients
    IF @Functionality='INSERT'
        BEGIN TRY
            INSERT INTO Patients 
            VALUES (@PatientName, @DateOfBirth, @Gender, @Phone, @Address)
        END TRY
        BEGIN CATCH
            SELECT ERROR_LINE() AS ErrorLine,
                   ERROR_MESSAGE() AS ErrorMessage,
                   ERROR_SEVERITY() AS ErrorSeverity
        END CATCH
    IF @Functionality='UPDATE'
        BEGIN TRY
            UPDATE Patients
            SET PatientName = @PatientName,
                DateOfBirth = @DateOfBirth,
                Gender = @Gender,
                Phone = @Phone,
                Address = @Address 
            WHERE PatientID = @PatientID
        END TRY
        BEGIN CATCH
            SELECT ERROR_LINE() AS ErrorLine,
                   ERROR_MESSAGE() AS ErrorMessage,
                   ERROR_SEVERITY() AS ErrorSeverity
        END CATCH
    IF @Functionality='DELETE'
        BEGIN TRY
            DELETE FROM Patients
            WHERE PatientID = @PatientID
        END TRY
        BEGIN CATCH
            SELECT ERROR_LINE() AS ErrorLine,
                   ERROR_MESSAGE() AS ErrorMessage,
                   ERROR_SEVERITY() AS ErrorSeverity
        END CATCH    
                
    SET @Count = @@ROWCOUNT
END

------------------------------------------------------------------

-- CREATE CTE to Find out appointments

WITH UpcomingAppointments AS
(SELECT A.AppointmentID, P.PatientName, D.DoctorName, A.AppointmentDate, A.AppointmentTime 
 FROM Appointments A 
 JOIN Patients P ON A.PatientID = P.PatientID 
 JOIN Doctors D ON A.DoctorID = D.DoctorID
 WHERE A.AppointmentDate > GETDATE())
SELECT * FROM UpcomingAppointments
GO

--------------------------------------------------------------------------------------- 
--Store Procedure With Raise Error

CREATE OR ALTER PROC spWithRaiseError
    @PatientID int,
    @AppointmentDate date,
    @DoctorID int
AS
BEGIN
    IF EXISTS (SELECT * FROM Patients WHERE PatientID = @PatientID)
        INSERT INTO Appointments
        VALUES (@PatientID, @DoctorID, @AppointmentDate, 'Scheduled')
    ELSE 
        THROW 50001, 'This patient ID is not valid', 1;
END

BEGIN TRY
    EXEC spWithRaiseError 1, '2024-11-01', 2;
END TRY
BEGIN CATCH 
    PRINT ERROR_MESSAGE()
END CATCH
GO

---------------------------------------------------------------------------------------------------------------------
-- TRIGGER - HERE DELETING MORE THAN 1 ROW IS NOT ALLOWED

CREATE TRIGGER PatientDeleted
    ON Patients
    AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
        BEGIN
            PRINT 'Deleting more than one row at a time is not allowed.'
            ROLLBACK
            PRINT CONVERT(varchar, ERROR_MESSAGE())
        END
    ELSE
        BEGIN
            -- Log deleted patient information or perform additional actions if necessary
            PRINT 'Patient deleted successfully.'
        END
END
GO

---------------------------------------------------------------------------------------------------------------------
-- TRIGGER AFTER Insert Update  - HERE DELETING MORE THAN 1 ROW IS NOT ALLOWED

CREATE TRIGGER PatientInsertedOrUpdated
    ON Patients
    AFTER INSERT, UPDATE
AS
BEGIN
    -- Log patient insert/update information or perform additional actions if necessary
    PRINT 'Patient information inserted or updated successfully.'
END
GO

--------------------------------------------------------------------------------------------------------------------------
-------CREATE SEQUENCE-----

CREATE SEQUENCE PatientIDSequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 10000
    CYCLE CACHE 1
GO 

------------------------------------------------------------------------------- 
--CREATE PROCEDURE TO INSERT DATA IN INVOICE TABLE AND INVOICE LINE ITEM TABLE

CREATE TYPE LineItemType AS Table
(InvoiceSequence int,
 ProductID int,
 Qty int,
 Rate Float)

CREATE OR ALTER PROC spInsertInvoiceAndLineItem
    @PatientID int, @InvNum int, @InvDate date, @Amount money,
    @lineItem LineItemType READONLY
AS 
BEGIN 
    DECLARE @InvID int

    INSERT INTO Billing
    VALUES(@PatientID, @Amount, @InvDate, 'Paid')

    SET @InvID = @@IDENTITY

    INSERT INTO Invoice
    SELECT @InvID, @InvNum, @InvDate, @Amount FROM @lineItem

    UPDATE Billing
    SET Amount = (SELECT SUM(Amount) FROM Invoice WHERE BillID = @InvID)
    WHERE BillID = @InvID
END

---------------------------------------------------------------------------------------------- 
--TABLE VALUED FUNCTION 

CREATE FUNCTION TotalBilling(@MinAmount money = 0)
    RETURNS Table 
RETURN 
    (SELECT P.PatientID, P.PatientName, SUM(B.Amount) AS TotalAmount  
     FROM Patients P 
     JOIN Billing B ON P.PatientID = B.PatientID
     GROUP BY P.PatientID, P.PatientName
     HAVING SUM(B.Amount) > @MinAmount)
GO

-----------------------------------------------------------------------------
--Sclar Function

CREATE FUNCTION dbo.CalculateAge(@DateOfBirth DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;

    IF @DateOfBirth IS NULL
    BEGIN
        RETURN NULL; -- Return NULL if the date of birth is not provided
    END

    -- Calculate age
    SET @Age = DATEDIFF(YEAR, @DateOfBirth, GETDATE()) -
                CASE 
                    WHEN MONTH(@DateOfBirth) > MONTH(GETDATE()) OR 
                         (MONTH(@DateOfBirth) = MONTH(GETDATE()) AND DAY(@DateOfBirth) > DAY(GETDATE()))
                    THEN 1 
                    ELSE 0 
                END;

    RETURN @Age;
END;
GO

