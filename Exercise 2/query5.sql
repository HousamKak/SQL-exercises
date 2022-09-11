SELECT student_id
FROM student
WHERE student_id NOT IN
(SELECT DISTINCT student_id
FROM enrolled)