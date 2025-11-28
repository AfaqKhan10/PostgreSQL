


CREATE TABLE students_balance (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

INSERT INTO students_balance (name, balance) VALUES
('Afaq', 1000),
('Ali', 500);



select * from students_balance;

BEGIN;

UPDATE students_balance
SET balance = balance - 200
WHERE name = 'Afaq';

UPDATE students_balance
SET balance = balance + 200
WHERE name = 'Ali';

COMMIT;


BEGIN;

UPDATE students_balance
SET balance = balance - 500
WHERE name = 'Afaq';

-- Ye galat column hai, error aayega
UPDATE students_balance
SET wrong_column = 999
WHERE name = 'Ali';


ROLLBACK;

SELECT * FROM students_balance;

