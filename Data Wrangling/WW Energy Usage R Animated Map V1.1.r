
library(ggplot2)
library(tidyverse)
library(dplyr)
library(gganimate)
library(transformr)
library(mapproj)
library(tmaptools)

wWEUB <- read.csv("https://raw.githubusercontent.com/zdiam/World-Wide-Energy-Usage-R-Viz/main/Cleaned%20Data/worldEYB.csv")
colnames(wWEUB)[1] <- "region" ##set column to match map_data world

mapdata <- map_data("world")
view(mapdata)

mapdataB <- merge(mapdata, wWEUB, by="region")


mapdataBD <-mapdataB[order(mapdataB$order),] ##sort by order, making the first dataframe ruined the map order


mapdataBD[mapdataBD == ''] <- NA
view(mapdataBD)

##single frame testing map for quicker loading below

# mapTest<-ggplot(mapdata, aes(x=long,y=lat,group=group))+
#   geom_polygon(data=mapdata, aes(x=long, y=lat, group=group),color="black",fill="gray")+    #fill to show if any data is not lining up with between the csv and mapadata
#   geom_polygon(data=mapdataBD, aes(fill=Bin),color='black')+
#   scale_fill_manual(breaks=c('(0, 1]', '(1, 5]','(5, 10]','(10, 25]','(25, 50]' ,'(50, 75]','(75, 100]' ,'(100, 300000]',NA),
#                     labels=c('(0, 1]', '(1, 5]','(5, 10]','(10, 25]','(25, 50]' ,'(50, 75]','(75, 100]' ,'100+','No Data'),
#                     values=c('#33FFFF', '#33FFBB','#58FF33','#E0FF33','#F9FF33' ,'#FFC133','#FF7433' ,'#FF3333','gray'),
#                     name='Total Energy Production \n Quad(10¹⁵) BTUs')+
#   ggtitle('World Wide Total Energy Production Years 1980 - 2021',subtitle = 'Year: {frame_time}')+
#   labs(title = 'World Wide Total Energy Production Years 1980 - 2021',
#        subtitle = 'Year: {frame_time}',
#        caption = "Based on data from:  https://www.eia.gov  ")+
#   xlab('Longitude')+
#   ylab('Latitude')+
#   theme(panel.grid.major = element_line(color = "#F9F8F8", size = 0.4),
#         panel.grid.minor = element_blank(),
#         plot.background = element_rect(fill = "#D8D8D8", color = NA), 
#         panel.background = element_rect(fill = "#D8D8D8", color = NA), 
#         legend.background = element_rect(fill = "#D8D8D8", color = NA),
#         axis.ticks.length = unit(0, "pt"),
#         plot.margin = margin(5,5,5,5,"pt"),
#         plot.caption =element_text(hjust = 0))#+
# 

#mapTest

##

mapBase<-ggplot(mapdata, aes(x=long,y=lat,group=group))+
  geom_polygon(data=mapdata, aes(x=long, y=lat, group=group),color="black",fill="gray")+    #fill to show if any data is not lining up with between the csv and mapadata
  geom_polygon(data=mapdataBD, aes(fill=Bin),color='black')+
  scale_fill_manual(breaks=c('(0, 1]', '(1, 5]','(5, 10]','(10, 25]','(25, 50]' ,'(50, 75]','(75, 100]' ,'(100, 300000]',NA),
                    labels=c('(0, 1]', '(1, 5]','(5, 10]','(10, 25]','(25, 50]' ,'(50, 75]','(75, 100]' ,'100+','No Data'),
                    values=c('#33FFFF', '#33FFBB','#58FF33','#E0FF33','#F9FF33' ,'#FFC133','#FF7433' ,'#FF3333','gray'),
                    name='Total Energy Production \n Quad(10¹⁵) BTUs')+
  ggtitle('World Wide Total Energy Production Years 1980 - 2021',subtitle = 'Year: {frame_time}')+
  labs(title = 'World Wide Total Energy Production Years 1980 - 2021',
       subtitle = 'Year: {frame_time}',
       caption = "Based on data from:  https://www.eia.gov  ")+
  xlab('Longitude')+
  ylab('Latitude')+
  theme(panel.grid.major = element_line(color = "#F9F8F8", size = 0.4),
        panel.grid.minor = element_blank(),
        plot.background = element_rect(fill = "#D8D8D8", color = NA), 
        panel.background = element_rect(fill = "#D8D8D8", color = NA), 
        legend.background = element_rect(fill = "#D8D8D8", color = NA),
        axis.ticks.length = unit(0, "pt"),
        plot.margin = margin(5,5,5,5,"pt"),
        plot.caption =element_text(hjust = 0)
        )+
  transition_time(Year) +
  ease_aes("linear")+
  enter_fade()+
  exit_fade()
  

num_years <- max(mapdataBD$Year) - min(mapdataBD$Year) + 1  
animate(mapBase, nframes = num_years, fps = 3, end_pause = 3)
    

anim_save("23-01-08 Final Working V1.1", animation = last_animation(), path ="C:\\..")