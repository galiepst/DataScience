-- This was repeated for all 5 climate data files, with the change of the FROM statement. 

SELECT CAST(cum_week AS int) AS cum_week1 , AVG(avg_atm_pressure) wk_atm_p,
AVG(avg_dew_point_temp) AS wk_dew_p, 
AVG(max_temp) AS wk_avg_max_tmp, MAX(max_temp) AS wk_max_tm, AVG(med_temp) AS wk_avg_tm,
MIN(min_temp) AS wk_min_tm, AVG(min_temp) AS wk_avg_min_tmp, AVG(avg_humidity) AS wk_avg_hum,
MIN(min_humidity) AS wk_min_hum, AVG(max_blast_wind)AS avg_max_blast_w, MAX(max_blast_wind)AS max_blast_w,
AVG(CAST(wind_speed AS float)) AS avg_wind_speed, AVG(CAST(daily_precipitation AS float)) AS wk_avg_precipitation
,AVG (Altitude) As avg_alt, AVG (Latitude) As avg_lat,  AVG (Longitude) As avg_long, 

FROM dbo.Coronel_Pacheco1
GROUP BY cum_week
ORDER BY cum_week1

--Combine all areas into one file

SELECT * 
INTO dbo.avg_temps
FROM dbo.avg_Juiz_de_fora
UNION ALL
SELECT * FROM dbo.avg_Coronel_Pacheco
UNION ALL 
SELECT * FROM dbo.avg_Vicosa
UNION ALL 
SELECT * FROM dbo.avg_muriae
UNION ALL 
SELECT * FROM dbo.avg_Manhuacu
ORDER BY cum_week1



SELECT * 
INTO dbo.num_patients1
FROM dbo.num_patients
LEFT JOIN dbo.altitudes
ON dbo.num_patients.nome_municipio = dbo.altitudes.code

SELECT * 
FROM dbo.avg_temps
LEFT JOIN dbo.outcome
ON  
   dbo.avg_temps.cum_week1 = dbo.outcome.outcome_week	

   ORDER BY dbo.avg_temps.cum_week1


   SELECT * 
   FROM dbo.avg_by_week
   LEFT JOIN dbo.outcome
   ON  
   dbo.avg_by_week.cum_week1 = dbo.outcome.outcome_week

   ORDER BY dbo.avg_by_week.cum_week1
