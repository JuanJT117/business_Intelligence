############################################################
#Paso 0 Realizamos la carga de las librerias que usaremos en R
rm(list=ls())

library(openxlsx, quietly = TRUE)
library(Hmisc,quietly = TRUE)
library(scales)
library(officer)
library(flextable)
library(Distance)
library(cluster)
library(ClusterR)
library(fpc)
library(plotly)
library(scatterplot3d)
library(kohonen)
library(cclust)
set.seed(100)
############################################################
#Paso 1 upload data base y rutinas

ruta.1 <- "C:/Users/juanj/Workspace/business_Intelligence"
BaseAumentada <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/BasePFLD.csv")

############################################################
#Paso 2 Analis de componentes principales

