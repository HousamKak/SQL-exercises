SELECT course.name
FROM course
WHERE course.startTime=(SELECT MIN(course.startTime) FROM course)