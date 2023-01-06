
library(ggplot2)
library(tidyverse)
library(dplyr)
library(gganimate)
library(transformr)

wWEU <- read.csv("https://raw.githubusercontent.com/zdiam/World-Wide-Energy-Usage-R-Viz/main/Cleaned%20Data/worldEY.csv")
colnames(wWEU)[1] <- "region" ##set column to match map_data world

mapdata <- map_data("world")
view(mapdata)


mapdataM <- merge(mapdata, wWEU, by="region")


mapdataMD <-mapdataM[order(mapdataM$order),] ##sort by order, making the first dataframe ruined the map order
view(mapdataMD)




mapBase<-ggplot(mapdata, aes(x=long,y=lat,group=group))+
  geom_polygon(data=mapdataMD, aes(fill=TEP),color='black')+
  transition_time(Year) +
  ease_aes("linear")

mapBase

