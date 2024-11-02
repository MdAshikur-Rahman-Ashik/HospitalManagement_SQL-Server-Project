<h1>HospitalManagementSqlDatabase</h1>

<p>HospitalManagementSqlDatabase is an SQL Server project designed to manage and streamline hospital operations. This repository contains all essential database structures, including tables, relationships, views, and stored procedures necessary for managing patients, doctors, appointments, billing, and medical records within a hospital system.</p>

<h2>Table of Contents</h2>
<ul>
  <li><a href="#features">Features</a></li>
  <li><a href="#database-schema">Database Schema</a></li>
  <li><a href="#installation">Installation</a></li>
  <li><a href="#usage">Usage</a>
    <ul>
      <li><a href="#patient-management">Patient Management</a></li>
      <li><a href="#doctor-management">Doctor Management</a></li>
      <li><a href="#appointment-management">Appointment Management</a></li>
      <li><a href="#billing-management">Billing Management</a></li>
      <li><a href="#medical-records-management">Medical Records Management</a></li>
    </ul>
  </li>
  <li><a href="#stored-procedures">Stored Procedures</a>
    <ul>
      <li><a href="#patient-procedures">Patient Procedures</a></li>
      <li><a href="#doctor-procedures">Doctor Procedures</a></li>
      <li><a href="#appointment-procedures">Appointment Procedures</a></li>
      <li><a href="#billing-procedures">Billing Procedures</a></li>
      <li><a href="#medical-records-procedures">Medical Records Procedures</a></li>
    </ul>
  </li>
  <li><a href="#contributing">Contributing</a></li>
  <li><a href="#license">License</a></li>
</ul>

<h2 id="features">Features</h2>
<ul>
  <li><strong>Comprehensive Hospital Management</strong>: Manage patients, doctors, appointments, billing, and medical records.</li>
  <li><strong>Patient and Doctor Tracking</strong>: Keep accurate records of patient details, appointments, and doctor schedules.</li>
  <li><strong>Appointment Scheduling</strong>: Handle scheduling, status updates, and room assignments.</li>
  <li><strong>Billing Management</strong>: Manage billing, payments, and invoices.</li>
  <li><strong>Medical Record Keeping</strong>: Maintain patient diagnoses, treatments, and prescriptions.</li>
  <li><strong>Reporting Tools</strong>: Generate detailed reports on hospital operations, patient visits, and treatment history.</li>
</ul>

<h2 id="database-schema">Database Schema</h2>
<p>The database schema consists of the following key entities and relationships:</p>
<ul>
  <li><strong>Patients</strong>: Stores patient details, including <code>PatientId</code>, <code>Name</code>, <code>DOB</code>, <code>ContactInfo</code>, and <code>AdmissionDate</code>.</li>
  <li><strong>Doctors</strong>: Contains doctor data like <code>DoctorId</code>, <code>Name</code>, <code>Specialization</code>, <code>ContactInfo</code>, and available schedules.</li>
  <li><strong>Appointments</strong>: Tracks appointment information with <code>AppointmentId</code>, <code>PatientId</code>, <code>DoctorId</code>, <code>Date</code>, <code>Time</code>, and <code>Status</code>.</li>
  <li><strong>Billing</strong>: Holds billing details with <code>BillingId</code>, <code>PatientId</code>, <code>Charges</code>, <code>PaymentStatus</code>, and <code>Date</code>.</li>
  <li><strong>MedicalRecords</strong>: Contains patient diagnoses, treatments, and prescriptions under <code>RecordId</code>, <code>PatientId</code>, <code>Diagnosis</code>, and <code>TreatmentPlan</code>.</li>
</ul>

<h3>Relationships</h3>
<ul>
  <li>One-to-many relationships between <code>Doctors</code> and <code>Appointments</code>.</li>
  <li>One-to-many relationships between <code>Patients</code> and <code>Appointments</code>.</li>
  <li>One-to-many relationships between <code>Patients</code> and <code>MedicalRecords</code>.</li>
  <li>One-to-one relationship between <code>Patients</code> and <code>Billing</code> records.</li>
</ul>

<h2 id="installation">Installation</h2>
<p>To set up the HospitalManagementSqlDatabase:</p>
<ol>
  <li>Clone the repository to your local machine:</li>
  <pre><code>https://github.com/MdAshikur-Rahman-Ashik/HospitalManagement_SQL-Server-Project</code></pre>
  <li>Open your SQL Server Management Studio (SSMS) or another SQL tool.</li>
  <li>Execute the <code>hospital_management_schema.sql</code> script provided in the repository to set up the database schema, tables, relationships, and stored procedures.</li>
  <li>The database is now ready to be populated with data.</li>
</ol>

<h2 id="usage">Usage</h2>

<h3 id="patient-management">Patient Management</h3>
<ul>
  <li><strong>Add a new patient</strong>: Use the <code>InsertPatient</code> stored procedure to add new patients to the system.</li>
  <li><strong>Update a patient</strong>: Modify patient details using the <code>UpdatePatient</code> procedure.</li>
  <li><strong>Delete a patient</strong>: Remove a patient from the database using the <code>DeletePatient</code> procedure.</li>
  <li><strong>View patients</strong>: Query the <code>Patients</code> table or use <code>GetPatients</code> stored procedure to retrieve patient information.</li>
