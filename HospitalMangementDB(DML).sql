USE HospitalManagementDB
GO 

-- Insert sample data into Patients
--------------------------------------------
BEGIN TRY
INSERT INTO Patients (PatientName, DateOfBirth, Gender, Phone, Address)
VALUES 
    ('John Doe', '1990-01-01', 'Male', '555-1234', '123 Elm St, Cityville'),
    ('Jane Smith', '1985-05-12', 'Female', '555-5678', '456 Oak St, Townsville'),
    ('Michael Johnson', '1978-08-20', 'Male', '555-9101', '789 Pine St, Villageburg'),
    ('Emily Davis', '1992-02-15', 'Female', '555-1111', '321 Maple St, Cityville'),
    ('Daniel Lee', '1980-03-25', 'Male', '555-2222', '654 Cedar St, Townsville'),
    ('Sarah Wilson', '1987-06-30', 'Female', '555-3333', '987 Birch St, Villageburg'),
    ('David Brown', '1995-07-14', 'Male', '555-4444', '159 Elm St, Cityville'),
    ('Laura Miller', '1982-09-20', 'Female', '555-5555', '753 Oak St, Townsville'),
    ('Kevin Anderson', '1989-12-01', 'Male', '555-6666', '852 Pine St, Villageburg'),
    ('Sophia Garcia', '1994-11-05', 'Female', '555-7777', '246 Maple St, Cityville'),
    ('James Martinez', '1988-04-10', 'Male', '555-8888', '369 Cedar St, Townsville'),
    ('Olivia Robinson', '1991-10-18', 'Female', '555-9999', '147 Birch St, Villageburg'),
    ('Matthew Thompson', '1986-05-22', 'Male', '555-1010', '258 Elm St, Cityville'),
    ('Isabella Taylor', '1993-08-16', 'Female', '555-1212', '369 Oak St, Townsville'),
    ('Liam Hernandez', '1984-12-30', 'Male', '555-1313', '741 Pine St, Villageburg')
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage,
           ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO 

-- Insert sample data into Doctors
BEGIN TRY
INSERT INTO Doctors (DoctorName, Specialty, Phone)
VALUES 
    ('Dr. Alice Brown', 'Cardiology', '555-0001'),
    ('Dr. Bob White', 'Neurology', '555-0002'),
    ('Dr. Charlie Green', 'Pediatrics', '555-0003'),
    ('Dr. Daniel Black', 'Orthopedics', '555-0004'),
    ('Dr. Emily Blue', 'Dermatology', '555-0005'),
    ('Dr. Frank Yellow', 'General Surgery', '555-0006'),
    ('Dr. Grace Red', 'Psychiatry', '555-0007'),
    ('Dr. Henry Purple', 'Anesthesiology', '555-0008'),
    ('Dr. Ivy Pink', 'Radiology', '555-0009'),
    ('Dr. Jack Orange', 'Ophthalmology', '555-0010'),
    ('Dr. Lily Teal', 'Endocrinology', '555-0011'),
    ('Dr. Mark Brown', 'Gastroenterology', '555-0012'),
    ('Dr. Nora Gray', 'Hematology', '555-0013'),
    ('Dr. Oscar Silver', 'Oncology', '555-0014'),
    ('Dr. Paula Gold', 'Urology', '555-0015')
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage,
           ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO 

-- Insert sample data into Appointments
BEGIN TRY
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status)
VALUES 
    (1, 1, '2024-11-10', '09:00:00', 'Scheduled'),
    (2, 2, '2024-11-11', '10:30:00', 'Scheduled'),
    (3, 3, '2024-11-12', '14:00:00', 'Scheduled'),
    (4, 4, '2024-11-13', '15:00:00', 'Scheduled'),
    (5, 5, '2024-11-14', '11:00:00', 'Scheduled'),
    (6, 6, '2024-11-15', '09:30:00', 'Scheduled'),
    (7, 7, '2024-11-16', '14:30:00', 'Scheduled'),
    (8, 8, '2024-11-17', '12:00:00', 'Scheduled'),
    (9, 9, '2024-11-18', '10:15:00', 'Scheduled'),
    (10, 10, '2024-11-19', '13:45:00', 'Scheduled'),
    (11, 11, '2024-11-20', '08:00:00', 'Scheduled'),
    (12, 12, '2024-11-21', '11:30:00', 'Scheduled'),
    (13, 13, '2024-11-22', '09:15:00', 'Scheduled'),
    (14, 14, '2024-11-23', '14:00:00', 'Scheduled'),
    (15, 15, '2024-11-24', '16:00:00', 'Scheduled')
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage,
           ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO 

