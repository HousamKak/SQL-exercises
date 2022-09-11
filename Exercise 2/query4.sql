SELECT course.name
FROM course
WHERE course.crn=
(SELECT Course_crn
FROM enrolled
WHERE student_id=
(SELECT student_id
FROM majorin
WHERE 
majorin.department_id=(SELECT department_id FROM department WHERE department.name='BIF')))