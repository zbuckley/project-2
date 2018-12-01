# Provides function for converting current in a given year into a base year
require('readr')
cpi <- read_csv('CPI_20181201.csv')

# function can only scale between years provided in cpi dataframe
## easy to expand, but currently only 2000 to 2017 (inclusive)
## TODO: Vectorize this for speed improvement?
currency_scaler <- function(amount, year, base_year) {
  cpi_year <- cpi[which(cpi$Year == year), 2]
  cpi_base_year <- cpi[which(cpi$Year == base_year), 2]
  cpi_ratio <- cpi_base_year/cpi_year
  return (amount * cpi_ratio)
}
