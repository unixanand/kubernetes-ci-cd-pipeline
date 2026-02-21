📦 Kubernetes CI/CD Pipeline with Jenkins, Docker & K3s
🚀 Project Overview

This project demonstrates a complete end-to-end DevOps CI/CD pipeline that automatically builds, pushes, and deploys an application into a Kubernetes cluster running on an AWS EC2 instance.

The entire infrastructure and platform setup is automated using Ansible, and application deployment is handled through Jenkins pipelines.

🧱 Architecture Summary

GitHub → Jenkins Pipeline → Docker Hub → Kubernetes (K3s) → Streamlit App

Flow

Developer pushes code to GitHub

GitHub webhook triggers Jenkins pipeline

Jenkins builds Docker image

Image pushed to Docker Hub

Kubernetes deployment updated automatically

Application runs inside K3s cluster

🛠️ Technology Stack
Layer	Technology
Cloud	AWS EC2
Configuration Management	Ansible
CI/CD	Jenkins
Containerization	Docker
Container Registry	Docker Hub
Orchestration	K3s (Lightweight Kubernetes)
Application	Streamlit
Version Control	GitHub


⚙️ Infrastructure Automation

Ansible automatically performs:

✅ Install Docker
✅ Install K3s Kubernetes
✅ Configure kubeconfig access
✅ Build Jenkins Docker image
✅ Install Docker CLI + kubectl inside Jenkins
✅ Run Jenkins container
✅ Enable Jenkins → Kubernetes communication

🔄 CI/CD Pipeline Stages
1️⃣ Clone Repository

Jenkins pulls source code from GitHub.

2️⃣ Build Docker Image

Application container image is built dynamically using the latest code.

3️⃣ Push to Docker Hub

Jenkins authenticates using stored credentials and pushes the image.

4️⃣ Deploy to Kubernetes

Pipeline updates the running deployment using kubectl.

☸️ Kubernetes Deployment Features

✅ Deployment object for app lifecycle management
✅ Service exposure using NodePort
✅ Health checks (liveness + readiness probes)
✅ Resource limits and requests
✅ Rolling updates
✅ Self-healing pods

📁 Project Structure

kubernetes-ci-cd-pipeline/
│
├── ansible/
│   └── setup.yml
│
├── k8s/
│   └── streamlit-deployment.yaml
│
├── Jenkinsfile
├── Dockerfile
└── app.py


▶️ How to Run This Project
Step 1 — Provision EC2

Create Ubuntu EC2 instance with open ports:

22 (SSH)

8080 (Jenkins)

30001 (App access)

Step 2 — Run Ansible Playbook

ansible-playbook setup.yml -i inventory

This installs:
✔ Docker
✔ Jenkins
✔ Kubernetes (K3s)
✔ kubectl
✔ Full CI/CD environment

Step 3 — Configure Jenkins

Add Docker Hub credentials

Create pipeline job

Connect GitHub webhook

Step 4 — Deploy Application

Push code to GitHub → Automatic deployment

🌐 Access the Application

http://<EC2-PUBLIC-IP>:30001


📊 Key DevOps Concepts Demonstrated

✔ Infrastructure as Code
✔ Containerization
✔ Continuous Integration
✔ Continuous Deployment
✔ Kubernetes Orchestration
✔ Automated Provisioning
✔ Pipeline Automation

