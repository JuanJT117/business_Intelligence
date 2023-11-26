import pandas as pd
#import numpy as np
import matplotlib.pyplot as plt
#import geopandas
#from geodatasets import get_path

# copiado y archivo temporal
import shutil
import tempfile
# librerias para pronostico series de tiempo 
# empleando metodologia SARIMA
from statsmodels.tsa.arima.model import ARIMA
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
# se buscara realizar un modelo de pronostico de posibles clientes o 
# poblacion objetivo dentro de la zona de estudio definida como San
# Nicolas de los Garza en el estado de Nuevo Leon 
 
# Ruta del archivos y Lectura del csv

Poblacion_F = pd.read_csv('C:/Users/juanj/Workspace/business_Intelligence/PROYECTO FINAL/Datos/Poblacion.csv')
Poblacion_M = pd.read_csv('C:/Users/juanj/Workspace/business_Intelligence/PROYECTO FINAL/Datos/Poblacion_M.csv')
Mercado = pd.read_csv('C:/Users/juanj/Workspace/business_Intelligence/PROYECTO FINAL/Datos/Mercado_completo.csv')
Indicador_Socio = pd.read_csv('C:/Users/juanj/Workspace/business_Intelligence/PROYECTO FINAL/Datos/Indicador_Socioeconomico.csv')

#                    clasificacion y seleccion de datos

Mer = Mercado[['ID', 'AGEB', 'CMZ', 'LAT', 'LON', 'FiDENUE', 'NUE', 'NCA', 'EPO', 'NV']]
PoFe = Poblacion_F[['AGEB','CMZ','PF','PF_15_17','PF_18_24','PF_15_49','PF_60_MAS','P_15_64','P_65_100','THC']]
InSo = Indicador_Socio[['AGEB','PT','VVPH','PSDSP','VNDS','VNDL','VNDR','VNDT','VNDD','P_15_MAS_EBI']]

#                    analisis preliminar de los datos

print(PoFe.shape)

#


print('la dimenci[on de la base de datos de la poblacion de mujeres = ', PoFe.shape)
print('acontinuacion se mostraran las primeras 10 filas = ', PoFe.head(10))
print('Podemos observar los nombres de las columnas que componen el data set = ', PoFe.columns.values)
print('Se presentan los estadisticos vasicos de las colubnas = ', PoFe.describe())

#                   Graficos de frecuencias

PoFe['THC'].value_counts().plot(kind='bar')
plt.show()
