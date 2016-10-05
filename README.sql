SELECT name, surname
FROM student s
JOIN student_status ss ON (s.id = ss.student_id)
JOIN (SELECT max(id) AS id FROM student_status GROUP BY student_id) maxid ON (maxid.id = ss.id)
JOIN (SELECT student_id FROM payments WHERE amount != 0 GROUP BY student_id HAVING count(*) <= 3) p ON (p.student_id = s.id)
WHERE status = 'lost'
