#Deliverable 1

#importing dplyr package
library(dplyr)

#reading CSV file
MechaCar_Data <- read.csv("MechaCar_mpg.csv")

#perform linear regression function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_Data)

#summary function to determine p-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_Data)) 


#Deliverable 2

#reading csv file
Suspension_Coil_Data <- read.csv("Suspension_Coil.csv")

#creating total_summary dataframe using summarize function to get mean, median, variance, std, of PSI column
total_summary <- Suspension_Coil_Data %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#creating a lot_summary dataframe using group_by function and summarize function to group each manufacturing lot
lot_summary <- Suspension_Coil_Data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')


#Deliverable 3

#sample table from suspension coil data
coil_Sample_Table <- Suspension_Coil_Data %>% sample_n(50)


#t.test sample table PSI mean against overall suspension coil data PSI mean.
t.test(log10(coil_Sample_Table$PSI),mu=mean(log10(Suspension_Coil_Data$PSI)))


#t.test lot 1 against overall suspension coil data PSI mean.
t.test(subset(Suspension_Coil_Data$PSI,Suspension_Coil_Data$Manufacturing_Lot=='Lot1'),Suspension_Coil_Data$PSI)

#t.test lot 2 against overall suspension coil data PSI mean.
t.test(subset(Suspension_Coil_Data$PSI,Suspension_Coil_Data$Manufacturing_Lot=='Lot2'),Suspension_Coil_Data$PSI)

#t.test lot 3 against overall suspension coil data PSI mean.
t.test(subset(Suspension_Coil_Data$PSI,Suspension_Coil_Data$Manufacturing_Lot=='Lot3'),Suspension_Coil_Data$PSI)

