-- SUBQUERY: Truy vấn con
-- là một truy vấn nằm trong truy vấn khác
-- Trả về 1 giá trị khi kích thước bảng (1 x )
-- Trả về nhiều giá trị dùng IN
-- =, >, <,...
-- VD: lấy ra department của account có id = 2
SELECT *
FROM department
JOIN account USING(department_id)
WHERE account_id =2;

SELECT department.*
FROM department
WHERE department_id IN
	(SELECT department_id
	FROM account
	WHERE account_id > 2 );

-- Toán tử: IN, ANY, ALL, EXISTS
-- VD: lấy ra câu hỏi có nhiều câu trả lời nhất

SELECT question.*
FROM question
LEFT JOIN answer USING (question_id)
GROUP BY question_id 
HAVING COUNT(answer_id) = 
	(SELECT MAX(answer_count)
	FROM 
		(SELECT COUNT(answer_id)  AS answer_count
		FROM question
		LEFT JOIN answer USING (question_id)
		GROUP BY question_id) AS temp);

-- VIEW: Bảng ảo là một bảng không lưu dữ liệu
-- VD: Tạo view chứa tất cả phòng ban
-- DROP VIEW IF EXISTS view
DROP VIEW IF EXISTS view_01;

CREATE VIEW view_01 AS
SELECT *
FROM department;

SELECT *
FROM view_01;

-- CTE: Bảng Tạm
-- VD: lấy ra câu hỏi có nhiều câu trả lời nhất 
WITH c1 AS(
	SELECT question.*,COUNT(answer_id) AS answer_count
    FROM question
    LEFT JOIN answer USING (question_id)
    GROUP BY question_id
)
SELECT *
FROM c1
WHERE answer_count = 
	(
	SELECT MAX(answer_count)
	FROM c1);

-- CTE RECURSIVE
WITH RECURSIVE c1 (month) AS (
	SELECT 1
    UNION ALL
    SELECT month + 2 FROM c1 WHERE month < 12
)
SELECT *
FROM c1;

-- VD: Thống kê mỗi tháng có bao nhiêu account
WITH RECURSIVE c1 (month) AS (
    SELECT 1
    UNION ALL
    SELECT month + 1 FROM c1 WHERE month < 12
), c2 AS (
    SELECT *, MONTH(created_date) AS month
    FROM account
)
SELECT month, COUNT(account_id)
FROM c1
LEFT JOIN c2 USING (month)
GROUP BY month;