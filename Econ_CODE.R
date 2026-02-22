library(dplyr)
econ2018 <- da03471.0001 %>% filter(YEAR == "2018")

write.csv(econ2018, "/Users/princeparker/Downloads/Coursework/Econ Dev/BC_Econ/econ2018.csv", row.names = FALSE)

econ2018