SELECT  SUBSTRING(T1.added, 1, 7) as Month, T1.cnt1 as All_Reg, T2.cnt2 as Reg_Test1_Group, (T2.cnt2 * 100 /  T1.cnt1) as Сonversion_Test1_Group,
 T3.cnt3 as Reg_Control1_Group, (T3.cnt3 * 100 /  T1.cnt1) as Сonversion_Control1_Group, ((T3.cnt3 * 100 /  T1.cnt1) - (T2.cnt2 * 100 /  T1.cnt1))as Conversion_Growth_Control1_Group,
 (((T3.cnt3 * 100 /  T1.cnt1) - (T2.cnt2 * 100 /  T1.cnt1)) * 100 / (T3.cnt3 * 100 /  T1.cnt1)) as Efficiency_growth_Control1_Group
FROM
  (SELECT id, added, COUNT(*) AS cnt1
   FROM contact
   GROUP BY SUBSTRING(added, 1, 7)
   ) T1,
  (SELECT id, added, COUNT(*) AS cnt2
   FROM contact where status='registration' AND test_group='test1'
   GROUP BY SUBSTRING(added, 1, 7)
   ) T2,
  (SELECT id, added, COUNT(*) AS cnt3
   FROM contact where status='registration' AND test_group='control1'
   GROUP BY SUBSTRING(added, 1, 7)
   )  T3
WHERE SUBSTRING(T1.added, 1, 7) = SUBSTRING(T2.added, 1, 7) AND SUBSTRING(T2.added, 1, 7) = SUBSTRING(T3.added, 1, 7)
