SELECT student_id FROM payments
GROUP BY student_id
ORDER BY SUM(amount) DESC
LIMIT 1,1
