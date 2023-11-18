
ruta.1 <- "C:/Users/juanj/Workspace/business_Intelligence/PRONOSTICO-JERARQUICO"

#ruta.1 <- "C:/Users/juanj/Workspace/business_Intelligence/PRONOSTICO-JERARQUICO"
################################################################################
################################################################################

#####################################################################
#PASO 3. LEE INSUMOS PRONOSTICO IPC

SECTORES <- read.csv("C:/Users/juanj/Workspace/business_Intelligence/PRONOSTICO-JERARQUICO/SF2.csv",header=TRUE, sep=",")


################
# Convertimos las columnas 'Product1' en series de tiempo
ts.SF       <- ts(SECTORES$SF, frequency = 13, start = c(1996,1))
ts.SFCC     <- ts(SECTORES$SFCC, frequency = 13, start = c(1996,1))
ts.SFCV     <- ts(SECTORES$SFCV, frequency = 13, start = c(1996,1))
ts.SFCFE    <- ts(SECTORES$SFCFE, frequency = 13, start = c(1996,1))
ts.SFCCB    <- ts(SECTORES$SFCCB, frequency = 13, start = c(1996,1))
ts.SFCCNB1  <- ts(SECTORES$SFCCNB1, frequency = 13, start = c(1996,1))
ts.SFCCNB2  <- ts(SECTORES$SFCCNB2, frequency = 13, start = c(1996,1))
ts.SFCVB    <- ts(SECTORES$SFCVB, frequency = 13, start = c(1996,1))
ts.SFCVNB1  <- ts(SECTORES$SFCVNB1, frequency = 13, start = c(1996,1))
ts.SFCVNB2  <- ts(SECTORES$SFCVNB2, frequency = 13, start = c(1996,1))
ts.SFCFEB   <- ts(SECTORES$SFCFEB, frequency = 13, start = c(1996,1))
ts.SFCFENB1 <- ts(SECTORES$SFCFENB1, frequency = 13, start = c(1996,1))
ts.SFCFENB2 <- ts(SECTORES$SFCFENB2, frequency = 13, start = c(1996,1))
ts.SFCFENB3 <- ts(SECTORES$SFCFENB3, frequency = 13, start = c(1996,1))

# Creamos el gráfico inicial con los datos del SF17926
plot(ts.SFCFENB3, col="blue", ylim=c(min(c(ts.SFCFENB3, ts.SF )),max(c(ts.SFCFENB3, ts.SF))), ylab="Credito por sectores", main="Volumen de prestamos")

lines(ts.SFCFE , col="red")