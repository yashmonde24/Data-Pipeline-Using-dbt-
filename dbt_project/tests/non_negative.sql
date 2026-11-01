SELECT *
FROM  {{ref('bronze_sales')}}
WHERE gross_amount < 0 and net_amount < 0 -- works in reverse order