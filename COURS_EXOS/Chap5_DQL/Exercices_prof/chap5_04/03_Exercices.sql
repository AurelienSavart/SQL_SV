-- 1.

SELECT company,
       YEAR(created_at) as year,
       SUM(profit) as ca
FROM sales
GROUP BY year,
         company WITH ROLLUP;

-- 2.

SELECT company,
       YEAR(created_at) as year,
       MONTH(created_at) as month,
       SUM(profit) as ca
FROM sales
GROUP BY year,
         month,
         company WITH ROLLUP;
