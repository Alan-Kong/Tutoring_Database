-- Fires after inserting new session to update last session date
GO
CREATE TRIGGER trg_UpdateLastSessionDate
ON Session_Students
AFTER INSERT
AS
BEGIN
    UPDATE s
    SET LastSessionDate = ss.Date
    FROM Students s
    JOIN inserted i ON s.StudentID = i.StudentID
    JOIN Sessions ss ON ss.SessionID = i.SessionID
END

-- Fires after a new payment is inserted
GO
CREATE TRIGGER trg_UpdatePaymentStatus
ON Payments
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET Status = 'Paid'
    FROM Payments p
    JOIN inserted i ON p.PayID = i.PayID
    WHERE p.AmountPaid >= (SELECT SessionFee FROM Sessions WHERE SessionID = p.SessionID)
END