-- Insert sample data into Treatments
BEGIN TRY
INSERT INTO Treatments (TreatmentDescription, Cost)
VALUES 
    ('Blood Test', 150.00),
    ('X-Ray', 300.00),
    ('Routine Checkup', 100.00),
    ('MRI Scan', 1200.00),
    ('CT Scan', 800.00),
    ('Ultrasound', 250.00),
    ('Vaccination', 50.00),
    ('Physiotherapy', 200.00),
    ('Dental Checkup', 180.00),
    ('Optometry Exam', 150.00),
    ('Chiropractic Adjustment', 100.00),
    ('Hearing Test', 75.00),
    ('Skin Allergy Test', 120.00),
    ('Nutritional Counseling', 300.00),
    ('Cancer Screening', 500.00)
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage,
           ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO 

-- Insert sample data into PatientTreatments
BEGIN TRY
INSERT INTO PatientTreatments (PatientID, TreatmentID, TreatmentDate)
VALUES 
    (1, 1, '2024-11-10'),
    (1, 3, '2024-11-10'),
    (2, 2, '2024-11-11'),
    (2, 4, '2024-11-11'),
    (3, 5, '2024-11-12'),
    (3, 6, '2024-11-12'),
    (4, 7, '2024-11-13'),
    (4, 8, '2024-11-13'),
    (5, 9, '2024-11-14'),
    (5, 10, '2024-11-14'),
    (6, 11, '2024-11-15'),
    (6, 12, '2024-11-15'),
    (7, 13, '2024-11-16'),
    (7, 14, '2024-11-16'),
    (8, 15, '2024-11-17')
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage,
           ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO 

-- Insert sample data into Billing
BEGIN TRY
INSERT INTO Billing (PatientID, Amount, BillDate, Status)
VALUES 
    (1, 250.00, '2024-11-10', 'Paid'),
    (2, 300.00, '2024-11-11', 'Pending'),
    (3, 100.00, '2024-11-12', 'Paid'),
    (4, 400.00, '2024-11-13', 'Pending'),
    (5, 150.00, '2024-11-14', 'Paid'),
    (6, 500.00, '2024-11-15', 'Pending'),
    (7, 350.00, '2024-11-16', 'Paid'),
    (8, 275.00, '2024-11-17', 'Paid'),
    (9, 600.00, '2024-11-18', 'Pending'),
    (10, 450.00, '2024-11-19', 'Paid'),
    (11, 300.00, '2024-11-20', 'Pending'),
    (12, 700.00, '2024-11-21', 'Paid'),
    (13, 550.00, '2024-11-22', 'Pending'),
    (14, 400.00, '2024-11-23', 'Paid'),
    (15, 600.00, '2024-11-24', 'Paid')
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage,
           ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO 

-- Insert sample data into Invoice
BEGIN TRY
INSERT INTO Invoice (BillID, InvoiceNumber, InvoiceDate, TotalAmount)
VALUES 
    (1, 1001, '2024-11-11', 250.00),
    (2, 1002, '2024-11-12', 300.00),
    (3, 1003, '2024-11-13', 100.00),
    (4, 1004, '2024-11-14', 400.00),
    (5, 1005, '2024-11-15', 150.00),
    (6, 1006, '2024-11-16', 500.00),
    (7, 1007, '2024-11-17', 350.00),
    (8, 1008, '2024-11-18', 275.00),
    (9, 1009, '2024-11-19', 600.00),
    (10, 1010, '2024-11-20', 450.00),
    (11, 1011, '2024-11-21', 300.00),
    (12, 1012, '2024-11-22', 700.00),
    (13, 1013, '2024-11-23', 550.00),
    (14, 1014, '2024-11-24', 400.00),
    (15, 1015, '2024-11-25', 600.00)
END TRY
BEGIN CATCH
    SELECT ERROR_LINE() AS ErrorLine,
           ERROR_MESSAGE() AS ErrorMessage,
           ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO 

-- DELETE QUERY 
--------------------
DELETE FROM Appointments
WHERE AppointmentID = 1
GO

-- UPDATE QUERY
-----------------------
UPDATE Patients
SET Phone = '555-1235'
WHERE PatientID = 2
GO
---Make a Copy Table
---------------------------------------
-- Make a copy of the Patients table

SELECT * INTO PatientsBackup FROM Patients
GO

