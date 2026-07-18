# Cloud-Native Blogging Platform Deployment using DevOps

## Project Overview

This project demonstrates the deployment of a Cloud-Native Blogging Platform using DevOps practices. The infrastructure is provisioned using Terraform, configured with Ansible, and automated through a Jenkins CI/CD pipeline.

The platform consists of:

- Frontend Service
- Backend API Service
- MySQL Database

---

## Technologies Used

- AWS EC2
- AWS VPC
- Terraform
- Ansible
- Docker
- Docker Compose
- Jenkins
- Git & GitHub
- MySQL
- Nginx
- Ubuntu 24.04 LTS

---

## Project Architecture

```
                Internet
                    |
             Internet Gateway
                    |
             Public Subnet
          -------------------
          |                 |
      Bastion Node     Application Node
       (Jenkins)       (Docker Containers)
                            |
                     Private Subnet
                            |
                     Database Node
                          MySQL
```

---

## Infrastructure Provisioning (Terraform)

Terraform was used to provision the complete AWS infrastructure.

Resources Created:

- Custom VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Tables
- Security Groups
- Bastion EC2 Instance
- Application EC2 Instance
- Database EC2 Instance

Terraform Outputs:

- Bastion Public IP
- Application Private IP
- Database Private IP

---

## Configuration Management (Ansible)

Ansible was used to automate server configuration.

Tasks Performed:

- Passwordless SSH configuration
- Docker Installation
- Docker Compose Installation
- Frontend Container Deployment
- Backend Container Deployment
- MySQL Installation
- Service Verification

---

## CI/CD Pipeline (Jenkins)

Jenkins was configured to automate deployment.

Pipeline Stages:

1. Clone source code from GitHub
2. Build Docker Image
3. Deploy Docker Container

Example Jenkins Pipeline:

```groovy
pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Ankitaa0909/blog.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t blog-app .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker rm -f blog-app || true
                docker run -d --name blog-app -p 8081:80 blog-app
                '''
            }
        }
    }
}
```

---

## Docker

Frontend deployed using:

- Nginx

Backend deployed using:

- Apache HTTP Server

Database:

- MySQL Server

---

## Project Validation

The following validations were successfully completed:

- Terraform infrastructure created successfully
- EC2 instances launched
- Docker installed
- Docker Compose installed
- Frontend deployed
- Backend deployed
- MySQL configured
- Jenkins installed
- Jenkins Pipeline executed successfully
- Application accessible through browser

---

## Repository Structure

```
BlogProject/
│
├── main.tf
├── outputs.tf
├── inventory
├── playbook.yml
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── README.md
```

---

## Future Improvements

- Kubernetes Deployment
- AWS EKS Integration
- Terraform Modules
- Monitoring using Prometheus & Grafana
- HTTPS using Nginx Reverse Proxy
- Auto Scaling
- Load Balancer Integration

---

## Author

**Ankita Kadam**

DevOps | Cloud | AWS | Terraform | Docker | Jenkins | Ansible

GitHub: https://github.com/Ankitaa0909
