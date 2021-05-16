-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE Department (
    DeptNo VARCHAR NOT NULL,
    DeptName VARCHAR NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        DeptNo
     )
);

CREATE TABLE DepartmentManager (
    DeptNo VARCHAR   NOT NULL,
    EmpNo int   NOT NULL,
    CONSTRAINT pk_DepartmentManager PRIMARY KEY (
        DeptNo
     )
);

CREATE TABLE DepartmentEmp (
    EmpNo int   NOT NULL,
    DeptNo VARCHAR   NOT NULL
);

CREATE TABLE Employees (
    EmpNo int   NOT NULL,
    EmpTitle VARCHAR   NOT NULL,
    BirthDate date   NOT NULL,
    FirstName VARCHAR   NOT NULL,
    LastName VARCHAR   NOT NULL,
    Sex VARCHAR   NOT NULL,
    HireDate date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        EmpNo
     )
);

CREATE TABLE Salary (
    EmpNo int   NOT NULL,
    Salary int   NOT NULL,
    CONSTRAINT pk_Salary PRIMARY KEY (
        EmpNo
     )
);

CREATE TABLE Title (
    TitleId VARCHAR   NOT NULL,
    EmpTitle VARCHAR   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (
        TitleId
     ),
    CONSTRAINT uc_Title_EmpTitle UNIQUE (
        EmpTitle
    )
);

ALTER TABLE DepartmentManager ADD CONSTRAINT fk_DepartmentManager_DeptNo FOREIGN KEY(DeptNo)
REFERENCES Department (DeptNo);

ALTER TABLE DepartmentManager ADD CONSTRAINT fk_DepartmentManager_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE DepartmentEmp ADD CONSTRAINT fk_DepartmentEmp_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE DepartmentEmp ADD CONSTRAINT fk_DepartmentEmp_DeptNo FOREIGN KEY(DeptNo)
REFERENCES Department (DeptNo);

ALTER TABLE Employees DROP CONSTRAINT fk_Employees_EmpTitle FOREIGN KEY(EmpTitle)
REFERENCES Title (EmpTitle);

ALTER TABLE Salary ADD CONSTRAINT fk_Salary_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE Employees DROP CONSTRAINT fk_Employees_EmpTitle;

ALTER TABLE DepartmentManager DROP CONSTRAINT pk_DepartmentManager;

