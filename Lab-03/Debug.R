dat <- read_csv("Semesterfiler/SE05-DV/Lab-03/DataExerciseShinyApps.csv")
dat <- dat %>% select(c("pid7","ideo5"))

table(dat['pid7'])

table(dat['ideo5'])

