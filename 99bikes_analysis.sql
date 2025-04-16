WITH cohort_cte AS (	
	SELECT
		DISTINCT customer_id,
		transaction_date,
		EXTRACT(MONTH FROM (min(transaction_date) OVER (PARTITION BY customer_id))) AS cohort_month,
		list_price 
	FROM transactions
	ORDER BY customer_id
)

SELECT 
	cohort_month,
	date_trunc('month',transaction_date)::date AS order_month, -- cohort analysis TO see which cohorts contributed most TO revenue
	sum(list_price) AS total_revenue
FROM cohort_cte
GROUP BY cohort_month, order_month
ORDER BY cohort_month,order_month;

SELECT
	date_trunc('month',transaction_date)::date AS order_month, --checking revenue per month
	sum(list_price)
FROM transactions
GROUP BY order_month
ORDER BY order_month;

WITH age_cte AS (
	SELECT distinct
		EXTRACT(YEAR FROM now()) - extract(YEAR FROM c.dob) AS age,
		EXTRACT(MONTH FROM (min(t.transaction_date) OVER (PARTITION BY t.customer_id))) AS cohort_month
	FROM transactions t
	LEFT JOIN customerdemographic c ON c.customer_id=t.customer_id
)

SELECT
	cohort_month,
	avg(age) AS avg_age              -- calculating average age FOR EACH cohort
FROM age_cte 
GROUP BY cohort_month
ORDER BY cohort_month;

SELECT
	product_id,
	count(product_id) AS units_sold, -- analysis ON which products generate the most revenue AND how much were sold OF EACH product.
	list_price,
	sum(list_price) AS revenue
FROM transactions
GROUP BY product_id, list_price
ORDER BY revenue DESC;

SELECT
	date_trunc('month',transaction_date)::date AS order_month, -- are there ANY variances IN the amount OF orders placed during the YEAR?
	count(transaction_id)
FROM transactions
GROUP BY order_month
ORDER BY order_month;

SELECT
	brand,
	sum(list_price) AS revenue -- which brands generate the most revenue?
FROM transactions 
GROUP BY brand;

SELECT
	product_line,
	sum(list_price) AS revenue -- which product lines generate the most revenue?
FROM transactions 
GROUP BY product_line;


SELECT
	product_id,
	count(product_id) AS units_sold, -- diving INTO the mountain product line
	sum(list_price) AS revenue
FROM transactions
WHERE product_line = 'Mountain'
GROUP BY product_id;