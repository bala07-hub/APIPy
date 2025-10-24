# Use an official lightweight Python image
FROM python:3.11-alpine

# Set the working directory
WORKDIR /app

# Copy requirements and install dependencies first (for cache optimization)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the main application code
COPY app.py .

# Expose the port Flask runs on
EXPOSE 5000

# Define the command to run your app
CMD ["python", "app.py"]