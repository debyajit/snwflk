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