-- DELETE COLUMN
------------------
ALTER TABLE PatientsBackup
DROP COLUMN Address
GO

-- DELETE TABLE
----------------------
DROP TABLE PatientsBackup
GO

-- Write a query to retrieve PatientName wise average treatment cost
---Retrieve Average Treatment Cost by Patient
----------------------------------------------------------------------
SELECT p.PatientName, AVG(t.Cost) AS AvgTreatmentCost 
FROM Patients p
JOIN PatientTreatments pt ON p.PatientID = pt.PatientID
JOIN Treatments t ON pt.TreatmentID = t.TreatmentID
GROUP BY p.PatientName
GO

-- Write a query to retrieve appointments from 1 November 2024 to 15 November 2024
--Retrieve Appointments Within a Date Range
--------------------------------------------------------------------
SELECT * FROM Appointments 
WHERE AppointmentDate BETWEEN '2024-11-01' AND '2024-11-15'
GO


-- Retrieve patients whose name starts with J and next letter is a to m
---------------------------------------------------------------------------------
SELECT * FROM Patients
WHERE PatientName LIKE 'J[a-m]%'
GO

-- Retrieve patients whose name starts with A and next letter is not e to z
--------------------------------------------------------------------------------
SELECT * FROM Patients
WHERE PatientName LIKE 'A[^e-z]%'
GO


-- TOP Clause
-----------------------
SELECT TOP 1 SUM(b.Amount) AS MaximumBillAmount 
FROM Billing b
GROUP BY b.PatientID
ORDER BY MaximumBillAmount DESC
GO


-- TOP with Ties
------------------------------
SELECT TOP 1 WITH TIES SUM(b.Amount) AS MaximumBillAmount 
FROM Billing b
GROUP BY b.PatientID
ORDER BY MaximumBillAmount DESC
GO

-- Example of OFFSET and FETCH Clause
-------------------------------------
SELECT * FROM Invoice
ORDER BY InvoiceID
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY
GO


-- ANY Example
--------------------------
SELECT p.PatientName, b.Amount
FROM Patients p
JOIN Billing b ON p.PatientID = b.PatientID
WHERE b.Amount > ANY
(
    SELECT Amount FROM Billing
)
GO


-- Retrieve patients whose total billing amount is greater than (ALL) other patients' total billing amounts
--ALL
-----------------------------------------------------------------------------------------------------------------

SELECT PatientID, SUM(Amount) AS TotalBilling
FROM Billing
GROUP BY PatientID
HAVING SUM(Amount) > ALL
(
    SELECT SUM(Amount) FROM Billing GROUP BY PatientID
)
GO

select * from Billing

-- Retrieve patients whose total billing amount is greater than (SOME) other patients' total billing amounts
-----(SOME)
------------------------------------------------------------------------------------------------------------------------
SELECT PatientID, SUM(Amount) AS TotalBilling
FROM Billing
GROUP BY PatientID
HAVING SUM(Amount) > SOME
(
    SELECT SUM(Amount) FROM Billing GROUP BY PatientID
)
GO

-- Retrieve invoices where the patient exists with a specific phone number
-----------------------------------------------------------------------------------
SELECT *
FROM Billing b
WHERE EXISTS 
(
    SELECT 1 FROM Patients p 
    WHERE p.PatientID = b.PatientID AND p.Phone = '555-1234'
)
GO

-- Retrieve invoices where the patient does not exist with a specific phone number
------------------------------------------------------------------------------------------
SELECT *
FROM Billing b
WHERE NOT EXISTS 
(
    SELECT 1 FROM Patients p 
    WHERE p.PatientID = b.PatientID AND p.Phone = '555-9999'
)
GO

-- Cast a string to a date
--------------------------------------
SELECT CAST('2024-01-01' AS DATE) AS CastedDate
GO

-- Convert a string to time
---------------------------------
SELECT CONVERT(TIME, '2024-01-01 10:00 AM') AS ConvertedTime;
GO



-- Group billing records by patient and sum the total billing amount
---------------------------------------------------------------------
SELECT p.PatientName, SUM(b.Amount) AS TotalBilling
FROM Billing b
JOIN Patients p ON b.PatientID = p.PatientID
GROUP BY p.PatientName
HAVING SUM(b.Amount) > 500.00
GO





