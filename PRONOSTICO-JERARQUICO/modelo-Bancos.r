rm(list=ls())

#####################################################################
#PASO 1. SE INSTALAN LAS LIBRERIAS NECESARIAS.

library(openxlsx, quietly = TRUE)
library(Hmisc, quietly = TRUE)
library(scales)
library(officer)
library(flextable)
library(forecast)
library(datasets)
library(tseries)
library(WriteXLS)
library(stringr)

#####################################################################
#PASO 2. SE DEFINEN LAS RUTAS DE CATALOGOS Y RESULTADOS.

ruta.1 <- "C:/Users/juanj/Workspace/business_Intelligence/PRONOSTICO-JERARQUICO"

################################################################################
################################################################################
################################################################################
###############################IPC##############################################
################################################################################
################################################################################
################################################################################

#####################################################################
#PASO 3. LEE INSUMOS PRONOSTICO IPC

Competidor1 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor1.csv",header=TRUE, sep=",")
Competidor2 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor2.csv",header=TRUE, sep=",")
Competidor3 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor3.csv",header=TRUE, sep=",")
Competidor4 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor4.csv",header=TRUE, sep=",")
Competidor5 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor5.csv",header=TRUE, sep=",")
Competidor6 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor6.csv",header=TRUE, sep=",")
Competidor7 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor7.csv",header=TRUE, sep=",")
Competidor8 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor8.csv",header=TRUE, sep=",")
Competidor9 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                        DE TIEMPO/Competidor9.csv",header=TRUE, sep=",")
Competidor10 <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/SERIES
                         DE TIEMPO/Competidor10.csv",header=TRUE, sep=",")
################
################
################
################
################
################
# Convertimos las columnas 'Product1' en series de tiempo
ts.Competidor1 <- ts(Competidor1$Product1, frequency = 52, start = c(2019,1))
ts.Competidor2 <- ts(Competidor2$Product1, frequency = 52, start = c(2019,1))
ts.Competidor3 <- ts(Competidor3$Product1, frequency = 52, start = c(2019,1))
ts.Competidor4 <- ts(Competidor4$Product1, frequency = 52, start = c(2019,1))
ts.Competidor5 <- ts(Competidor5$Product1, frequency = 52, start = c(2019,1))
ts.Competidor6 <- ts(Competidor6$Product1, frequency = 52, start = c(2019,1))
ts.Competidor7 <- ts(Competidor7$Product1, frequency = 52, start = c(2019,1))
ts.Competidor8 <- ts(Competidor8$Product1, frequency = 52, start = c(2019,1))
ts.Competidor9 <- ts(Competidor9$Product1, frequency = 52, start = c(2019,1))
ts.Competidor10 <- ts(Competidor10$Product1, frequency = 52, start = c(2019,1))

# Creamos el gráfico inicial con los datos del Competidor1
plot(ts.Competidor1, col="blue", ylim=c(min(c(ts.Competidor1, ts.Competidor2)),
                                        max(c(ts.Competidor1, ts.Competidor6))),
     ylab="Volumen de ventas", main="Volumen de Competidores")

# Agregamos las series de tiempo de los otros competidores
lines(ts.Competidor2, col="red")
lines(ts.Competidor3, col="green")
lines(ts.Competidor4, col="grey")
lines(ts.Competidor5, col="yellow")
lines(ts.Competidor6, col="pink")
lines(ts.Competidor7, col="orange")
lines(ts.Competidor8, col="black")
lines(ts.Competidor9, col="brown")
lines(ts.Competidor10, col="gold")


# Añadimos una leyenda
legend("topright", legend=c("Competidor1", "Competidor2","Competidor3","Competidor4",
                            "Competidor5","Competidor6","Competidor7","Competidor8",
                            "Competidor9","Competidor10"), col=c("blue", "red","green","grey","yellow","pink","orange","black","brown","gold"), lty=1)



ARIMA.Competidor1 <- auto.arima(ts.Competidor1,D=1)
ARIMA.Competidor2 <- auto.arima(ts.Competidor2,D=1)
ARIMA.Competidor3 <- auto.arima(ts.Competidor3,D=1)
ARIMA.Competidor4 <- auto.arima(ts.Competidor4,D=1)
ARIMA.Competidor5 <- auto.arima(ts.Competidor5,D=1)
ARIMA.Competidor6 <- auto.arima(ts.Competidor6,D=1)
ARIMA.Competidor7 <- auto.arima(ts.Competidor7,D=1)
ARIMA.Competidor8 <- auto.arima(ts.Competidor8,D=1)
ARIMA.Competidor9 <- auto.arima(ts.Competidor9,D=1)
ARIMA.Competidor10 <- auto.arima(ts.Competidor10,D=1)



