-- ===============================================================LESSON-02===================================================
-- Mệnh đề SELECT
-- CRTL + ENTER
SELECT CURRENT_DATE AS "today" ,PI() AS "PI",'MYSQL' AS "Language";

-- Mệnh đề FROM
-- VD: lấy ra tất cả phòng ban
SELECT  department_id, department_name
FROM department;

-- VD lấy tất cả đè thi
SELECT *
FROM exam;

-- VD lấy ra duration trong đề thi không trùng nhau
SELECT DISTINCT duration
FROM exam;

--  Mệnh đề WHERE 
-- Toán tử so sánh >, >=, =, <, <=, != or (<>)
-- VD lấy ra phòng ban có id > 5
SELECT *
FROM department
WHERE department_id > 5;

-- Toán tử quan hệ: AND , OR
SELECT *
FROM department
WHERE department_id > 5 AND department_id < 9;

-- Toán tử BETWEEN ... AND ...
SELECT *
FROM department
WHERE department_id BETWEEN 6 AND 9;

-- Toán tử IN / NOT IN 
-- VD lấy ra phòng ban có ID là số chẵn từ 2 - 8
SELECT *
FROM department
WHERE department_id NOT IN (2, 4, 6, 8);

-- Toán tử LIKE / NOT LIKE
-- _: Đại diện cho 1 kí tự bất kỳ
-- %: Đại diện cho 0 hoặc nhiều kí tự bất kỳ
-- VD: lấy ra phòng ban chứ kí tự "n" 
SELECT *
FROM department
WHERE department_name LIKE BINARY "%N%" AND department_name LIKE BINARY "%o";

-- Toán từ IS NULL / NOT NULL
-- VD
SELECT *
FROM department
WHERE department_name IS NOT NULL;
 
 -- Mệnh đề ORDER BY
 -- Tăng dâng ASC (mặc định)
 -- Giảm dâng DESC 
 -- VD: lấy ra đề thi sắp xếp theo create_date tăng dần
 
 SELECT *
 FROM exam
 ORDER BY created_date ASC;
-- VD:  lấy ra đề thi tăng dần duration, create_date giảm dần
SELECT * 
FROM exam 
ORDER BY duration ASC, created_date DESC;	

-- Mệnh đề LIMIT
-- VD: lấy ra phòng ban có id lớn nhất 
SELECT * 
FROM department
ORDER BY department_id DESC
LIMIT 2;
CREATE DATABASE lesson_03;
USE lesson_03;
-- ===============================================================LESSON-03===================================================
-- AGGREGATE FUNCTION: Các hàm tổng hợp
-- COUNT()
-- COUNT(*):Đếm số dòng
-- COUNT(departname_name): Đếm số dòng có department_name khác null 
-- COUNT(DISTINCT ) :Đếm số dòng không trùng nhau
-- Chú ý: ÁP DỤNG CHO CÁC GIÁ TRỊ KHÁC NULL
-- VD:lấy ra số lượng phòng ban
SELECT COUNT(*), 
COUNT(duration),
COUNT(DISTINCT duration), 
COUNT(1), 
SUM(duration),
MIN(duration),
MAX(duration),
AVG(duration)
FROM exam;
-- SUM()
-- MIN()
-- MAX()
-- AVG()

-- Mệnh đề GROUP BY
-- VD: Thống kê mỗi chức vụ có bn nhân viên
SELECT position_id,COUNT(account_id) AS account_count
FROM account
GROUP BY position_id
HAVING position_id = 1;

-- Mệnh đề HAVING :nằm ngay dưới GROUP BY
-- VD: lấy ra chức vụ có nhiều hơn 2 nhân viên
SELECT position_id,COUNT(account_id) AS account_count
FROM account
GROUP BY position_id
HAVING position_id > 2;

-- Cập nhật dữ liệu
-- VD:cập nhật tên phòng ban số 1 thành "Phòng chờ"
UPDATE department
SET	department_name = "Marketing"
WHERE department_id = 1;

-- xóa dữ iệu
-- VD: xóa phòng ban số 1
DELETE FROM department
WHERE department_id = 1;
