-- 1. Students Table
CREATE TABLE students(
    StudentID INT PRIMARY KEY IDENTITY(1,1), 
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    YearLevel INT CHECK (YearLevel BETWEEN 1 AND 12) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20) NOT NULL,
    ParentName VARCHAR(100),
    ParentPhone VARCHAR(20),
    CreatedDate DATE DEFAULT GETDATE(),
    LastSessionDate DATE,
    Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active', 'Inactive'))
);

-- 2. Sessions Table
CREATE TABLE Sessions (
    SessionID INT PRIMARY KEY IDENTITY(1,1),
    Subject VARCHAR(50) NOT NULL,
    YearLevel VARCHAR(10) CHECK ((YearLevel BETWEEN 1 AND 12)), 
    Date DATE NOT NULL DEFAULT GETDATE(),
    Duration DECIMAL(4,2) CHECK (Duration > 0) DEFAULT 1.00,
    SessionFee DECIMAL(5,2) CHECK (SessionFee >= 0) DEFAULT 100.00,
    Notes TEXT
);

-- 3. Session with Students
CREATE TABLE Session_Students (
    SessionStudentID INT PRIMARY KEY IDENTITY(1,1),
    SessionID INT NOT NULL,
    StudentID INT NOT NULL,
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- 4. Session with Payments
CREATE TABLE Payments (
    PayID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    SessionID INT NOT NULL,
    AmountPaid DECIMAL(10,2) CHECK (AmountPaid >= 0),
    PaymentDate DATE DEFAULT GETDATE(),
    Status VARCHAR(20) DEFAULT 'Pending' CHECK(Status IN('Paid', 'Pending', 'Overdue', 'Partial', 'Cancelled', 'Refunded')),
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