</ul>

<h3 id="doctor-management">Doctor Management</h3>
<ul>
  <li><strong>Add a new doctor</strong>: Insert doctor details with the <code>InsertDoctor</code> procedure.</li>
  <li><strong>Update doctor details</strong>: Modify doctor information using the <code>UpdateDoctor</code> procedure.</li>
  <li><strong>Delete a doctor</strong>: Use the <code>DeleteDoctor</code> procedure to remove a doctor.</li>
  <li><strong>View doctors</strong>: Query the <code>Doctors</code> table or use <code>GetDoctors</code> stored procedure to view doctor data.</li>
</ul>

<h3 id="appointment-management">Appointment Management</h3>
<ul>
  <li><strong>Schedule an appointment</strong>: Use the <code>InsertAppointment</code> stored procedure to create a new appointment.</li>
  <li><strong>Update an appointment</strong>: Modify appointment details using the <code>UpdateAppointment</code> procedure.</li>
  <li><strong>Delete an appointment</strong>: Use <code>DeleteAppointment</code> to remove an appointment.</li>
  <li><strong>View appointments</strong>: Query the <code>Appointments</code> table or use <code>GetAppointments</code> stored procedure.</li>
</ul>

<h3 id="billing-management">Billing Management</h3>
<ul>
  <li><strong>Create a billing record</strong>: Use the <code>InsertBillingRecord</code> procedure for billing.</li>
  <li><strong>Update billing status</strong>: Modify payment status using the <code>UpdateBillingStatus</code> procedure.</li>
  <li><strong>Delete a billing record</strong>: Use <code>DeleteBillingRecord</code> to remove a billing record.</li>
  <li><strong>View billing records</strong>: Query the <code>Billing</code> table or use <code>GetBillingRecords</code> stored procedure.</li>
</ul>

<h3 id="medical-records-management">Medical Records Management</h3>
<ul>
  <li><strong>Add a medical record</strong>: Use the <code>InsertMedicalRecord</code> procedure to record diagnosis and treatment.</li>
  <li><strong>Update a medical record</strong>: Modify medical details using the <code>UpdateMedicalRecord</code> procedure.</li>
  <li><strong>Delete a medical record</strong>: Use <code>DeleteMedicalRecord</code> procedure to remove a record.</li>
  <li><strong>View medical records</strong>: Query the <code>MedicalRecords</code> table or use <code>GetMedicalRecords</code> stored procedure.</li>
</ul>

<h2 id="stored-procedures">Stored Procedures</h2>

<h3 id="patient-procedures">Patient Procedures</h3>
<ul>
  <li><code>InsertPatient</code>: Adds a new patient.</li>
  <li><code>UpdatePatient</code>: Updates patient information.</li>
  <li><code>DeletePatient</code>: Removes a patient from the system.</li>
  <li><code>GetPatients</code>: Retrieves patient records.</li>
</ul>

<h3 id="doctor-procedures">Doctor Procedures</h3>
<ul>
  <li><code>InsertDoctor</code>: Adds a new doctor.</li>
  <li><code>UpdateDoctor</code>: Updates doctor details.</li>
  <li><code>DeleteDoctor</code>: Deletes a doctor.</li>
  <li><code>GetDoctors</code>: Retrieves doctor data.</li>
</ul>

<h3 id="appointment-procedures">Appointment Procedures</h3>
<ul>
  <li><code>InsertAppointment</code>: Adds a new appointment.</li>
  <li><code>UpdateAppointment</code>: Updates appointment details.</li>
  <li><code>DeleteAppointment</code>: Deletes an appointment.</li>
  <li><code>GetAppointments</code>: Retrieves appointment information.</li>
</ul>

<h3 id="billing-procedures">Billing Procedures</h3>
<ul>
  <li><code>InsertBillingRecord</code>: Creates a new billing entry.</li>
  <li><code>UpdateBillingStatus</code>: Updates payment status.</li>
  <li><code>DeleteBillingRecord</code>: Deletes a billing record.</li>
  <li><code>GetBillingRecords</code>: Retrieves billing records.</li>
</ul>

<h3 id="medical-records-procedures">Medical Records Procedures</h3>
<ul>
  <li><code>InsertMedicalRecord</code>: Adds a medical record.</li>
  <li><code>UpdateMedicalRecord</code>: Updates record details.</li>
  <li><code>DeleteMedicalRecord</code>: Removes a medical record.</li>
  <li><code>GetMedicalRecords</code>: Retrieves medical record data.</li>
</ul>

<h2 id="contributing">Contributing</h2>
<p>Contributions are welcome! If you would like to contribute to this project, please follow these steps:</p>
<ol>
  <li>Fork the repository.</li>
  <li>Create a new branch (<code>git checkout -b feature-branch</code>).</li>
  <li>Make your changes and commit them (<code>git commit -m 'Add feature'</code>).</li>
  <li>Push to the branch (<code>git push origin feature-branch</code>).</li>
  <li>Open a pull request.</li>
</ol>

<h2 id="license">License</h2>
<p>This project is licensed under the MIT License - see the <a href="LICENSE">LICENSE</a> file for details.</p>
