
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
#copiado y archivo temporal
import shutil
import tempfile
# librerias para pronostico series de tiempo 
#empleando metodologia SARIMA
from statsmodels.tsa.arima.model import ARIMA
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
#se buscara realizar un modelo de pronostico de posibles clientes o 
#poblacion objetivo dentro de la zona de estudio definida como San
# Nicolas de los Garza en el estado de Nuevo Leon 

#generamos un aerchivo temporal donde se realizara una copia de los
# datos que usaremos para trabajas, de nomodo que no los corrompamos

# Ruta del archivo original
archivo_original = 'C:/Users/juanj/Workspace/business_Intelligence/PROYECTO FINAL/poblacion_edades_nuevo_leon_claves_manzana.csv'

# Crear un archivo temporal
temp = tempfile.NamedTemporaryFile(delete=False)

# Copiar el contenido del archivo original al archivo temporal
shutil.copyfile(archivo_original, temp.name)

#Ruta de archivos
# Leemos el archivo csv
datos = pd.read_csv(temp.name)
#print(datos)

resultado = datos.loc[datos['Clave_de_municipio'] == '46']

print(resultado)
resultado.describe()
