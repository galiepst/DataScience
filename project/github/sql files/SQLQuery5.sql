SELECT * FROM dbo.avg_temps
LEFT JOIN dbo.num_patients1
ON dbo.avg_temps.cum_week1 = dbo.num_patients1.outcome_week AND dbo.avg_temps.avg_alt = dbo.num_patients1.altitude

ORDER BY dbo.avg_temps.cum_week1

ALTER TABLE dbo.avg_temps
ALTER COLUMN avg_alt float(2)

ALTER TABLE dbo.num_patients1
ALTER COLUMN altitude float(2)