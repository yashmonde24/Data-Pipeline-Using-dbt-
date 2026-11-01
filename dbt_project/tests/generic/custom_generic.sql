{% test custom_generic(model,column_name)%}

SELECT *
FROM 
    {{ model }}
Where {{ column_name }} < 0

{% endtest %}