FROM python:3.11-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Crear el entorno virtual y agregarlo al PATH
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copiar el archivo de dependencias e instalar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar los scripts y plantillas
COPY . .

# Exponer el puerto
EXPOSE 5000

# Comando de inicio
CMD ["python", "app.py"]