--- Profit Vs Sales

SELECT 
	DATETRUNC(month,order_date) AS date_month,
	SUM(total_sales) AS total_sales,
	SUM(total_profit) AS total_profit
FROM gold.fact_sales
GROUP BY
	DATETRUNC(month,order_date)
ORDER BY 
	DATETRUNC(month,order_date);
	
--- Subcategory Performance By Revenue

SELECT
	TOP 10
	p.subcategory,
	SUM(s.total_sales) AS total_sales

FROM gold.fact_sales AS s
LEFT JOIN gold.dim_products AS p
ON s.product_key=p.product_key
GROUP BY 
	p.subcategory
ORDER BY
	SUM(s.total_sales) DESC

--- Subcategory Performance By Profit Margin

SELECT
	TOP 10
	p.subcategory,
	CONCAT(ROUND(SUM(s.total_profit)/SUM(s.total_sales) *100,0),'%') AS profit_margin

FROM gold.fact_sales AS s
LEFT JOIN gold.dim_products AS p
ON s.product_key=p.product_key
GROUP BY 
	p.subcategory
ORDER BY
	SUM(s.total_profit)/SUM(s.total_sales) *100  DESC;	

--- Subcategory Performance Vs Average

WITH base_query AS 
	(SELECT
		p.subcategory,
		SUM(s.total_sales) AS total_sales,
		ROUND(SUM(s.total_profit)/SUM(s.total_sales) *100,0) AS profit_margin

	FROM gold.fact_sales AS s
	LEFT JOIN gold.dim_products AS p
	ON s.product_key=p.product_key
	GROUP BY 
		p.subcategory),

second_query AS
	(SELECT 
		subcategory,
		total_sales,
		ROUND(AVG(total_sales) OVER(),0) AS avg_sales,
		profit_margin,
		AVG(profit_margin) OVER() AS avg_profit_margin
	FROM base_query)

SELECT 
	subcategory,
	total_sales,
	CASE WHEN total_sales >=avg_sales THEN 'High Sales'
	ELSE 'Low Sales' END AS sales_performance,
	CONCAT(profit_margin,'%') AS profit_margin,
	CASE WHEN profit_margin >=avg_profit_margin THEN 'High Margin'
	ELSE 'Low Margin' END AS margin_performance

FROM second_query
ORDER BY 
	total_sales DESC;

--- Product Performance By Revenue

SELECT
	TOP 10
	p.product_name,
	SUM(s.total_sales) AS total_sales

FROM gold.fact_sales AS s
LEFT JOIN gold.dim_products AS p
ON s.product_key=p.product_key
GROUP BY
	p.product_name
ORDER BY 
	SUM(s.total_sales) DESC
