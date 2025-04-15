DELETE FROM Payments;
DELETE FROM Session_Students;
DELETE FROM Sessions;

DBCC CHECKIDENT ('Sessions', RESEED, 0);



-- INSERT STUDENTS
INSERT INTO Students (FirstName, LastName, YearLevel, Email, PhoneNumber, ParentName, ParentPhone)
VALUES
('Lucille', 'Smith', 12, 'lucille@example.com', '0400000001', 'Parent Smith', '0490000001'),
('Sena', 'Lee', 12, 'sena@example.com', '0400000002', 'Parent Lee', '0490000002'),
('Angelina', 'Brown', 12, 'angelina@example.com', '0400000003', 'Parent Brown', '0490000003'),
('Gioran', 'Nguyen', 11, 'gioran@example.com', '0400000004', 'Parent Nguyen', '0490000004'),
('Jasmine', 'Lim', 12, 'jasmine@example.com', '0400000005', 'Parent Lim', '0490000005'),
('Mei Xin', 'Tan', 12, 'meixin@example.com', '0400000006', 'Parent Tan', '0490000006');

-- INSERT NEW SESSIONS (Jan 20 – Apr 14, 2025)

INSERT INTO Sessions (Subject, YearLevel, Date, Duration, SessionFee, Notes)
VALUES
-- Jan
('Mathematics', '12', '2025-01-20', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-01-22', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-01-22', 1.0, 90.00, 'Sena'),
('Mathematics', '12', '2025-01-23', 1.0, 90.00, 'Angelina'),
('Mathematics', '11', '2025-01-23', 1.0, 90.00, 'Gioran'),
('Mathematics', '12', '2025-01-27', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-01-29', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-01-29', 1.0, 90.00, 'Sena'),
('Mathematics', '12', '2025-01-30', 1.0, 90.00, 'Angelina'),

-- Feb
('Mathematics', '12', '2025-02-03', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-02-05', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-02-06', 1.0, 90.00, 'Angelina'),
('Mathematics', '11', '2025-02-06', 1.0, 90.00, 'Gioran'),
('Mathematics', '12', '2025-02-10', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-02-12', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-02-12', 1.0, 90.00, 'Sena'),
('Mathematics', '12', '2025-02-13', 1.0, 90.00, 'Angelina'),
('Mathematics', '12', '2025-02-17', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-02-19', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-02-19', 1.0, 90.00, 'Sena'),
('Mathematics', '12', '2025-02-24', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-02-26', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-02-27', 1.0, 90.00, 'Angelina'),

