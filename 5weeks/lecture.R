# data extract

library(dplyr)
library(readxl)

empdata <- read_excel("data.xlsx")
empdata

empdata %>%
  arrange(-salary) %>%
  head(5)


#mutate
empdata$bonus1 <- empdata$salary * 0.1
View(empdata)

empdata %>%
  mutate(bonus2 = empdata$salary * 0.1)
