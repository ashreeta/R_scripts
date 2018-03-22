library(plotly)
library(Hmisc)
library(reshape2)
library(ggplot2)
library(plyr)
library(wesanderson)
library(RColorBrewer)


Production_electricity_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Production_electricity_cost.xlsx")
Production_electricity_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Production_electricity_carbon.xlsx")

data<- Production_electricity_cost
data<- Production_electricity_carbon

df <-melt(as.data.frame(data),c("Years"))
h<- subset(df,df$variable %in% c("2014", "Demand + HPs + E-Mobility"))
g<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","micro-CHP","Grid Import"))

cols <- c("Grid Import" = "#4393C3", "CHP" = "#D6604D", "Hydroelectricity CH" = "#E0E0E0",
          "Hydroelectricity BS" = "#878787","PV"="#4D4D4D", "micro-CHP"="coral4")

p4 <- ggplot(data=df, aes(x=Years, y=value)) + 
  geom_bar(data=g,stat="identity", aes(fill=factor(variable, levels=c("Grid Import","Hydroelectricity CH",
                                                                      "Hydroelectricity BS","CHP","micro-CHP", "PV"))),width = 8) +
  scale_fill_manual(values=cols)+
  labs(x="Years",y="GWh/year") +  scale_x_continuous(breaks=c(2020, 2035, 2050)) +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("Electricity production")+theme(text = element_text(size = 12))
p4          

# heat 

Production_heat_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Production_heat_carbon.xlsx")
Production_heat_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Production_heat_cost.xlsx")

data<- Production_heat_cost
data<- Production_heat_carbon


df <-melt(as.data.frame(data),c("Years"))
df2 <-subset(df,df$variable %in% c("Months","Oil boilers","Gas boilers","Wood boilers","Waste boilers","HP", "ST",
                                   "Gas HP", "micro-CHP","DH gas", "DH wood", "DH Waste", "DH HP"))

cols <- c("Oil boilers" = "#A6CEE3", "Gas boilers" = "#1F78B4", "Wood boilers" = "#B2DF8A", 
          "Waste boilers" = "#33A02C","HP"="#FB9A99","ST"="#E31A1C","DH gas"="#FDBF6F",
          "Gas HP"="#FF7F00","micro-CHP"= "#CAB2D6", "DH wood" = "#fee1ba", "DH Waste"="#dbdb73", "DH HP"="#fc9d24")


p4 <- ggplot(data=df, aes(x=Years, y=value)) + 
  geom_bar(data=df2,stat="identity", aes(fill=factor(variable, levels=c("ST","micro-CHP","Oil boilers","Gas boilers","Wood boilers","Waste boilers",
                                                                      "HP", "Gas HP","DH HP","DH gas",
                                                                      "DH wood", "DH Waste" ))),width = 8) +
  scale_fill_manual(values=cols)+
  labs(x="Years",y="GWh/year") +  scale_x_continuous(breaks=c(2020, 2035, 2050)) +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("Heat production")+theme(text = element_text(size = 12))
p4  







