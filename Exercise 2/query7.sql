
SELECT COUNT(student_id)
FROM enrolled
WHERE student_id IN
(SELECT student_id FROM majorin WHERE department_id= (SELECT department_id FROM department WHERE department.name='CS')) 
