library(plotly)
library(Hmisc)
library(reshape2)
library(ggplot2)
library(plyr)
library(wesanderson)
library(RColorBrewer)
library(readxl)

Production_electricity_cost_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sensitivity/Sensitivity_1B_Case1/Production_electricity_cost-carbon.xlsx")

data<- Production_electricity_cost_carbon


df <-melt(as.data.frame(data),c("Years", "Case"))

df$cat <- ''
df[df$variable != 'Demand + HPs + E-Mobility' & df$Case =='Base',]$cat <- "P BC"
df[df$variable == 'Demand + HPs + E-Mobility' & df$Case =='Base',]$cat <- "D BC"
df[df$variable != 'Demand + HPs + E-Mobility' & df$Case =='Cost C1',]$cat <- "P Cost"
df[df$variable == 'Demand + HPs + E-Mobility' & df$Case =='Cost C1',]$cat <- "D Cost"
df[df$variable == 'Demand + HPs + E-Mobility' & df$Case =='Carbon C1',]$cat <- "D Carbon"
df[df$variable != 'Demand + HPs + E-Mobility' & df$Case =='Carbon C1',]$cat <- "P Carbon"

cols <- c("Grid Import" = "#4393C3", "DH CHP (gas)" = "#D6604D","DH CHP (wood)" = "#954335","DH CHP (waste)" = "#6b3026", "Hydroelectricity CH" = "#E0E0E0",
          "Hydroelectricity BS" = "#878787","PV"="#4D4D4D", "Micro-CHP (gas)"="#eaafa6", "Demand + HPs + E-Mobility"="#ffd662")

p4<-ggplot(data=df, aes(x = cat, y = value, fill=factor(variable, levels=c("Grid Import","Hydroelectricity CH",
                                                                           "Hydroelectricity BS","DH CHP (gas)","DH CHP (wood)","DH CHP (waste)","Micro-CHP (gas)", "PV", "Demand + HPs + E-Mobility")),width = .6)) + 
  geom_bar(stat = 'identity', position = 'stack') + facet_grid(. ~Years )+scale_fill_manual(values=cols)+
  labs(x="",y="GWh/year") + scale_x_discrete(limits = c("D Carbon", "P Carbon","D Cost", "P Cost" )) +
  theme_light() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))+ theme(axis.text.x = element_text(angle = 50, hjust = 1))
p4




#All cases
Production_electricity_cost_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sensitivity/Sensitivity_1B_Case1/Production_electricity_cost-carbon.xlsx")

data<- Production_electricity_cost_carbon

df <-melt(as.data.frame(data),c("Years", "Case"))

df$cat <- ''
df[df$variable != 'Demand + HPs + E-Mobility' & df$Case =='BC Cost',]$cat <- "P BC Cost"
df[df$variable == 'Demand + HPs + E-Mobility' & df$Case =='BC Cost',]$cat <- "D BC Cost"
df[df$variable != 'Demand + HPs + E-Mobility' & df$Case =='Cost C1',]$cat <- "P Cost"
df[df$variable == 'Demand + HPs + E-Mobility' & df$Case =='Cost C1',]$cat <- "D Cost"
df[df$variable == 'Demand + HPs + E-Mobility' & df$Case =='Carbon C1',]$cat <- "D Carbon"
df[df$variable != 'Demand + HPs + E-Mobility' & df$Case =='Carbon C1',]$cat <- "P Carbon"
df[df$variable != 'Demand + HPs + E-Mobility' & df$Case =='BC Carb',]$cat <- "P BC Carbon"
df[df$variable == 'Demand + HPs + E-Mobility' & df$Case =='BC Carb',]$cat <- "D BC Carbon"

cols <- c("Grid Import" = "#4393C3", "DH CHP (gas)" = "#D6604D","DH CHP (wood)" = "#954335","DH CHP (waste)" = "#6b3026", "Hydroelectricity CH" = "#E0E0E0",
          "Hydroelectricity BS" = "#878787","PV"="#4D4D4D", "Micro-CHP (gas)"="#eaafa6", "Demand + HPs + E-Mobility"="#ffd662")

p4<-ggplot(data=df, aes(x = cat, y = value, fill=factor(variable, levels=c("Grid Import","Hydroelectricity CH",
                                                                           "Hydroelectricity BS","DH CHP (gas)","DH CHP (wood)","DH CHP (waste)","Micro-CHP (gas)", "PV", "Demand + HPs + E-Mobility")),width = .4)) + 
  geom_bar(stat = 'identity', position = 'stack') + facet_grid(. ~Years )+scale_fill_manual(values=cols)+
  labs(x="",y="GWh/year") + scale_x_discrete(limits = c("D BC Carbon", "P BC Carbon","D Carbon", "P Carbon","D BC Cost", "P BC Cost", "D Cost", "P Cost")) +
  theme_light() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))+
  theme(text = element_text(size = 12))+ theme(axis.text.x = element_text(angle = 50, hjust = 1))
p4






#stacked

p4<-ggplot(data=df, aes(x = cat, y = value, fill=factor(variable, levels=c("Grid Import","Hydroelectricity CH",
                                                                           "Hydroelectricity BS","DH CHP (gas)","DH CHP (wood)","DH CHP (waste)","Micro-CHP (gas)", "PV", "Demand + HPs + E-Mobility")),width = .6)) + 
  geom_bar(stat = 'identity', position = 'stack') + facet_grid( Years ~. )+scale_fill_manual(values=cols)+
  labs(x="",y="GWh/year") + scale_x_discrete(limits = c("D BC","P BC","D C2","P C2")) +
  theme_minimal() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))
