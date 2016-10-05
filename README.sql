SELECT name, surname
FROM student s
JOIN student_status ss ON (s.id = ss.student_id)
JOIN (SELECT max(id) AS id FROM student_status GROUP BY student_id) maxid ON (maxid.id = ss.id)
WHERE gender = 'unknown' AND status = 'vacation'
