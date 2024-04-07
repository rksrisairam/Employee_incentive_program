SELECT * 
FROM Absenteeism_at_work a 
left join compensation b
ON a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number

--taking healthy individual for bonus
SELECT * FROM Absenteeism_at_work
WHERE Social_drinker = 0 AND Social_smoker = 0 and 
Body_mass_index <25 and 
Absenteeism_time_in_hours <(SELECT avg(Absenteeism_time_in_hours) FROM Absenteeism_at_work)

--compensation for non-smokers/Budget allocated is $9,83,221/ 0.68 cent to be compensated(Bonus) per hr/ $1414.4 per year for an employee
SELECT COUNT(*)as nonsmokers FROM Absenteeism_at_work
WHERE Social_smoker = 0

--optimizes the query
SELECT
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index < 18.5 THEN 'Underweight'
	 WHEN Body_mass_index BETWEEN 18.5 and 25 THEN 'Healthy'
	 WHEN Body_mass_index BETWEEN 25 and 30 THEN 'Overweight'
	 WHEN Body_mass_index > 30 THEN 'Obese'
	 ELSE 'unknown' END as BMI_Category,
CASE WHEN Month_of_absence IN (12,1,2) Then 'Winter'
     WHEN Month_of_absence IN (3,4,5) Then 'Spring'
	 WHEN Month_of_absence IN (6,7,8) Then 'Summer'
	 WHEN Month_of_absence IN (9,10,11) Then 'Fall'
	 ELSE 'Unknown' END AS SEASON_NAMES,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
FROM Absenteeism_at_work a 
left join compensation b
ON a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number


