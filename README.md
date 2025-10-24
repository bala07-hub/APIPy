# 🐍 Minimal Python Flask API with Docker

[](https://opensource.org/licenses/MIT)
[](https://www.python.org/)
[](https://www.docker.com/)

A simple, lightweight Flask (Python) web API containerized using Docker. This project serves as a clean, minimal example for practicing **Docker image building**, **container deployment**, and **EC2 integration** on memory-constrained environments like the AWS Free Tier.

## 🚀 Project Overview

The application is a single-file Flask server that exposes one endpoint (`/`) and demonstrates the ability to read environment variables from within the container.

### Core Features

  * **Minimal Footprint:** Uses the lightweight `python:3.11-alpine` base image, resulting in a small final image size ($\approx 70 \text{ MB}$).
  * **Single Endpoint:** Returns a "Hello World" message along with the container's hostname.
  * **Production-Ready Workflow:** Uses a standard `Dockerfile` pattern (copy dependencies first, then code) to maximize caching efficiency.

## 🛠 Tech Stack

  * **Language:** Python 3.11
  * **Framework:** Flask
  * **Containerization:** Docker
  * **Base Image:** `python:3.11-alpine`

## 📂 Project Structure

```
.
├── app.py                  # The main Flask application file
├── requirements.txt        # Lists required Python dependencies (Flask)
└── Dockerfile              # Instructions to build the container image
```

## 🏗 Containerization & Local Setup

### 1\. Prerequisites

Ensure you have **Docker** installed on your local machine or your remote Ubuntu/EC2 instance.

### 2\. Build the Docker Image

Navigate to the project directory (where `Dockerfile` is located) and run the build command.

```bash
docker build -t flask-api-app .
```

### 3\. Run the Container

Run the image, mapping the container's internal port **5000** to a port on your host machine (e.g., host port **5000**).

```bash
docker run -d -p 5000:5000 --name py-app flask-api-app
```

### 4\. Verification

Access the API via your browser or cURL:

```bash
curl http://localhost:5000/
# Example Output: Hello, Flask! Running on container: <container-id>
```

-----

## ☁️ Deployment to Docker Hub (Registry)

To make your container image available for deployment on any cloud provider (like AWS EC2), you must push it to a container registry like Docker Hub.

**Note:** Replace `balamanikanta7` with your actual Docker Hub username.

### 1\. Log In

```bash
docker login
```

### 2\. Tag the Image

Rename the local image to conform to the Docker Hub format: `<username>/<repository-name>:<tag>`.

```bash
docker tag flask-api-app:latest balamanikanta7/pyapi:latest
```

### 3\. Push the Image

Upload the tagged image to your Docker Hub repository.

```bash
docker push balamanikanta7/pyapi:latest
```

The image is now available globally\!

-----

## ⚙️ Deployment on AWS EC2 (Free Tier)

This application is ideal for deployment on a **t2.micro** instance.

### 1\. Preparation (EC2)

  * Ensure **Docker** is installed on your EC2 instance (Ubuntu/Amazon Linux).
  * Ensure your EC2 **Security Group** has an inbound rule open for **TCP Port 5000** (or Port 80, if you map it in the `run` command).

### 2\. Pull and Run

Log in to your EC2 instance via SSH, then pull and run the image directly from Docker Hub.

```bash
# Optional: Login if using a private repository, but not needed for public.
# docker login 

# Pull and run the image, mapping container port 5000 to host port 80
docker run -d -p 80:5000 --name py-api-prod balamanikanta7/pyapi:latest
```

### 3\. Access

Access your application using the EC2 instance's **Public IP Address** in your web browser. Since you mapped to host port 80, you do not need to specify a port in the URL.

```
http://<Your-EC2-Public-IP>
```
