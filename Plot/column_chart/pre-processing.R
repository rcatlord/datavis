# Trees planted in the UK, 1976-2020 #
# Source: Forest Research
# URL: https://www.forestresearch.gov.uk/tools-and-resources/statistics/data-downloads/

library(tidyverse) ; library(readxl) ; library(httr) ; library(janitor)

tmp <- tempfile(fileext = ".xlsx")
GET(url = "https://www.forestresearch.gov.uk/documents/7770/Ch1_Woodland_FS2020.xlsx",
    write_disk(tmp))

read_xlsx(tmp, sheet = 21, skip = 4, range = "A5:F50") %>% 
  clean_names() %>% 
  select(year = year_ending_31_3, value = uk) %>% 
  write_csv("new_trees.csv")
