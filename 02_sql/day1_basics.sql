-- Day 1: PostgreSQL basics

-- Create a sample table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT
);

-- Insert sample data
INSERT INTO students VALUES
(1, 'Jayant', 22),
(2, 'Amit', 23),
(3, 'Priya', 21);

-- Query 1: Select all records
SELECT * FROM students;

-- Query 2: Filter using WHERE
SELECT * FROM students WHERE age > 21;

-- Query 3: Count records
SELECT COUNT(*) FROM students;

-- Query 4: Order results
SELECT * FROM students ORDER BY age DESC;

-- Query 5: Limit results
SELECT * FROM students LIMIT 2;
