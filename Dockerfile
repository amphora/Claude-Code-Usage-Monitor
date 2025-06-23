# Use official Python runtime as base image
FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app

# Install Node.js and npm for ccusage CLI tool
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Install ccusage globally
RUN npm install -g ccusage

# Copy Python requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create the directory structure that ccusage expects
RUN mkdir -p "/root/.claude"

# Copy the Python script
COPY ccusage_monitor.py .

# Make the script executable
RUN chmod +x ccusage_monitor.py

# Set the entrypoint to run the monitor
ENTRYPOINT ["python", "./ccusage_monitor.py"]