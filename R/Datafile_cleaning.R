library(readxl)
library(tidyverse)

data <- read_excel("Data/402-36 LI Kantonskarte_20210108_mit BE und Sopä.xlsx")
View(data)


cleaning_data <- data %>% 
  mutate(Code_P = paste0(`...1`, `...2`, `...3`),
         Code_O = paste0(Code_O, `...11`, `...12`),
         Feld_O = `...13`)

cleaned_data <- cleaning_data[ , -c(1,2,3,11,12,13)]
View(cleaned_data)

write.table(cleaned_data, "./Data/VSA_Kantonskarte_20210108.csv", 
            row.names = FALSE, 
            sep = ",", 
            fileEncoding = "UTF-8")
