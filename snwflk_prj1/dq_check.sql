-- Create a list of columns in the table
WITH column_names AS (
    SELECT column_name
    FROM information_schema.columns
    WHERE table_name = 'your_table_name' -- Replace with your actual table name
)
-- Generate dynamic SQL to calculate statistics for each column
SELECT
    'SELECT ' || LISTAGG(
        'COUNT(' || column_name || ') AS ' || column_name || '_count, ' ||
        'COUNT(DISTINCT ' || column_name || ') AS ' || column_name || '_distinct_count, ' ||
        'MAX(' || column_name || ') AS ' || column_name || '_max, ' ||
        'MIN(' || column_name || ') AS ' || column_name || '_min',
        ', '
    ) WITHIN GROUP (ORDER BY column_name) ||
    ' FROM your_table_name' AS dynamic_query
FROM column_names;
----------------

-- Create a list of columns in the table
WITH column_names AS (
    SELECT column_name
    FROM information_schema.columns
    WHERE table_name = 'your_table_name' -- Replace with your actual table name
),
-- Generate dynamic SQL to calculate statistics for each column
dynamic_sql AS (
    SELECT
        'SELECT ''' || column_name || ''' AS column_name, ' || 
        'COUNT(' || column_name || ') AS null_count, ' ||
        'COUNT(DISTINCT ' || column_name || ') AS distinct_count, ' ||
        'MAX(' || column_name || ') AS max_value, ' ||
        'MIN(' || column_name || ') AS min_value ' ||
        'FROM your_table_name' AS dynamic_query
    FROM column_names
)
-- Execute dynamic SQL queries and combine results
SELECT *
FROM (
    SELECT
        column_name,
        null_count,
        distinct_count,
        max_value,
        min_value
    FROM dynamic_sql
    UNION ALL
    SELECT
        'Total' AS column_name,
        SUM(null_count) AS null_count,
        SUM(distinct_count) AS distinct_count,
        NULL AS max_value,
        NULL AS min_value
    FROM dynamic_sql
)
ORDER BY column_name;
