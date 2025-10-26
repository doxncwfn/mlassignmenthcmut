# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    JUPYTER_ENABLE_LAB=yes

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY data/ ./data/
COPY src/ ./src/
COPY readme.md .

# Expose Jupyter port
EXPOSE 8888

# Create a startup script
RUN echo '#!/bin/bash\njupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token="" --NotebookApp.password=""' > /app/start.sh && \
    chmod +x /app/start.sh

# Run Jupyter notebook
CMD ["/app/start.sh"]
