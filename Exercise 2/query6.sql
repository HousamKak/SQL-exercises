
SELECT COUNT(student_id)
FROM enrolled
WHERE student_id IN
(SELECT student_id FROM majorin WHERE department_id= (SELECT department_id FROM department WHERE department.name='CS')) 
AND Course_crn=(SELECT course.crn FROM course WHERE course.name='CSC275')
