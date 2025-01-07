CREATE DATABASE testing_system;

DROP DATABASE IF EXISTS testing_system;

USE testing_system;
CREATE TABLE department(
	department_id INT PRIMARY KEY AUTO_INCREMENT,
	department_name VARCHAR(50)
);
INSERT INTO department (department_name)
VALUES (N'Marketing'),
		(N'Bảo vệ'),	
        (N'Nhân sự'),
        (N'Kỹ thuật'),
        (N'Tài chính'),
        (N'Sale');
SELECT * FROM department;

CREATE TABLE position (
	position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name VARCHAR(50)
);
INSERT INTO position (position_name)
VALUES (N'Giám đốc'),
		(N'Nhân Viên'),	
        (N'Kế toán'),
        (N'Sale'),
        (N'Phó giám đốc'),
        (N'Nhân sự');

CREATE TABLE `account` (
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) UNIQUE KEY,
    username VARCHAR(50),
    fullname VARCHAR(50),
    department_id INT,
    position_id INT,
    create_date DATE
);
SELECT * FROM account;
TRUNCATE TABLE account;
INSERT INTO account (email, username, fullname, department_id, position_id,create_date)
VALUES ('a@gmail.com',N'A', 'Nguyễn Văn A',1,1,NOW()),
		('b@gmail.com',N'B', 'Nguyễn Văn B',2,2,NOW()),
        ('c@gmail.com',N'C', 'Nguyễn Văn C',3,3,NOW()),
        ('d@gmail.com',N'D', 'Nguyễn Văn D',4,4,NOW()),
        ('e@gmail.com',N'E', 'Nguyễn Văn E',5,5,NOW());

CREATE TABLE `group` (
	group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name varchar(50),
    creator_id INT,
    create_date DATE
);
INSERT INTO `group` (group_name, creator_id, create_date) VALUES
('Group Alpha', 1, '2023-01-10'),
('Group Beta', 2, '2023-02-15'),
('Group Gamma', 3, '2023-03-20'),
('Group Delta', 4, '2023-04-25'),
('Group Epsilon', 5, '2023-05-30');

CREATE TABLE group_account (
	group_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    join_date DATE
);
INSERT INTO group_account (account_id, join_date) VALUES
(101, '2023-01-15'),
(102, '2023-02-20'),
(103, '2023-03-25'),
(104, '2023-04-10'),
(105, '2023-05-05');
CREATE TABLE type_question (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM("Essay", "Multiple-Choice")
);
INSERT INTO type_question (type_name) VALUES
('Essay'),
('Multiple-Choice'),
('Essay'),
('Multiple-Choice'),
('Essay');

TRUNCATE TABLE category_question;
DROP  TABLE category_question;
CREATE TABLE category_question (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name ENUM ('Java', '.NET', 'SQL', 'Postman', 'Ruby')
);
INSERT INTO category_question (category_name) VALUES
('Java'),
('.NET'),
('SQL'),
('Postman'),
('Ruby');

CREATE TABLE `question` (
	question_id INT PRIMARY KEY AUTO_INCREMENT,
    content varchar(100) NOT NULL,
    category_id INT,
    type_id INT,
    creator_id INT,
    create_date DATE
);
INSERT INTO `question` (content, category_id, type_id, creator_id, create_date) VALUES
('What is Java?', 1, 2, 101, '2023-01-15'),
('Explain polymorphism in OOP.', 1, 1, 102, '2023-02-20'),
('What is a JOIN in SQL?', 3, 2, 103, '2023-03-25'),
('How to test an API in Postman?', 4, 2, 104, '2023-04-10'),
('What is Ruby on Rails?', 5, 1, 105, '2023-05-05');

CREATE TABLE answer (
	answer_id INT PRIMARY KEY AUTO_INCREMENT,
    content varchar(255) NOT NULL,
    question_id INT,
    is_correct BOOLEAN
);
INSERT INTO answer (content, question_id, is_correct) VALUES
('Java is a programming language.', 1, TRUE),
('Java is a database system.', 1, FALSE),
('Polymorphism means many forms.', 2, TRUE),
('A JOIN is used to combine tables.', 3, TRUE),
('Postman is used to write SQL queries.', 4, FALSE);

CREATE TABLE exam (
	exam_id INT PRIMARY KEY AUTO_INCREMENT,
    code varchar(50) NOT NULL,
    title varchar(255),
    category_id INT,
    duration VARCHAR(10),
    creator_id INT,
    creator_date DATE
);
INSERT INTO exam (code, title, category_id, duration, creator_id, creator_date) VALUES
('EXAM001', 'Java Basics Exam', 1, '90', 101, '2023-01-15'),
('EXAM002', '.NET Core Exam', 2, '120', 102, '2023-02-20'),
('EXAM003', 'SQL Fundamentals', 3, '60', 103, '2023-03-25'),
('EXAM004', 'Postman API Testing', 4, '75', 104, '2023-04-10'),
('EXAM005', 'Ruby Programming', 5, '90', 105, '2023-05-05');
CREATE TABLE exam_question (
	exam_id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT
);
INSERT INTO exam_question (question_id) VALUES
( 1),
(2),
(3),
(4),
(5);