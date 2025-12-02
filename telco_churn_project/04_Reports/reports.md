**Resumen del Proyecto**

 - **Propósito**: Predecir el abandono de clientes (churn) en una compañía de telecomunicaciones para permitir acciones de retención proactivas.
 - **Alcance**: Construir un pipeline reproducible que cubra adquisición y preparación de datos, análisis exploratorio, modelado y recomendaciones de negocio.

**Metodología**: CRISP‑DM aplicada de forma iterativa: Comprensión del negocio, Comprensión de datos, Preparación de los datos, Modelado, Evaluación y Despliegue/Implementación.

**Datos y Artefactos Clave**
- **Datos crudos**: `02_Data/raw/WA_Fn-UseC_-Telco-Customer-Churn.csv`
- **Datos procesados**: `02_Data/processed/telco_churn_processed.csv` (nombre: `telco_churn_processed.csv`)
- **Notebooks**: `01_Notebooks/1_churn_prediction_crisp_dm.ipynb` (ETL y preparación) y `03_Models/models.ipynb` (experimentación y modelos)
- **Imágenes y recursos**: `imgs/`

**Preparación de Datos**
- **Limpieza**: Se eliminó la columna `customerID` y se convirtieron campos erróneamente tipados como `TotalCharges` a numérico, eliminando filas con valores inválidos en esa columna.
- **Transformaciones**: Se unificaron valores categóricos (`no internet service`/`no phone service` → `no`), se aplicó codificación one‑hot (con `drop_first=True`) y se estandarizaron las variables numéricas (`tenure`, `monthlycharges`, `totalcharges`) con `StandardScaler`.
- **Salida**: DataFrame final guardado en `02_Data/processed/telco_churn_processed.csv` para uso en modelado.

**Exploración y Hallazgos Iniciales**
- **Desbalance de clases**: La variable objetivo `Churn` presenta desequilibrio (aprox. ~73% `No` vs ~27% `Yes`), por lo que conviene priorizar métricas que penalicen falsos negativos (recall) y usar técnicas para manejar el desbalance si es necesario.
- **Variables relevantes**: Variables relacionadas con tipo de contrato, método de pago y servicios contratados (internet, streaming, soporte) suelen correlacionar con churn en análisis típicos; se recomienda análisis de importancia de features (SHAP/Permutation) posterior.

**Modelado**
- **Enfoque**: Clasificación binaria (Churn: 1 = Yes, 0 = No). Pipeline recomendado: preprocesamiento reproducible → selección/ingeniería de features → entrenamiento con validación estratificada → calibración y evaluación sobre conjunto de test.
- **Modelos candidatos**: Logistic Regression, Random Forest, XGBoost/LightGBM. Empezar con modelos interpretables (Logistic, Random Forest con importancia de variables) y avanzar a modelos de mayor capacidad si mejora la métrica objetivo.
- **Métricas principales**: **Recall (sensibilidad)** para priorizar la detección de clientes que abandonarán; **ROC AUC** para discriminación global; además reportar precisión, F1, matriz de confusión y, si aplica, métricas calibradas (Brier score).

**Resultados y Observaciones**
- **(Pendiente: ejecutar notebooks de modelado)** Los notebooks contienen el pipeline de preparación y las plantillas para modelado; si se desea, puedo ejecutar/validar los experimentos y adjuntar métricas numéricas concretas.
- **Recomendación operacional**: Implementar un sistema de puntuación de riesgo (probabilidad de churn) y priorizar las acciones de retención en clientes con alta probabilidad y alto valor de vida (CLV).

**Reproducibilidad y Cómo Ejecutar**
- Abrir y ejecutar los notebooks en el siguiente orden para reproducir el pipeline:
	- `01_Notebooks/1_churn_prediction_crisp_dm.ipynb` — limpieza y guardado de `telco_churn_processed.csv`.
	- `03_Models/models.ipynb` — experimentación y evaluación de modelos.
- Asegurarse de que la estructura de carpetas se mantiene y que `02_Data/raw` contiene el CSV original.

**Limitaciones y Riesgos**
- **Datos históricos**: Modelo entrenado sobre una instantánea; cambios en la oferta o comportamiento del cliente pueden degradar desempeño.
- **Sesgo / representatividad**: Revisar variables demográficas (p. ej., `SeniorCitizen`) para evitar decisiones sesgadas.
- **Calidad de etiquetas**: Verificar que la etiqueta `Churn` refleje el objetivo de negocio actual.

**Siguientes Pasos Recomendados**
- Ejecutar los notebooks de modelado y registrar métricas (train/val/test).
- Realizar análisis de importancia de variables (SHAP o Permutation) para explicar predicciones.
- Experimentar con re‑muestreo (SMOTE, undersampling) o técnicas de ponderación para el desbalance si mejora recall sin degradar demasiado precisión.
- Preparar un prototipo de scoring (API ligera o batch job) y diseñar una campaña piloto de retención para clientes con mayor riesgo.

**Contacto y Recursos**
- **Repositorio**: la estructura del proyecto está en la carpeta `telco_churn_project/`.
- Si quieres, procedo a: ejecutar los notebooks y anexar resultados concretos; o generar un notebook de evaluación automática con métricas y gráficas.

---

Fecha de elaboración: 2025-12-02