-- Group billing records by patient and status with (CUBE)
------------------------------------------------------------------
SELECT p.PatientName, b.Status, SUM(b.Amount) AS TotalBilling
FROM Billing b
JOIN Patients p ON b.PatientID = p.PatientID
GROUP BY CUBE(p.PatientName, b.Status)
HAVING SUM(b.Amount) > 500.00
GO


-- Group billing records by patient and status with (GROUPING SETS)
----------------------------------------------------------------------------
SELECT p.PatientName, b.Status, SUM(b.Amount) AS TotalBilling
FROM Billing b
JOIN Patients p ON b.PatientID = p.PatientID
GROUP BY GROUPING SETS(p.PatientName, b.Status)
HAVING SUM(b.Amount) > 500.00
GO

-- Calculate total amount billed to each patient over their appointments
--------------------------------------------------------------------------------
SELECT PatientID, BillDate, Amount,
    SUM(Amount) OVER (PARTITION BY PatientID) AS TotalBilledToPatient
FROM Billing
GO

-- Display patient names and their treatment costs, replacing NULLs with 'No Treatment'
-----------------------------------------------------------------------------------------------
SELECT ISNULL(p.PatientName, 'No Patient') AS PatientName,
       ISNULL(t.TreatmentDescription, 'No Treatment') AS TreatmentDescription,
       SUM(b.Amount) AS TotalBilling
FROM Billing b
JOIN Patients p ON b.PatientID = p.PatientID
JOIN PatientTreatments pt ON pt.PatientID = p.PatientID
JOIN Treatments t ON pt.TreatmentID = t.TreatmentID
GROUP BY GROUPING SETS(p.PatientName, t.TreatmentDescription)
GO


-- Retrieve all doctors whose names start with 'Dr.'
---------------------------------------------------------
SELECT *
FROM Doctors
WHERE DoctorName LIKE 'Dr%'
GO

-- Retrieve all billing information for patients who have appointments with a specific doctor
SELECT p.PatientName, COUNT(b.BillID) AS TotalBills,
       SUM(b.Amount) AS TotalPayment, MAX(b.Amount) AS MaxPayment,
       MIN(b.Amount) AS MinPayment
FROM Billing b
JOIN Patients p ON b.PatientID = p.PatientID
WHERE p.PatientID IN
(
    SELECT a.PatientID
    FROM Appointments a
    WHERE a.DoctorID IN
    (
        SELECT DoctorID FROM Doctors WHERE DoctorName = 'Dr. Smith'
    )
)
GROUP BY p.PatientName
GO



-- Assume you have a temporary table named PatientUpdate with updated patient data
-- MERGE Patients with updates
-----------------------------------------------------------------------------------
MERGE Patients AS Target
USING PatientUpdate AS Source
ON Target.PatientID = Source.PatientID
WHEN MATCHED THEN 
    UPDATE SET Target.PatientName = Source.PatientName, 
               Target.DateOfBirth = Source.DateOfBirth,
               Target.Gender = Source.Gender,
               Target.Phone = Source.Phone,
               Target.Address = Source.Address
WHEN NOT MATCHED THEN 
    INSERT (PatientID, PatientName, DateOfBirth, Gender, Phone, Address)
    VALUES (Source.PatientID, Source.PatientName, Source.DateOfBirth, Source.Gender, Source.Phone, Source.Address);
GO


-- Cursor to print patient names and count patients over a certain age
-------------------------------------------------------------------------
DECLARE @PatientID int, @PatientName varchar(50), @Count int;
SET @Count = 0;

DECLARE PatientCursor CURSOR
FOR SELECT PatientID, PatientName FROM Patients WHERE DateOfBirth < DATEADD(YEAR, -18, GETDATE()) -- Patients over 18

OPEN PatientCursor
FETCH NEXT FROM PatientCursor INTO @PatientID, @PatientName
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @PatientName
    SET @Count = @Count + 1
    FETCH NEXT FROM PatientCursor INTO @PatientID, @PatientName
END
CLOSE PatientCursor
DEALLOCATE PatientCursor

PRINT 'Total Patients Over 18: ' + CAST(@Count AS VARCHAR)
GO


-- Determine the payment status based on the bill amount
SELECT BillID, Amount,
CASE 
    WHEN Amount >= 30000 THEN 'High Value'
    WHEN Amount >= 28000 THEN 'High Mid Value'
    WHEN Amount >= 25000 THEN 'High Mid Value'
    ELSE 'Low Value'
END AS PaymentStatus
FROM Billing
GO


