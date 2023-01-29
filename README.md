# World-Wide-Energy-Usage-R-Viz

Data was pulled from: https://www.eia.gov/

### Working Map

![](https://github.com/zdiam/World-Wide-Energy-Usage-R-Viz/blob/main/Animated%20Plots%20Progress%20Track/23-01-08%20Final%20Working%20V1.1)

### Lessons Learned

Using the world map data library from R to create the map, it was not merging with the data from https://www.eia.gov/. Being my first experience with R, I struggled to find where I was making a mistake. As it turns out, the data had several spaces infront of it innately and wasn't correctly correlating to the R map data:

![image](https://user-images.githubusercontent.com/120227829/215296252-e021cd96-bab6-4340-b5fe-1f1a563f0044.png)

The data also needed to be massively manupilated to work with the animation library for R. This was done entirely with Python and the Pandas library, and then placed into R for a merge that required little manupilation in R. 

It became a workflow issue when having to adjust minor parts for the animated map such as the bucketing to group values together or adjusting nulled countries. In the future, taking the time to learn how to wrangle the data in R might've sped up the process, but for this project it was helpful to focus on purely getting the animated plot working and solving the data issues with Python where I already had enough experience to work it through quickly.

Overall, creating an animated map in R was much more than expected, but I walked away feeling confident that any animated plot was within my skillset. 

### Progress plots:

#### 23-01-05 First Pass Animated Map


![](https://github.com/zdiam/World-Wide-Energy-Usage-R-Viz/blob/main/Animated%20Plots%20Progress%20Track/First%20Pass%20Animated%20Map.gif)


#### 23-01-06 Map Animation


![](https://github.com/zdiam/World-Wide-Energy-Usage-R-Viz/blob/main/Animated%20Plots%20Progress%20Track/23-01-06%20Map%20Animation.gif)


#### 23-01-06 Map Animation #2


![](https://github.com/zdiam/World-Wide-Energy-Usage-R-Viz/blob/main/Animated%20Plots%20Progress%20Track/23-01-06%20Map%20Animation2.gif)


#### 23-01-07 Working


![](https://github.com/zdiam/World-Wide-Energy-Usage-R-Viz/blob/main/Animated%20Plots%20Progress%20Track/23-01-07%20Working.gif)


#### 23-01-08 Working


![](https://github.com/zdiam/World-Wide-Energy-Usage-R-Viz/blob/main/Animated%20Plots%20Progress%20Track/23-01-08%20Working.gif)


#### 23-01-08 Working (Finalized V1.1)


![](https://github.com/zdiam/World-Wide-Energy-Usage-R-Viz/blob/main/Animated%20Plots%20Progress%20Track/23-01-08%20Final%20Working%20V1.1)



