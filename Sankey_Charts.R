UKvisits <- data.frame(origin=c(
  "France", "Germany", "USA",
  "Irish Republic", "Netherlands",
  "Spain", "Italy", "Poland",
  "Belgium", "Australia", 
  "Other countries", rep("UK", 5)),
  visit=c(
    rep("UK", 11), "Scotland",
    "Wales", "Northern Ireland", 
    "England", "London"),
  weights=c(
    c(12,10,9,8,6,6,5,4,4,3,33)/100*31.8, 
    c(2.2,0.9,0.4,12.8,15.5)))
## Uncomment the next 3 lines to install the developer version of googleVis
# install.packages(c("devtools","RJSONIO", "knitr", "shiny", "httpuv"))
# library(devtools)
# install_github("mages/googleVis")
require(googleVis)
plot(
  gvisSankey(UKvisits, from="origin", 
             to="visit", weight="weight",
             options=list(
               height=250,
               sankey="{link:{color:{fill:'lightblue'}}}"
             ))
)



library(networkD3)
library(jsonlite)
library(magrittr)

energy <- "https://cdn.rawgit.com/christophergandrud/networkD3/master/JSONdata/energy.json" %>% 
  fromJSON

sankeyNetwork(Links = energy$links, 
              Nodes = energy$nodes, 
              Source = "source",
              Target = "target", 
              Value = "value", 
              NodeID = "name",
              units = "TWh", 
              fontSize = 12, 
              nodeWidth = 30)

library(ggplot2)


nodes1 <- energy$nodes

links1 <- energy$links