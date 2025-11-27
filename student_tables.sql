CREATE TABLE students_raw (
    student_id INT,
    student_name VARCHAR(50),
    student_phone VARCHAR(20),
    course_list TEXT,         
    course_instructor TEXT
);

INSERT INTO students_raw VALUES
(1, 'Ali', '03001234567', 'Math, Physics', 'Mr. Ahmed, Mr. Bilal'),
(2, 'Sara', '03114567890', 'Math, Chemistry', 'Mr. Ahmed, Ms. Hina'),
(3, 'Afaq', '03335678901', 'Physics', 'Mr. Bilal');


select * from students_raw;




-- Student basic info
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    student_phone VARCHAR(20)
);

-- Courses table (still simple)
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    instructor_name VARCHAR(50)
);


-- Enrollment table (linking student to courses)
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



INSERT INTO students VALUES
(1, 'Ali', '03001234567'),
(2, 'Sara', '03114567890'),
(3, 'Afaq', '03335678901');


INSERT INTO courses (course_name, instructor_name) VALUES
('Math', 'Mr. Ahmed'),
('Physics', 'Mr. Bilal'),
('Chemistry', 'Ms. Hina');


INSERT INTO enrollment (student_id, course_id) VALUES
(1, 1),  -- Ali → Math
(1, 2),  -- Ali → Physics
(2, 1),  -- Sara → Math
(2, 3),  -- Sara → Chemistry
(3, 2);  -- Afaq → Physics


SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;

SELECT s.student_name, c.course_name, c.instructor_name
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;






CREATE TABLE instructors (
    instructor_id SERIAL PRIMARY KEY,
    instructor_name VARCHAR(50)
);


CREATE TABLE courses_3nf (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE course_instructors (
    course_instructor_id SERIAL PRIMARY KEY,
    course_id INT,
    instructor_id INT,
    FOREIGN KEY (course_id) REFERENCES courses_3nf(course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);


INSERT INTO instructors (instructor_name) VALUES
('Mr. Ahmed'),
('Mr. Bilal'),
('Ms. Hina');

INSERT INTO courses_3nf (course_name) VALUES
('Math'),
('Physics'),
('Chemistry');

INSERT INTO course_instructors (course_id, instructor_id) VALUES
(1, 1),  -- Math → Mr. Ahmed
(2, 2),  -- Physics → Mr. Bilal
(3, 3);  -- Chemistry → Ms. Hina


-- Already exists
SELECT * FROM enrollment;


SELECT s.student_name, c.course_name, i.instructor_name
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN courses_3nf c ON e.course_id = c.course_id
JOIN course_instructors ci ON c.course_id = ci.course_id
JOIN instructors i ON ci.instructor_id = i.instructor_id;
