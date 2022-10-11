 ( select Country, ISO3 , 'Corruption Perception Index' as Indicator_Name, 'CPI.Score' as indicator_code,
	CPI_score_2020 as value_2020 ,CPI_score_2019 as value_2019, CPI_score_2018 as value_2018
  from cpi_timeseries c
  where Country in('Seychelles', 'Maldives', "Côte d'Ivoire", 'Kenya', 'Sri Lanka', 'India', 'Singapore', 'Australia', "Denmark & Finland")
   )
union
(select country_name,country_code,d.Indicator_Name, d.indicator_code, `2020` as value_2020 ,`2019` as value_2019, `2018` as value_2018
from wdi_data as d 
where indicator_code in (select series_code 
				  from wdi_series 
                  where indicator_name in( "Total fisheries production (metric tons)","Agricultural land (sq. km)",
										  "Time required to start a business (days)",
										  "New businesses registered (number)",
										  "Employment in agriculture (% of total employment) (modeled ILO estimate)",
										  "Self-employed, total (% of total employment) (modeled ILO estimate)"))
				   and  country_name in('Seychelles', 
										'Maldives', "Côte d'Ivoire", 'Kenya', 
                                        'Sri Lanka', 'India', 'Singapore', 
                                        'Australia', "Denmark & Finland")
group by Indicator_Name, country_code)
limit  15
;