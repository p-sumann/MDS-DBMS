CREATE DATABASE eca_academy;

USE eca_academy;

CREATE TABLE students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20),
  date_of_birth DATE,
  enrollment_date DATE NOT NULL
);

CREATE TABLE courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  course_description TEXT,
  course_duration INT NOT NULL,
  course_fee DECIMAL(10,2) NOT NULL
);

CREATE TABLE enrollments (
  enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrollment_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE instructors (
  instructor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20),
  expertise VARCHAR(100)
);

CREATE TABLE course_instructors (
  course_instructor_id INT AUTO_INCREMENT PRIMARY KEY,
  course_id INT NOT NULL,
  instructor_id INT NOT NULL,
  FOREIGN KEY (course_id) REFERENCES courses(course_id),
  FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE instruments (
  instrument_id INT AUTO_INCREMENT PRIMARY KEY,
  instrument_name VARCHAR(100) NOT NULL,
  instrument_type VARCHAR(50) NOT NULL
);

CREATE TABLE student_instruments (
  student_instrument_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  instrument_id INT NOT NULL,
  proficiency_level VARCHAR(50) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (instrument_id) REFERENCES instruments(instrument_id)
);