-- Mar
('Mathematics', '11', '2025-03-06', 1.0, 90.00, 'Gioran'),
('Mathematics', '12', '2025-03-10', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-03-12', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-03-12', 1.0, 90.00, 'Sena'),
('Mathematics', '12', '2025-03-13', 1.0, 90.00, 'Angelina'),
('Mathematics', '11', '2025-03-20', 1.0, 90.00, 'Gioran'),
('Mathematics', '12', '2025-03-24', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-03-26', 1.0, 100.00, 'Lucille'),

-- Apr
('Mathematics', '12', '2025-04-02', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-04-02', 1.0, 90.00, 'Sena'),
('Mathematics', '12', '2025-04-03', 1.0, 90.00, 'Angelina'),
('Mathematics', '11', '2025-04-03', 1.0, 90.00, 'Gioran'),
('Mathematics', '12', '2025-04-07', 1.0, 50.00, 'Jasmine and Mei'),
('Mathematics', '12', '2025-04-09', 1.0, 100.00, 'Lucille'),
('Mathematics', '12', '2025-04-09', 1.0, 90.00, 'Sena'),
('Mathematics', '12', '2025-04-10', 1.0, 90.00, 'Angelina');

-- INSERT SESSION-STUDENT LINKS

INSERT INTO Session_Students (SessionID, StudentID)
VALUES
-- Jasmine & Mei
(1, 5), (1, 6),
(6, 5), (6, 6),
(10, 5), (10, 6),
(14, 5), (14, 6),
(17, 5), (17, 6),
(21, 5), (21, 6),
(26, 5), (26, 6),
(31, 5), (31, 6),

-- Lucille
(2, 1),
(7, 1),
(11, 1),
(15, 1),
(18, 1),
(22, 1),
(27, 1),
(29, 1),
(34, 1),

-- Sena
(3, 2),
(8, 2),
(16, 2),
(19, 2),
(23, 2),
(30, 2),
(35, 2),

-- Angelina
(4, 3),
(9, 3),
(12, 3),
(16, 3),
(20, 3),
(24, 3),
(33, 3),
(36, 3),

-- Gioran (biweekly)
(5, 4),
(13, 4),
(25, 4),
(32, 4);

-- INSERT PAYMENTS (all Paid)
INSERT INTO Payments (StudentID, SessionID, AmountPaid, PaymentDate, Status)
VALUES
-- Jasmine & Mei
(5, 1, 50.00, '2025-01-20', 'Paid'), (6, 1, 50.00, '2025-01-20', 'Paid'),
(5, 6, 50.00, '2025-01-27', 'Paid'), (6, 6, 50.00, '2025-01-27', 'Paid'),
(5, 10, 50.00, '2025-02-03', 'Paid'), (6, 10, 50.00, '2025-02-03', 'Paid'),
(5, 14, 50.00, '2025-02-10', 'Paid'), (6, 14, 50.00, '2025-02-10', 'Paid'),
(5, 17, 50.00, '2025-02-17', 'Paid'), (6, 17, 50.00, '2025-02-17', 'Paid'),
(5, 21, 50.00, '2025-02-24', 'Paid'), (6, 21, 50.00, '2025-02-24', 'Paid'),
(5, 26, 50.00, '2025-03-24', 'Paid'), (6, 26, 50.00, '2025-03-24', 'Paid'),
(5, 31, 50.00, '2025-04-07', 'Paid'), (6, 31, 50.00, '2025-04-07', 'Paid'),

-- Lucille
(1, 2, 100.00, '2025-01-22', 'Paid'),
(1, 7, 100.00, '2025-01-29', 'Paid'),
(1, 11, 100.00, '2025-02-05', 'Paid'),
(1, 15, 100.00, '2025-02-12', 'Paid'),
(1, 18, 100.00, '2025-02-19', 'Paid'),
(1, 22, 100.00, '2025-02-26', 'Paid'),
(1, 27, 100.00, '2025-03-26', 'Paid'),
(1, 29, 100.00, '2025-04-02', 'Paid'),
(1, 34, 100.00, '2025-04-09', 'Paid'),

-- Sena
(2, 3, 90.00, '2025-01-22', 'Paid'),
(2, 8, 90.00, '2025-01-29', 'Paid'),
(2, 16, 90.00, '2025-02-12', 'Paid'),
(2, 19, 90.00, '2025-02-19', 'Paid'),
(2, 23, 90.00, '2025-03-12', 'Paid'),
(2, 30, 90.00, '2025-04-02', 'Paid'),
(2, 35, 90.00, '2025-04-09', 'Paid'),

-- Angelina
(3, 4, 90.00, '2025-01-23', 'Paid'),
(3, 9, 90.00, '2025-01-30', 'Paid'),
(3, 12, 90.00, '2025-02-06', 'Paid'),
(3, 16, 90.00, '2025-02-12', 'Paid'),
(3, 20, 90.00, '2025-02-13', 'Paid'),
(3, 24, 90.00, '2025-03-13', 'Paid'),
(3, 33, 90.00, '2025-04-03', 'Paid'),
(3, 36, 90.00, '2025-04-10', 'Paid'),

-- Gioran
(4, 5, 90.00, '2025-01-23', 'Paid'),
(4, 13, 90.00, '2025-02-06', 'Paid'),
(4, 25, 90.00, '2025-03-20', 'Paid'),
(4, 32, 90.00, '2025-04-03', 'Paid');