import pandas as pd
import os
import numpy as np

worldEY = pd.read_csv (r'INT-Export-worldEnergyYearly.csv')
worldEY.columns = worldEY.iloc[0] #Set Columns to the Year

worldEY = worldEY.drop(['API'], axis=1)#The API info is not needed

worldEY.rename(columns={ worldEY.columns[0]: 'Country'}, inplace = True)

worldEY = worldEY.drop([0,1,2]) #drop 0 since that is now column name,1 is NaN values, and World values will mess with scale for map plot

worldEY = worldEY.loc[0:232]#data for energy ends at 232

worldEY['Country']= worldEY['Country'].str.strip() #initial data had spaces, would not interact with R mapdata
worldEYCr = worldEY.loc[:,'1980':'2021']


worldEYCr= worldEYCr.replace({'--':'0', '':'0'}) #replace the -- and blank spaces with 0 


worldEYCr = pd.melt(worldEYCr)

worldEYC=worldEY['Country']

worldEYC = pd.concat([worldEYC]*42, ignore_index=True) #1980-2021

worldEY = pd.concat([worldEYC,worldEYCr],axis=1)

worldEY =worldEY.replace(
{'United States': 'USA', 
'United Kingdom':'UK', 
'Burma':'Myanmar',
'Congo-Brazzaville':'Republic of Congo',
'Congo-Kinshasa':'Democratic Republic of the Congo',
'Czechia':'Czech Republic',
'Côte d’Ivoire':'Ivory Coast'}
) 
#adjusting names of major data points to correctly join with R mapdata names

worldEY = worldEY.rename(columns={worldEY.columns[1]: 'Year', 'value': 'TEP'})

worldEY.to_csv ('worldEY.csv',index=None)

worldEYB = worldEY['TEP']

worldEYB = worldEYB.astype(float)
worldEYB.replace({0:'No Data'}) #adjusting names of major data points to correctly join with R mapdata names
worldEYB = pd.cut(worldEYB, bins=[0,1,5,10,25,50,75,100,300000]) ##300k arbitrary 

worldEYB = worldEYB.rename('Bin')

worldEYB = pd.concat([worldEY,worldEYB], axis=1)
worldEYB = worldEYB.drop(columns='TEP')

worldEYB.to_csv ('worldEYB.csv',index=None)