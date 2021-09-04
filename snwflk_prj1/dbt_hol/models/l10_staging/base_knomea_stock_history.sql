SELECT "Company"                    Company
     , "Company Name"               Company_Name
     , "Company Symbol"             Company_Symbol
     , "Stock Exchange"             Stock_Exchange
     , "Stock Exchange Name"        Stock_Exchange_Name
     , "Indicator"                  Indicator
     , "Indicator Name"             Indicator_Name
     , "Units"                      Units
     , "Scale"                      Scale
     , "Frequency"                  Frequency
     , "Date"                       Date
     , "Value"                      Value
     , 'Knomea.Stock History' data_source_name
  FROM {{source('knomea_economy_data_atlas','usindssp2020')}}  src 
