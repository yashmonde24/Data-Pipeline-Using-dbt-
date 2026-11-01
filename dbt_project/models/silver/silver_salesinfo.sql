WITH sales AS
(
    SELECT 
        sales_id,
        product_sk,
        customer_sk,
        {{ mulitply('unit_price', 'quantity') }} AS calculated_amt,
        gross_amount,
        payment_method
    FROM
        {{ ref('bronze_sales') }}
),
product AS
(
    SELECT 
        product_sk,
        category
    FROM 
    {{ ref('bronze_product')}}
),
customer AS
(
    SELECT
        customer_sk,
        gender
    FROM 
        {{ ref('bronze_customer') }}

),

join_query AS (

    SELECT
        sales.sales_id,
        sales.gross_amount,
        sales.payment_method,
        product.category,
        customer.gender
    FROM 
        sales
    JOIN 
        product ON sales.product_sk = product.product_sk
    JOIN
        customer ON sales.customer_sk = customer.customer_sk
)

SELECT
    category,
    gender,
    SUM(gross_amount) as Total_sales
FROM join_query
GROUP BY    
        category,
        gender
ORDER BY 
        Total_sales DESC