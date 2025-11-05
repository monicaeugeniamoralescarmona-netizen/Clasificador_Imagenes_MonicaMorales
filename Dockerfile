# Imagen base ligera con Python 3.10
FROM python:3.10-slim

# Evitar bytecode y buffering
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# El puerto que Cloud Run asigna por defecto
ENV PORT=8080

# Crear directorio de trabajo
WORKDIR /app

# Copiar todos los archivos del proyecto
COPY . /app

# Instalar dependencias
RUN pip install --no-cache-dir fastapi uvicorn tensorflow pillow python-multipart

# Mostrar el puerto (informativo)
EXPOSE 8080

# --- comando de inicio ---
# "api" debe coincidir con el nombre exacto del archivo api.py
CMD ["python", "-m", "uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8080"]
