DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME
DECLARE @CurDate DATETIME
SET @StartDate = '2012-12-01'
SET @EndDate = '2019-12-31'
SET @CurDate = @StartDate
WHILE @CurDate <= @EndDate
BEGIN
 INSERT INTO dbo.dim_Date 
   (FullDate, WeekDayName) 
 VALUES
  (@CurDate, DATENAME(weekday, @CurDate))
 SET @CurDate = DATEADD(DAY, 1, @CurDate)
END   
GO

CREATE FUNCTION dbo.udf_GetCumulativeWeekForDate7(
@Date DATETIME)
RETURNS INTEGER
AS
BEGIN
    DECLARE @Week INTEGER
    SELECT  @Week = ISNULL(CumulativeWeek, 0)
    FROM    dbo.dim_Date
    WHERE   FullDate = 
            CONVERT(DATETIME,@Date,10)
    RETURN  @Week   
END

SELECT 
'2017-12-29' AS Date
,DATENAME(weekday, '2017-12-29') AS WeekDay
,dbo.udf_GetCumulativeWeekForDate('2017-12-29')
AS CumulativeWeek
UNION ALL
SELECT 
'2017-12-30'
,DATENAME(weekday, '2017-12-30')
,dbo.udf_GetCumulativeWeekForDate('2017-12-30') 
UNION ALL
SELECT 
'2018-01-01'
,DATENAME(weekday, '2018-01-01')
,dbo.udf_GetCumulativeWeekForDate('2018-01-01')
UNION ALL
SELECT 
'2018-01-06'
,DATENAME(weekday, '2018-01-06')
,dbo.udf_GetCumulativeWeekForDate('2018-01-06') 

SELECT CONVERT(datetime,DT_SIN_PRI,110) FROM dbo.all_patients

SELECT dbo.udf_GetCumulativeWeekForDate7(DT_SIN_PRI)
AS CumulativeWeek
FROM dbo.date_sin
