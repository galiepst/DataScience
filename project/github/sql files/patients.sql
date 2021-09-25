SELECT COUNT(*) AS num_patients, cum_week, 100*sum(case when CS_SEXO = 'M' then 1 else 0 end)/count(*) male_perc
 , AVG(year) AS year, AVG(CAST(month as int)) AS month

INTO dbo.patient_n
FROM dbo.all_patients1
GROUP BY cum_week

SELECT * FROM dbo.outcome