summary(ARIMA.Competidor1)
summary(ARIMA.Competidor2)
summary(ARIMA.Competidor3)
summary(ARIMA.Competidor4)
summary(ARIMA.Competidor5)
summary(ARIMA.Competidor6)
summary(ARIMA.Competidor7)
summary(ARIMA.Competidor8)
summary(ARIMA.Competidor9)
summary(ARIMA.Competidor10)

####
####Competidor1
####
plot(ARIMA.Competidor1$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor1$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor1<- forecast(ARIMA.Competidor1,25,level = 99)
Forecast.Competidor1
plot(Forecast.Competidor1,main="Competidor1 Forecasting",
     ylab="Competidor1 Volume")

####
####Competidor2
####

plot(ARIMA.Competidor2$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor2$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor2<- forecast(ARIMA.Competidor2,25,level = 99)
Forecast.Competidor2
plot(Forecast.Competidor2,main="Competidor2 Forecasting",
     ylab="Competidor1 Volume")
####
####Competidor3
####

plot(ARIMA.Competidor3$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor3$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor3<- forecast(ARIMA.Competidor3,25,level = 99)
Forecast.Competidor3
plot(Forecast.Competidor3,main="Competidor3 Forecasting",
     ylab="Competidor1 Volume")

####
####Competidor4
####

plot(ARIMA.Competidor4$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor4$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor4<- forecast(ARIMA.Competidor4,25,level = 99)
Forecast.Competidor4
plot(Forecast.Competidor4,main="Competidor4 Forecasting",
     ylab="Competidor1 Volume")

####
####Competidor5
####

plot(ARIMA.Competidor5$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor5$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor5<- forecast(ARIMA.Competidor5,25,level = 99)
Forecast.Competidor5
plot(Forecast.Competidor5,main="Competidor5 Forecasting",
     ylab="Competidor1 Volume")


####
####Competidor6
####

plot(ARIMA.Competidor6$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor6$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor6<- forecast(ARIMA.Competidor6,25,level = 99)
Forecast.Competidor6
plot(Forecast.Competidor6,main="Competidor6 Forecasting",
     ylab="Competidor1 Volume")


####
####Competidor7
####

plot(ARIMA.Competidor7$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor7$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor7<- forecast(ARIMA.Competidor7,25,level = 99)
Forecast.Competidor7
plot(Forecast.Competidor7,main="Competidor7 Forecasting",
     ylab="Competidor1 Volume")


####
####Competidor8
####

plot(ARIMA.Competidor8$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor8$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor8<- forecast(ARIMA.Competidor8,25,level = 99)
Forecast.Competidor8
plot(Forecast.Competidor8,main="Competidor8 Forecasting",
     ylab="Competidor1 Volume")


####
####Competidor9
####

plot(ARIMA.Competidor9$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor9$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor9<- forecast(ARIMA.Competidor9,25,level = 99)
Forecast.Competidor9
plot(Forecast.Competidor9,main="Competidor9 Forecasting",
     ylab="Competidor1 Volume")


####
####Competidor10
####

plot(ARIMA.Competidor10$x,col="blue")
par(new=TRUE)
plot(ARIMA.Competidor10$fitted,col="red") 
title(main="Real vs Forecast")
Forecast.Competidor10<- forecast(ARIMA.Competidor10,25,level = 99)
Forecast.Competidor10
plot(Forecast.Competidor10,main="Competidor10 Forecasting",
     ylab="Competidor1 Volume")
####
#### modelos de pronostico
####

MPc1 <- Forecast.Competidor1
MPc2 <- Forecast.Competidor2
MPc3 <- Forecast.Competidor3
MPc4 <- Forecast.Competidor4
MPc5 <- Forecast.Competidor5
MPc6 <- Forecast.Competidor6
MPc7 <- Forecast.Competidor7
MPc8 <- Forecast.Competidor8
MPc9 <- Forecast.Competidor9
MPc10 <- Forecast.Competidor10

write.csv(MPc1, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc1.csv")
write.csv(MPc2, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc2.csv")
write.csv(MPc3, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc3.csv")
write.csv(MPc4, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc4.csv")
write.csv(MPc5, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc5.csv")
write.csv(MPc6, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc6.csv")
write.csv(MPc7, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc7.csv")
write.csv(MPc8, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc8.csv")
write.csv(MPc9, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc9.csv")
write.csv(MPc10, file = "C:/Users/juanj/Workspace/business_Intelligence/SERIES DE TIEMPO/MPc10.csv")