-- Display treatment terms based on TreatmentID
SELECT TreatmentID,
CASE TreatmentID
    WHEN 1 THEN 'Consultation'
    WHEN 2 THEN 'Surgery'
    WHEN 3 THEN 'Therapy'
    WHEN 4 THEN 'Medication'
END AS TreatmentDescription
FROM Treatments
GO


-- Insert data into Invoices and InvoiceLineItem with error handling
------------------------------------------------------------------------------
DECLARE @InvID int;

BEGIN TRY
    BEGIN TRAN
        INSERT INTO Invoice (BillID, InvoiceNumber, InvoiceDate, TotalAmount)
        VALUES (1, 501, '2020-02-01', 10000);  -- Adjust values as needed

        SET @InvID = SCOPE_IDENTITY();

        INSERT INTO InvoiceLineItem (InvoiceID, TreatmentID, Quantity, Rate)
        VALUES (@InvID, 1, 2, 500),  -- Example treatment details
               (@InvID, 2, 1, 1500);

    COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK TRAN
    PRINT 'Error occurred during transaction.'
END CATCH

SELECT * FROM Invoice;
GO

-- Insert data using a sequence for unique identifiers
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status)
VALUES (1, 1, '2020-08-31', '10:00:00', 'Scheduled'),
       (1, 2, '2020-08-30', '11:00:00', 'Scheduled');

INSERT INTO PatientTreatments (PatientID, TreatmentID, TreatmentDate)
VALUES (1, 1, '2020-09-01'),
       (1, 2, '2020-09-02');

SELECT * FROM Appointments;
GO


-- Assuming a view named AllPatientsInfo exists
-------------------------------------
SELECT * FROM AllPatientInfo; 
GO


-- Update treatment details through a view
-------------------------------------------
UPDATE AllPatientInfo
SET Amount = 1500
WHERE PatientName = 'Alice Smith';  -- Adjust conditions as necessary
GO

-- Select from the non-updateable view
---------------------------------------------------
SELECT * FROM PatientBillingInfo;
GO

-- Retrieve data from InvoiceInfo view
-----------------------------------------------
SELECT * FROM InvoiceInfo;
GO

-- Execute procedure for various functionalities related to Patients
-------------------------------------------------------------------------
EXEC spManagePatient 'SELECT', 0, '', NULL, NULL, NULL, NULL, @Count OUTPUT;
EXEC spManagePatient 'INSERT', 0, 'John Doe', '1980-01-01', 'Male', '1234567890', '123 Main St', @Count OUTPUT;
EXEC spManagePatient 'UPDATE', 1, 'Jane Doe', '1985-05-05', 'Female', '0987654321', '456 Elm St', @Count OUTPUT;
EXEC spManagePatient 'DELETE', 1, '', NULL, NULL, NULL, NULL, @Count OUTPUT;
GO


-- Retrieve billing information for patients over a certain amount
------------------------------------------------------------------------
SELECT * FROM dbo.TotalBilling(1000);
GO


-- Calculate and print age based on the date of birth
-------------------------------------------------------------------------
DECLARE @PatientID int = 1;
SELECT 'The age of the patient is: ' + CONVERT(varchar, dbo.CalculateAge((SELECT DateOfBirth FROM Patients WHERE PatientID = @PatientID)));
GO



-- Insert new patient
DECLARE @PatientCount int;
EXEC spManagePatient 'INSERT', 0, 'Alice Smith', '1990-03-15', 'Female', '1231231234', '789 Oak St', @PatientCount OUTPUT;
PRINT 'Rows affected: ' + CAST(@PatientCount AS varchar);

-- Update existing patient
EXEC spManagePatient 'UPDATE', 2, 'Alice Johnson', '1990-03-15', 'Female', '1231231234', '789 Oak St', @PatientCount OUTPUT;
PRINT 'Rows affected: ' + CAST(@PatientCount AS varchar);

-- Delete patient
EXEC spManagePatient 'DELETE', 2, '', NULL, NULL, NULL, NULL, @PatientCount OUTPUT;
PRINT 'Rows affected: ' + CAST(@PatientCount AS varchar);
GO



-- Test the trigger by deleting a patient
---------------------------------------------------------
DELETE FROM Patients WHERE PatientID = 3;  -- Assuming PatientID 3 exists
GO


-- Test procedure with error handling for invalid patient ID
-----------------------------------------------------------------------------------
BEGIN TRY
    EXEC spWithRaiseError 999, '2024-11-01', 2;  -- Assuming PatientID 999 does not exist
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO



