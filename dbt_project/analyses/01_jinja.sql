{-% set var_name = "yash" %-}

{{- var_name -}}

{% set appleType = ["A", "A2"] %}

{% for i in appleType %}
    {% if i != "A2"%}
        {{i}}
    {% else %}
        I hate {{i}}

    {% endif %}
{% endfor %}