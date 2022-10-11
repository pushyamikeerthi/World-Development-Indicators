delimiter //
CREATE PROCEDURE wdi.create_tables( in schema_in varchar(10) )
begin 
  -- -----------------------------------------------------
-- Table `wdi`.`cpi_timeseries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wdi`.`cpi_timeseries` (
  `Country` VARCHAR(256) NOT NULL,
  `ISO3` VARCHAR(10) NOT NULL,
  `Region` VARCHAR(10) NULL DEFAULT NULL,
  `CPI_score_2020` INT NULL DEFAULT NULL,
  `Rank_2020` INT NULL DEFAULT NULL,
  `Sources_2020` INT NULL DEFAULT NULL,
  `Standard_error_2020` INT NULL DEFAULT NULL,
  `CPI_score_2019` INT NULL DEFAULT NULL,
  `Rank_2019` INT NULL DEFAULT NULL,
  `Sources_2019` INT NULL DEFAULT NULL,
  `Standard_error_2019` INT NULL DEFAULT NULL,
  `CPI_score_2018` INT NULL DEFAULT NULL,
  `Rank_2018` INT NULL DEFAULT NULL,
  `Sources_2018` INT NULL DEFAULT NULL,
  `Standard_error_2018` INT NULL DEFAULT NULL,
  `CPI_score_2017` INT NULL DEFAULT NULL,
  `Rank_2017` INT NULL DEFAULT NULL,
  `Sources_2017` INT NULL DEFAULT NULL,
  `Standard_error_2017` INT NULL DEFAULT NULL,
  `CPI_score_2016` INT NULL DEFAULT NULL,
  `Sources_2016` INT NULL DEFAULT NULL,
  `Standard_error_2016` INT NULL DEFAULT NULL,
  `CPI_score_2015` INT NULL DEFAULT NULL,
  `Sources_2015` INT NULL DEFAULT NULL,
  `Standard_error_2015` INT NULL DEFAULT NULL,
  `CPI_score_2014` INT NULL DEFAULT NULL,
  `Sources_2014` INT NULL DEFAULT NULL,
  `Standard_error_2014` INT NULL DEFAULT NULL,
  `CPI_Score_2013` INT NULL DEFAULT NULL,
  `Sources_2013` INT NULL DEFAULT NULL,
  `Standard_error_2013` INT NULL DEFAULT NULL,
  `CPI_Score_2012` INT NULL DEFAULT NULL,
  `Sources_2012` INT NULL DEFAULT NULL,
  `Standard_error_2012` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ISO3`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wdi`.`wdi_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wdi`.`wdi_country` (
  `country_code` VARCHAR(10) NOT NULL,
  `short_name` TEXT NULL DEFAULT NULL,
  `table_name` TEXT NULL DEFAULT NULL,
  `long_name` TEXT NULL DEFAULT NULL,
  `2-alpha_code` TEXT NULL DEFAULT NULL,
  `currency_unit` TEXT NULL DEFAULT NULL,
  `special_notes` TEXT NULL DEFAULT NULL,
  `region` TEXT NULL DEFAULT NULL,
  `income_group` TEXT NULL DEFAULT NULL,
  `wb-2_` TEXT NULL DEFAULT NULL,
  `national_accounts_base_year` TEXT NULL DEFAULT NULL,
  `national_accounts_reference_year` DOUBLE NULL DEFAULT NULL,
  `sna_price_valuation` TEXT NULL DEFAULT NULL,
  `lending_category` TEXT NULL DEFAULT NULL,
  `other_groups` TEXT NULL DEFAULT NULL,
  `system_of_national_accounts` TEXT NULL DEFAULT NULL,
  `alternative_conversion_factor` TEXT NULL DEFAULT NULL,
  `balance_of_payments_manual_in_use` TEXT NULL DEFAULT NULL,
  `external_debt_reporting_status` TEXT NULL DEFAULT NULL,
  `system_of_trade` TEXT NULL DEFAULT NULL,
  `government_accounting_concept` TEXT NULL DEFAULT NULL,
  `imf_data_dissemination_standard` TEXT NULL DEFAULT NULL,
  `latest_population_census` TEXT NULL DEFAULT NULL,
  `latest_household_survey` TEXT NULL DEFAULT NULL,
  `source_of_most_recent_income_and_expenditure_data` TEXT NULL DEFAULT NULL,
  `vital_registration_complete` TEXT NULL DEFAULT NULL,
  `latest_agricultural_census` TEXT NULL DEFAULT NULL,
  `latest_industrial_data` DOUBLE NULL DEFAULT NULL,
  `latest_trade_data` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`country_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wdi`.`wdi_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wdi`.`wdi_series` (
  `series_code` VARCHAR(256) NOT NULL,
  `topic` TEXT NULL DEFAULT NULL,
  `indicator_name` VARCHAR(256) NOT NULL,
  `short_definition` TEXT NULL DEFAULT NULL,
  `long_definition` TEXT NULL DEFAULT NULL,
  `unit_of_measure` TEXT NULL DEFAULT NULL,
  `periodicity` TEXT NULL DEFAULT NULL,
  `base_period` TEXT NULL DEFAULT NULL,
  `other_notes` TEXT NULL DEFAULT NULL,
  `aggregation_method` TEXT NULL DEFAULT NULL,
  `limitations_and_exceptions` TEXT NULL DEFAULT NULL,
  `notes_from_original_source` TEXT NULL DEFAULT NULL,
  `general_comments` TEXT NULL DEFAULT NULL,
  `source` TEXT NULL DEFAULT NULL,
  `statistical_concept_and_methodology` TEXT NULL DEFAULT NULL,
  `development_relevance` TEXT NULL DEFAULT NULL,
  `related_source_links` TEXT NULL DEFAULT NULL,
  `related_indicators` TEXT NULL DEFAULT NULL,
  `license_type` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`series_code`, `indicator_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wdi`.`wdi_series_time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wdi`.`wdi_series_time` (
  `seriescode` VARCHAR(256) NOT NULL,
  `year` VARCHAR(10) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`seriescode`, `year`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wdi`.`wdi_country_series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wdi`.`wdi_country_series` (
  `countrycode` VARCHAR(10) NOT NULL,
  `seriescode` VARCHAR(256) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`countrycode`, `seriescode`),
  INDEX `SERIES_FK_idx` (`seriescode` ASC) VISIBLE,
  CONSTRAINT `Country_fk1`
    FOREIGN KEY (`countrycode`)
    REFERENCES `wdi`.`wdi_country` (`country_code`),
  CONSTRAINT `Series_fk1`
    FOREIGN KEY (`seriescode`)
    REFERENCES `wdi`.`wdi_series` (`series_code`),
  CONSTRAINT `Series_fk2`
    FOREIGN KEY (`seriescode`)
    REFERENCES `wdi`.`wdi_series_time` (`seriescode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wdi`.`wdi_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wdi`.`wdi_data` (
  `country_name` TEXT NOT NULL,
  `country_code` VARCHAR(10) NOT NULL,
  `Indicator_Name` VARCHAR(256) NOT NULL,
  `indicator_code` VARCHAR(256) NULL DEFAULT NULL,
  `1960` DOUBLE NULL DEFAULT NULL,
  `1961` DOUBLE NULL DEFAULT NULL,
  `1962` DOUBLE NULL DEFAULT NULL,
  `1963` DOUBLE NULL DEFAULT NULL,
  `1964` DOUBLE NULL DEFAULT NULL,
  `1965` DOUBLE NULL DEFAULT NULL,
  `1966` DOUBLE NULL DEFAULT NULL,
  `1967` DOUBLE NULL DEFAULT NULL,
  `1968` DOUBLE NULL DEFAULT NULL,
  `1969` DOUBLE NULL DEFAULT NULL,
  `1970` DOUBLE NULL DEFAULT NULL,
  `1971` DOUBLE NULL DEFAULT NULL,
  `1972` DOUBLE NULL DEFAULT NULL,
  `1973` DOUBLE NULL DEFAULT NULL,
  `1974` DOUBLE NULL DEFAULT NULL,
  `1975` DOUBLE NULL DEFAULT NULL,
  `1976` DOUBLE NULL DEFAULT NULL,
  `1977` DOUBLE NULL DEFAULT NULL,
  `1978` DOUBLE NULL DEFAULT NULL,
  `1979` DOUBLE NULL DEFAULT NULL,
  `1980` DOUBLE NULL DEFAULT NULL,
  `1981` DOUBLE NULL DEFAULT NULL,
  `1982` DOUBLE NULL DEFAULT NULL,
  `1983` DOUBLE NULL DEFAULT NULL,
  `1984` DOUBLE NULL DEFAULT NULL,
  `1985` DOUBLE NULL DEFAULT NULL,
  `1986` DOUBLE NULL DEFAULT NULL,
  `1987` DOUBLE NULL DEFAULT NULL,
  `1988` DOUBLE NULL DEFAULT NULL,
  `1989` DOUBLE NULL DEFAULT NULL,
  `1990` DOUBLE NULL DEFAULT NULL,
  `1991` DOUBLE NULL DEFAULT NULL,
  `1992` DOUBLE NULL DEFAULT NULL,
  `1993` DOUBLE NULL DEFAULT NULL,
  `1994` DOUBLE NULL DEFAULT NULL,
  `1995` DOUBLE NULL DEFAULT NULL,
  `1996` DOUBLE NULL DEFAULT NULL,
  `1997` DOUBLE NULL DEFAULT NULL,
  `1998` DOUBLE NULL DEFAULT NULL,
  `1999` DOUBLE NULL DEFAULT NULL,
  `2000` DOUBLE NULL DEFAULT NULL,
  `2001` DOUBLE NULL DEFAULT NULL,
  `2002` DOUBLE NULL DEFAULT NULL,
  `2003` DOUBLE NULL DEFAULT NULL,
  `2004` DOUBLE NULL DEFAULT NULL,
  `2005` DOUBLE NULL DEFAULT NULL,
  `2006` DOUBLE NULL DEFAULT NULL,
  `2007` DOUBLE NULL DEFAULT NULL,
  `2008` DOUBLE NULL DEFAULT NULL,
  `2009` DOUBLE NULL DEFAULT NULL,
  `2010` DOUBLE NULL DEFAULT NULL,
  `2011` DOUBLE NULL DEFAULT NULL,
  `2012` DOUBLE NULL DEFAULT NULL,
  `2013` DOUBLE NULL DEFAULT NULL,
  `2014` DOUBLE NULL DEFAULT NULL,
  `2015` DOUBLE NULL DEFAULT NULL,
  `2016` DOUBLE NULL DEFAULT NULL,
  `2017` DOUBLE NULL DEFAULT NULL,
  `2018` DOUBLE NULL DEFAULT NULL,
  `2019` DOUBLE NULL DEFAULT NULL,
  `2020` DOUBLE NULL DEFAULT NULL,
  `2021` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`country_code`, `Indicator_Name`),
  CONSTRAINT `fk_country`
    FOREIGN KEY (`country_code`)
    REFERENCES `wdi`.`wdi_country` (`country_code`),
  CONSTRAINT `fk_cpi_ctry`
    FOREIGN KEY (`country_code`)
    REFERENCES `wdi`.`cpi_timeseries` (`ISO3`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `wdi`.`wdi_footnote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wdi`.`wdi_footnote` (
  `countrycode` VARCHAR(10) NOT NULL,
  `seriescode` VARCHAR(256) NOT NULL,
  `year` VARCHAR(10) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`countrycode`, `seriescode`, `year`),
  CONSTRAINT `Series_country_fk`
    FOREIGN KEY (`countrycode` , `seriescode`)
    REFERENCES `wdi`.`wdi_country_series` (`countrycode` , `seriescode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
      
END//
       


delimiter ;