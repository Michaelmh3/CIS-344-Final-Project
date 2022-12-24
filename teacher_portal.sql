create database teachers_portal;
use teachers_portal;

CREATE TABLE students 
(
  studentId INT NOT NULL auto_increment,
  studentName VARCHAR(45) NOT NULL,
  enrolledInCourseID INT DEFAULT 1,
  grade FLOAT NULL,
  PRIMARY KEY (studentId)
);

CREATE TABLE IF NOT EXISTS courses 
(
  courseId INT NOT NULL auto_increment,
  courseName VARCHAR(45) NOT NULL,
  PRIMARY KEY (courseId)
);

INSERT INTO students (studentName, enrolledInCourseID, grade)
VALUES ('Maria Jozef', 1, 90.0),
       ('Linda Jones', 2, 89.0),
       ('John McGrail', 1, 98.0),
       ('Patty Luna', 2, 78.0);

INSERT INTO courses (courseName)
VALUES ("Database Design"), ("Calculus"), ("Physics I");

delimiter //
CREATE PROCEDURE studentsWithGrade()
BEGIN
    SELECT * FROM students LEFT JOIN courses 
    ON students.enrolledInCourseID = courses.courseID;
END//

CREATE PROCEDURE showStudent(IN stu_id INT)
BEGIN
		SELECT * FROM students where studentId = stu_id;
        END//

        
delimiter ;
