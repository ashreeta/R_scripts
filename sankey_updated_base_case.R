library(networkD3)
library(htmlwidgets)
library(htmltools)
library(readxl)

#data carbon import

Sankey_nodes_2016 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_nodes_2016.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2016_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_source_target_2016_carbon.xlsx")

Sankey_nodes_2020 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_nodes_2020.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2020_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_source_target_2020_carbon.xlsx")

Sankey_nodes_2035 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_nodes_2035.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2035_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_source_target_2035_carbon.xlsx")

Sankey_nodes_2050 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_nodes_2050.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2050_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_source_target_2050_carbon.xlsx")

#data cost import
Sankey_nodes_2020 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_carbon/Sankey_nodes_2020.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2020_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_cost/Sankey_source_target_2020_cost.xlsx")

Sankey_nodes_2035_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_cost/Sankey_nodes_2035_cost.xlsx", 
                                     col_types = c("numeric", "text", "text", 
                                                   "text"))
Sankey_source_target_2035_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_cost/Sankey_source_target_2035_cost.xlsx")

Sankey_nodes_2050_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_cost/Sankey_nodes_2050_cost.xlsx", 
                                     col_types = c("numeric", "text", "text", 
                                                   "text"))
Sankey_source_target_2050_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Updated_base_case/Sankey_cost/Sankey_source_target_2050_cost.xlsx")

# Data carbon
Nodes<-data.frame(Sankey_nodes_2016)
links<-data.frame(Sankey_source_target_2016_carbon)

Nodes1<-data.frame(Sankey_nodes_2020)
links1<-data.frame(Sankey_source_target_2020_carbon)

Nodes2<-data.frame(Sankey_nodes_2035)
links2<-data.frame(Sankey_source_target_2035_carbon)

Nodes3<-data.frame(Sankey_nodes_2050)
links3<-data.frame(Sankey_source_target_2050_carbon)


# Data cost
Nodes<-data.frame(Sankey_nodes_2016)
links<-data.frame(Sankey_source_target_2016_carbon)

Nodes1<-data.frame(Sankey_nodes_2020)
links1<-data.frame(Sankey_source_target_2020_cost)

Nodes2<-data.frame(Sankey_nodes_2035_cost)
links2<-data.frame(Sankey_source_target_2035_cost)

Nodes3<-data.frame(Sankey_nodes_2050_cost)
links3<-data.frame(Sankey_source_target_2050_cost)



#plot


sankeyNetwork(Links = links, Nodes = Nodes, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16)  

sankeyNetwork(Links = links1, Nodes = Nodes1, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16)  

sankeyNetwork(Links = links2, Nodes = Nodes2, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16)  

sankeyNetwork(Links = links3, Nodes = Nodes3, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16) 


my_color<- "d3.scaleOrdinal().domain(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10','11','12'])
.range(['#8DD3C7', '#FFFFB3', '#BEBADA', '#FB8072', '#80B1D3', '#FDB462', '#B3DE69', '#FCCDE5', '#D9D9D9', '#BC80BD', '#CCEBC5', '#d35d19']);
"


#html

browsable(
    tagList(
      tags$h1("2016 Energy flow diagram"),
      sankeyNetwork(Links = links, Nodes = Nodes, Source = "source",
                    Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                    units = "GWh", fontSize = 16, nodeWidth = 50),
      tags$h1("2020 Energy flow diagram"),
      sankeyNetwork(Links = links1, Nodes = Nodes1, Source = "source",
                  Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                  units = "GWh", fontSize = 16, nodeWidth = 50),
      tags$h1("2035 Energy flow diagram"),
      sankeyNetwork(Links = links2, Nodes = Nodes2, Source = "source",
                  Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                   units = "GWh", fontSize = 16, nodeWidth = 50),
      tags$h1("2050 Energy flow diagram"),
      sankeyNetwork(Links = links3, Nodes = Nodes3, Source = "source",
                    Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                    units = "GWh", fontSize = 16, nodeWidth = 50)
))
    


#my_color <- 'd3.scaleOrdinal() .domain(["1", "2","3"]) .range(["blue", "grey", "green"])'

#colors test
sankeyNetwork(Links = links, Nodes = Nodes, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", colourScale=my_color#, NodeGroup="group"
              , units = "GWh", nodeWidth = 30,
              fontSize = 16,iterations = 0) 
