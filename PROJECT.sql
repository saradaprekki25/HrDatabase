create database HR_Analytics_Database;

use HR_Analytics_Database;


-->Department Table
 create table DepartmentDetails(
	Department_code varchar(20) primary key,
	Manager varchar(20),
);
go

-->Employee Table
create table EmployeeDetails(
	Emp_Id int primary key,
	First_Name varchar(10),
	Last_Name varchar(10),
	Gender char(1) check (Gender in ('M','F')),
	Hiring_Date date,
	Employee_Status varchar(10),
	Email varchar(10),
	Phone_Number int,
	Location_of_Emp varchar(30),
	Department_code varchar(20),
	foreign key (Department_code) references DepartmentDetails(Department_code)

);
go

-->Salary Table
create table SalaryDetails(
	Salary_ID int primary key,
	Gross_Salary int not null,
	Emp_Id int not null,
	foreign key (Emp_Id) references EmployeeDetails(Emp_Id)
);
go

-->Attendance Table
create table AttendanceTable(
	Record_ID INT identity (1,1)PRIMARY KEY,
    Emp_Id INT,
    Attendance_DYM DATE,
    Entering_Time TIME,
    Status_of_Emp VARCHAR(10) CHECK (Status_of_Emp IN ('Present','Absent')),
    FOREIGN KEY (Emp_Id) REFERENCES EmployeeDetails(Emp_Id)
);
go

-->Inserting data into Department table
insert into DepartmentDetails(Department_code, Manager) values 
	('HR', 'Arjun'),
	('R&D', 'Latha'),
	('Finance', 'Vijay'),
	('Marketing', 'Neeraja'
);

--> Inserting data into Employee Table 
insert into EmployeeDetails(Emp_Id,First_Name, Last_Name, Gender, Hiring_Date, Employee_Status, Email,Phone_Number, Location_of_Emp, Department_code)
values	
		(001, 'Vijay', 'Kumar', 'M', '2022-09-22', 'Working', 'vijaykumar',19118101,'Hyderabad', 'Finance'),
		(002, 'Arjun', 'Sarkar', 'M', '2024-08-08', 'Working', 'arjuns',19118102,'Visakhapatnam', 'Marketing'),
		(003, 'Neeraja', 'Ratnam', 'F', '2023-11-23', 'Working', 'ratnamn',19118104,'Hyderabad', 'Finance'),
		(004, 'Latha', 'Devi', 'F', '2025-05-26', 'Working', 'lathad',19118105,'Kurnool', 'HR');

--> Inserting Data into Salary Table
insert into SalaryDetails(Gross_Salary, Emp_Id) 
values	(45000,1),
		(32000,2),
		(29000,3),
		(30000,4);

--> Inserting Data into attendance Table
insert into AttendanceTable(Emp_Id, Attendance_DYM, Entering_Time, Status_of_Emp) 
values	(1,'2025-11-10','09:20:08', 'Present'),
		(2,'2025-11-10','09:15:00', 'Present'),
		(3,'2025-11-10','00:00:00', 'Absent'),
		(4,'2025-11-10','09:48:55', 'Present');

--> viewing tables
use HR_Analytics_Database
select * from AttendanceTable
select * from DepartmentDetails
select * from EmployeeDetails
select * from SalaryDetails;

--> Joining tables
use HR_Analytics_Database
select e.First_Name as Employee_Name, s.Gross_Salary
from EmployeeDetails e
join SalaryDetails s on e.Emp_Id=s.Emp_Id;
