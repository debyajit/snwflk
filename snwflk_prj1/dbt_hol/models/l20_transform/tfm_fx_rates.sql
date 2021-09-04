{{ 
config(
	  materialized='table'
	  , tags=["Reference Data"]
	  ) 
}}
SELECT src.* 
  FROM {{ref('base_knomea_fx_rates')}} src
 WHERE "Indicator Name" = 'Close' 
   AND "Frequency"      = 'D' 
   AND "Date"           > '2016-01-01'
