SELECT  SUBSTRING(T1.added, 1, 7) as Month, T1.cnt1 as All_Reg, T2.cnt2 as Finished_Reg, (T2.cnt2 * 100 /  T1.cnt1) as Сonversion
FROM
  (SELECT id, added, COUNT(*) AS cnt1
   FROM contact
   GROUP BY SUBSTRING(added, 1, 7)
   ) T1,
  (SELECT id, added, COUNT(*) AS cnt2
   FROM contact where status='registration'
   GROUP BY SUBSTRING(added, 1, 7)
   ) T2
WHERE SUBSTRING(T1.added, 1, 7) = SUBSTRING(T2.added, 1, 7)
