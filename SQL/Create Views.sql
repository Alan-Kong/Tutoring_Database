-- 1. View total student payment
GO
CREATE VIEW vw_StudentTotal_Payments AS
SELECT
    s.StudentID,
    s.FirstName + ' ' + s.LastName AS StudentName,
    COUNT(DISTINCT p.SessionID) AS SessionsPaid,
    SUM(p.AmountPaid) AS TotalPaid
FROM Students s
LEFT JOIN Payments p ON s.StudentID = p.StudentID
GROUP BY s.studentID, s.FirstName, s.LastName;

-- 2. View of student session history
GO
CREATE VIEW vw_StudentSessionHistory AS
SELECT 
    s.StudentID,
    s.FirstName + ' ' + s.LastName AS StudentName,
    se.SessionID,
    se.Subject,
    se.Date,
    se.YearLevel,
    se.Duration,
    se.Notes
FROM Students s
JOIN Session_Students ss ON s.StudentID = ss.StudentID
JOIN Sessions se ON ss.SessionID = se.SessionID;
