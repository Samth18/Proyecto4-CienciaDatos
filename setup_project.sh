#!/bin/bash

# Nombre del directorio raíz del proyecto
PROJECT_NAME="telco_churn_project"

echo "Creando la estructura de directorios para el proyecto: $PROJECT_NAME"

# Crear el directorio raíz
mkdir $PROJECT_NAME
cd $PROJECT_NAME

# Directorios principales alineados con el flujo de trabajo de ciencia de datos
mkdir 01_Notebooks   # Para los archivos .ipynb (Comprensión, Prep., Modelado, Evaluación)
mkdir 02_Data        # Para almacenar los datasets
mkdir 03_Models      # Para guardar los modelos entrenados (.pkl, .h5, etc.)
mkdir 04_Reports     # Para la presentación de Canva, PDF del proyecto y conclusiones

# Subdirectorios dentro de Data (CRISP-DM: Comprensión y Preparación)
mkdir 02_Data/raw      # Datos originales sin modificar (Aquí va telco-customer-churn.csv)
mkdir 02_Data/processed  # Datos limpios, escalados y listos para modelar

# Crear un archivo README básico
touch README.md

# Crear un archivo placeholder para el notebook principal
touch 01_Notebooks/1_churn_prediction_crisp_dm.ipynb

echo "Estructura de directorios creada con éxito en ./$PROJECT_NAME"
echo "--------------------------------------------------------"
echo "Recuerda mover 'telco-customer-churn.csv' a la carpeta 02_Data/raw"c