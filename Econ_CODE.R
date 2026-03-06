library(dplyr)
econ2018 <- da03471.0001 %>% filter(YEAR == "2018")

write.csv(econ2018, "/Users/princeparker/Downloads/Coursework/Econ Dev/BC_Econ/econ2018.csv", row.names = FALSE)

econ2018rev <- econ2018 %>% select(OWNMONY, NUMPROG, INCOME, POOR30_ALL4, POORPCT1, POORPCT2, RICHPCT1, RICHPCT2, CLERRACE, SERVICE1, SERVICE2, SERVICE3, MISSUE1, MISSUE2, MISSUE3, CONFLCT1, CONFLCT2, CONFLCT3, MONEY1, MONEY2, MONEY3, NDMONY, GOVFUND1_18, GOVFUND2_18)

fiteconmodel <- lm(
  POORPCT2 ~ OWNMONY + NUMPROG + INCOME + POOR30_ALL4 +
    POORPCT1 + RICHPCT1 + RICHPCT2 +
    CLERRACE + NDMONY + GOVFUND1_18 + GOVFUND2_18,
  data = econ2018rev
)
step(fiteconmodel, k = log(nrow(econ2018rev)))

summary(fiteconmodel)

install.packages("ggplot2")
ownpovplot <- plot(OWNMONY, POORPCT2, data())