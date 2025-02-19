{% macro create_schema() %}
    {% set schema_name = target.schema %}
    CREATE SCHEMA IF NOT EXISTS {{ schema_name }};
    GRANT ALL PRIVILEGES ON SCHEMA {{ schema_name }} TO {{ target.user }};
{% endmacro %}
