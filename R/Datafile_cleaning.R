library(readxl)
library(tidyverse)

data <- read_excel("Data/402-36 LI Kantonskarte_20210108_mit BE und Sopä.xlsx")
View(data)


cleaning_data <- data %>% 
  mutate(Code_P = paste0(`...1`, `...2`, `...3`),
         Code_O = case_when(Code_O != "NA" ~ paste0(Code_O, `...11`, `...12`)),
         Feld_O = `...13`,
         Name_P = trimws(substring(Name_P, 6)),
         Name_O = trimws(substring(Name_O, 6)))

cleaned_data <- cleaning_data[ , -c(1,2,3,11,12,13)]
View(cleaned_data)

write.table(cleaned_data, "./Data/VSA_Kantonskarte_20210108.csv", 
            row.names = FALSE, 
            sep = ",", 
            fileEncoding = "UTF-8")
