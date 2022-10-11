with newest_data as (
  select country_code, indicator_code, `2020` as value_2020 from wdi_data
  where
    indicator_code = (select series_code from wdi_series where indicator_name = 'Adjusted savings: education expenditure (current US$)')
    group by country_code
)
select c.long_name as country,c.income_group, value_2020 as "Literacy_expenditure_value"
from wdi_data, newest_data
  join wdi_country c
  on c.country_code = newest_data.country_code
where wdi_data.indicator_code = newest_data.indicator_code
 and wdi_data.country_code = newest_data.country_code
order by value_2020 desc limit 20