CREATE TABLE students (
    student_id INT PRIMARY KEY, --used int so i can input the IDs manually
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    address TEXT
);

CREATE TABLE fees_payments (
    payment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT
);

CREATE TABLE course_enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    enrollment_date DATE NOT NULL
);


CREATE TABLE lectures (
    lecture_id SERIAL PRIMARY KEY,
    lecture_name VARCHAR(100) NOT NULL,
    lecture_email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    office_address TEXT
);

CREATE TABLE lecture_course_assignment (
    assignment_id SERIAL PRIMARY KEY,
    lecture_id INT REFERENCES lectures(lecture_id),
    course_id INT REFERENCES courses(course_id),
    assignment_date DATE NOT NULL
);

CREATE TABLE lecture_ta_assignment (
    ta_assignment_id SERIAL PRIMARY KEY,
    lecture_id INT REFERENCES lectures(lecture_id),
    ta_name VARCHAR(100) NOT NULL,
    ta_email VARCHAR(100) NOT NULL UNIQUE,
    assignment_date DATE NOT NULL
);

INSERT INTO courses (course_name, course_description)
VALUES(
'CBAS210 ACADEMIC WRITING II', 'WRITING SKILLS'),
('CPEN202 COMPUTER SYSTEMS DESIGN', 'TECH SYSTEMS DESIGNING'),
('CPEN204 DATA STRUCTURES &ALGORITHMS', 'SORTING ALGORITHM'),
('CPEN206 LINEAR CIRCUIT', 'LINEAR COMPONENTS & USES'),	
('CPEN208 SOFTWARE ENGINEERING', 'PRACTICALITY AND DESIGN'),
('CPEN212 DATA COMMUNICATIONS', 'DATA AND SIGNALS TRANSMISSION'),	
('SENG202 DIFFERENTIAL EQUATIONS', 'CALCULUS 2');

ALTER TABLE lecture_ta_assignment RENAME COLUMN ta_assignment_id TO ta_id

ALTER TABLE lecture_ta_assignment
DROP COLUMN assignment_date;

Alter table lecture_course_assignment
Drop column assignment_id;

Alter table lecture_course_assignment
Drop column assignment_date;

INSERT INTO lecture_course_assignment (lecture_id, course_id)
VALUES(
1,5),
(2,4),
(3,1),
(4,6),
(5,3),
(6,2),
(7,7);


DO $$
DECLARE
    student RECORD;
    course_id INT;
    enrollment_date DATE;
    start_date DATE := '2024-01-01';
    end_date DATE := '2024-12-31';
BEGIN
    FOR student IN SELECT student_id FROM students LOOP
        FOR course_id IN 1..7 LOOP
            -- Generate a random enrollment date in 2024
            enrollment_date := start_date + (random() * (end_date - start_date))::int;
            
            -- Insert the enrollment record
            INSERT INTO course_enrollment (student_id, course_id, enrollment_date)
            VALUES (student.student_id, course_id, enrollment_date);
        END LOOP;
    END LOOP;
END $$;


CREATE OR REPLACE FUNCTION calculate_outstanding_fees()
RETURNS JSON AS $$
DECLARE
    result JSON;
BEGIN
    SELECT json_agg(json_build_object(
        'student_id', s.student_id,
        'student_name', s.student_name,
        'outstanding_fees', 4000 - COALESCE((SELECT SUM(amount) FROM fees_payments WHERE student_id = s.student_id), 0)
    )) INTO result
    FROM students s;

    RETURN result;
END;
$$ LANGUAGE plpgsql;


SELECT calculate_outstanding_fees();