p4

#production only graph

h<- subset(df,df$variable %in% c("2014", "Demand + HPs + E-Mobility"))
g<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","micro-CHP","Grid Import"))

p4 <- ggplot(data=df, aes(x=Years, y=value)) + 
  geom_bar(data=df,stat="identity", aes(fill=factor(variable, levels=c("Grid Import","Hydroelectricity CH",
                                                                      "Hydroelectricity BS","CHP","micro-CHP", "PV", "Demand + HPs + E-Mobility"))),width = 8,
           position='stack') +
  scale_fill_manual(values=cols)+
  labs(x="Years",y="GWh/year") +  scale_x_continuous(breaks=c(2020, 2035, 2050)) +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("Electricity production")+theme(text = element_text(size = 12))+facet_grid( ~ Years)
p4          

# heat 

Production_heat_cost_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sensitivity/Sensitivity_1B_Case1/Production_heat_cost-carbon.xlsx")

data<- Production_heat_cost_carbon

df <-melt(as.data.frame(data),c("Years", "Case"))

df$cat <- ''

df[df$variable != 'Heat demand' & df$Case =='BC Cost',]$cat <- "P BC Cost"
df[df$variable == 'Heat demand' & df$Case =='BC Cost',]$cat <- "D BC"
df[df$variable != 'Heat demand' & df$Case =='BC Carbon',]$cat <- "P BC Carbon"
df[df$variable == 'Heat demand' & df$Case =='BC Carbon',]$cat <- "D BC Carbon"
df[df$variable != 'Heat demand' & df$Case =='Cost',]$cat <- "P Cost C1"
df[df$variable == 'Heat demand' & df$Case =='Cost',]$cat <- "D Case 1"
df[df$variable == 'Heat demand' & df$Case =='Carbon',]$cat <- "Demand Carbon"
df[df$variable != 'Heat demand' & df$Case =='Carbon',]$cat <- "P Carbon C1"

cols <- c("Oil boilers" = "#CCCC33", "Gas boilers" = "#339966", "Wood boilers" = "#CCCC99", 
          "Waste boilers" = "#999966","HP"="#FF9900","Solar TH"="#FFCC00","DH gas"="#CC6600",
          "Gas-HP"="#9999CC","Micro-CHP"= "#006666", "DH wood" = "#993300", "DH waste"="#0066CC", "DH HP"="#FFCC66","Heat demand"= "#999999")


p4<-ggplot(data=df, aes(x = cat, y = value, fill=factor(variable, levels=c("Solar TH","Micro-CHP","Oil boilers","Gas boilers","Wood boilers","Waste boilers",
                                                                           "HP", "Gas-HP","DH HP","DH gas",
                                                                           "DH wood", "DH waste", "Heat demand")),width = .4)) + 
  geom_bar(stat = 'identity', position = 'stack') + facet_grid(~ Years)+scale_fill_manual(values=cols)+
  labs(x="",y="GWh/year") + scale_x_discrete(limits = c("D Case 1","P Carbon C1","P Cost C1"))+
  theme_light() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))+
  theme(text = element_text(size = 12))+ theme(axis.text.x = element_text(angle = 50, hjust = 1))
p4

#with base case
p4<-ggplot(data=df, aes(x = cat, y = value, fill=factor(variable, levels=c("Solar TH","Micro-CHP","Oil boilers","Gas boilers","Wood boilers","Waste boilers",
                                                                           "HP", "Gas-HP","DH HP","DH gas",
                                                                           "DH wood", "DH waste", "Heat demand")),width = .4)) + 
  geom_bar(stat = 'identity', position = 'stack') + facet_grid(~ Years)+scale_fill_manual(values=cols)+
  labs(x="",y="GWh/year") + scale_x_discrete(limits = c("D BC", "P BC Carbon","P BC Cost","D Case 1","P Carbon C1","P Cost C1"))+
  theme_light() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))+
  theme(text = element_text(size = 12))+ theme(axis.text.x = element_text(angle = 50, hjust = 1))
p4


#stacked

p4<-ggplot(data=df, aes(x = cat, y = value, fill=factor(variable, levels=c("Solar TH","Micro-CHP","Oil boilers","Gas boilers","Wood boilers","Waste boilers",
                                                                           "HP", "Gas-HP","DH HP","DH gas",
                                                                           "DH wood", "DH waste", "Heat demand")),width = .4)) + 
  geom_bar(stat = 'identity', position = 'stack') + facet_grid( Years ~.)+scale_fill_manual(values=cols)+
  labs(x="",y="GWh/year") +scale_x_discrete(limits = c("D C1","P C1", "D C3","P C3"))+
  theme_minimal() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))
p4



#prodcution graph only


df2 <-subset(df,df$variable %in% c("Months","Oil boilers","Gas boilers","Wood boilers","Waste boilers","HP", "ST",
                                   "Gas HP", "micro-CHP","DH gas", "DH wood", "DH Waste", "DH HP"))

p4 <- ggplot(data=df, aes(x=Years, y=value)) + 
  geom_bar(data=df2,stat="identity", aes(fill=factor(variable, levels=c("ST","micro-CHP","Oil boilers","Gas boilers","Wood boilers","Waste boilers",
                                                                      "HP", "Gas HP","DH HP","DH gas",
                                                                      "DH wood", "DH Waste" ))),width = 8) +
  scale_fill_manual(values=cols)+
  labs(x="Years",y="GWh/year") +  scale_x_continuous(breaks=c(2020, 2035, 2050)) +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("Heat production")+theme(text = element_text(size = 12))
p4  







