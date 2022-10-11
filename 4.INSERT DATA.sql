USE  WDI;
SET FOREIGN_KEY_CHECKS=0;
-- -----------------------------------------------------
-- Table `wdi`.`wdi_country`
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:/Users/pushy/Desktop/MCB/WDI_csv/WDICountry.csv' INTO TABLE wdi_country 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM WDI.WDI_COUNTRY;

-- -----------------------------------------------------
-- Table `wdi`.`wdi_series`
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:/Users/pushy/Desktop/MCB/WDI_csv/WDISeries.csv' INTO TABLE wdi_series 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SELECT COUNT(*) FROM WDI.wdi_series;

-- -----------------------------------------------------
-- Table `wdi`.`wdi_series_time`
-- -----------------------------------------------------

LOAD DATA LOCAL INFILE 'C:/Users/pushy/Desktop/MCB/WDI_csv/WDISeries-Time.csv' INTO TABLE wdi_series_time 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SELECT COUNT(*) FROM WDI.wdi_series_time;

-- -----------------------------------------------------
-- Table `wdi`.`wdi_country_series`
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:/Users/pushy/Desktop/MCB/WDI_csv/WDICountry-Series.csv' INTO TABLE wdi_country_series 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SELECT COUNT(*) FROM WDI.wdi_country_series;
#SELECT * FROM wdi_country_series;

-- -----------------------------------------------------
-- Table `wdi`.`wdi_data`
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:/Users/pushy/Desktop/MCB/WDI_csv/WDIData.csv' INTO TABLE wdi_data 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) FROM WDI.wdi_data;
#SELECT * FROM WDI_DATA;



-- -----------------------------------------------------
-- Table `wdi`.`wdi_footnote`
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:/Users/pushy/Desktop/MCB/WDI_csv/WDIFootNote.csv' INTO TABLE wdi_footnote 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SELECT COUNT(*) FROM wdi_footnote;
#SELECT * FROM wdi_footnote;

-- -----------------------------------------------------
-- Table `wdi`.`wdi_country`
-- -----------------------------------------------------

LOAD DATA LOCAL INFILE 'C:/Users/pushy/Desktop/MCB/WDI_csv/CorruptionPerceptionIndexDataSet.csv' INTO TABLE cpi_timeseries 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 3 LINES;

SELECT COUNT(*) FROM WDI.cpi_timeseries;



