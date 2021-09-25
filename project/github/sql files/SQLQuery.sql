--Combine all parameters by week

SELECT CAST(cum_week AS int) AS cum_week1 ,AVG(avg_atm_pressure) wk_atm_p,AVG(avg_dew_point_temp) AS wk_dew_p, 
AVG(max_temp) AS wk_avg_max_tmp, MAX(max_temp) AS wk_max_tm, AVG(med_temp) AS wk_avg_tm,
MIN(min_temp) AS wk_min_tm, AVG(min_temp) AS wk_avg_min_tmp, AVG(avg_humidity) AS wk_avg_hum,
MIN(min_humidity) AS wk_min_hum, AVG(max_blast_wind)AS avg_max_blast_w, MAX(max_blast_wind)AS max_blast_w,
AVG(CAST(wind_speed AS float)) AS avg_wind_speed, AVG(CAST(daily_precipitation AS float)) AS wk_avg_precipitation
,AVG (Altitude) As avg_alt 
INTO dbo.avg_Juiz_de_fora1 
FROM dbo.Juiz_de_fora
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



--Combine all areas' data by weeks again

SELECT cum_week1 ,AVG(wk_atm_p) AS wk_atm_p,AVG(wk_dew_p) AS wk_dew_p, 
AVG(wk_avg_max_tmp) AS wk_avg_max_tmp, MAX(wk_max_tm) AS wk_max_tm, AVG(wk_avg_tm) AS wk_avg_tm,
MIN(wk_min_tm) AS wk_min_tm, AVG(wk_avg_min_tmp) AS wk_avg_min_tmp, AVG(wk_avg_hum) AS wk_avg_hum,
MIN(wk_min_hum) AS wk_min_hum, AVG(avg_max_blast_w)AS avg_max_blast_w, MAX(max_blast_w)AS max_blast_w,
AVG(avg_wind_speed) AS avg_wind_speed, AVG(wk_avg_precipitation) AS wk_avg_precipitation
INTO dbo.avg_by_week 
FROM dbo.avg_temps
GROUP BY cum_week1
ORDER BY cum_week1

