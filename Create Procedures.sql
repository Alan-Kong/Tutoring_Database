-- 1. Add a new student
GO
CREATE PROCEDURE AddStudent
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @YEARLevel INT,
    @Email VARCHAR(100),
    @PhoneNumber VARCHAR(20),
    @ParentName VARCHAR(100),
    @ParentPhone VARCHAR(20)
AS
BEGIN
    INSERT INTO Students (FirstName, LastName, YEARLevel, Email, PhoneNumber, ParentName, ParentPhone)
    VALUES (@FirstName, @LastName, @YEARLevel, @Email, @PhoneNumber, @ParentName, @ParentPhone)
END;

-- 2. Record a payment
GO
CREATE PROCEDURE AddPayment
    @StudentID INT,
    @SessionID INT,
    @AmountPaid DECIMAL(10,2),
    @PaymentDate DATE
AS
BEGIN
    INSERT INTO Payments (StudentID, SessionID, AmountPaid, PaymentDate)
    VALUES (@StudentID, @SessionID, @AmountPaid, @PaymentDate)
END;

-- 3. View all sessions for a student
GO
CREATE PROCEDURE GetSessionsForStudent
    @StudentID INT
AS
BEGIN
    SELECT s.SessionID, s.Subject, s.Date, s.YearLevel, s.Duration, s.SessionFee, s.Notes
    FROM Sessions s
    JOIN Session_Students ss ON s.SessionID = ss.SessionID
    WHERE ss.StudentID = @StudentID
    ORDER BY s.Date DESC
END;

-- 4. Updates year levels every year and archives students above year 12
GO
CREATE PROCEDURE UpdateYearLevelAndArchiveStudents
AS
BEGIN
    UPDATE students
    SET YEARLevel = YEARLevel + 1
    WHERE Status = 'Active' AND YEARLevel < 12;

    UPDATE students
    SET Status = 'Archived'
    WHERE YEARLevel > 12;
END;