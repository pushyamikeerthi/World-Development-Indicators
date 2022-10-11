use wdi;

select count(*) as num_countries from wdi_country;

select count(distinct seriescode) as num_ctry_seriescode from wdi_country_series;

select count(distinct indicator_code) as num_indicators from wdi_data;

select count(distinct series_code) as num_seriescode from wdi_series;

select* from wdi_footnote;

select count(distinct seriescode) from  wdi_series_time;

select count(*) as num_countries from wdi_country;

select country_code, long_name, currency_unit from wdi_country limit 5;

select series_code, indicator_name, long_definition as definition from wdi_series  limit 10;

SELECT DISTINCT region FROM wdi_Country ORDER BY region;



