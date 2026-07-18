# Cloud-Native Blogging Platform Deployment using DevOps

## Project Overview

This project demonstrates the deployment of a **Cloud-Native Blogging Platform** using modern DevOps practices. The complete infrastructure is provisioned using **Terraform**, server configuration is automated using **Ansible**, containerization is performed with **Docker**, and deployment is automated through a **Jenkins CI/CD Pipeline**.

The platform consists of:

- Frontend Service (Nginx)
- Backend Service (Apache HTTP Server)
- MySQL Database
- Jenkins CI/CD Server

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
- Apache HTTP Server
- Ubuntu 24.04 LTS

---

# Project Architecture

```
                        Internet
                            │
                    Internet Gateway
                            │
                    Public Route Table
                            │
          ┌─────────────────┴─────────────────┐
          │                                   │
     Public Subnet                      Private Subnet
          │                                   │
    Bastion / Jenkins                  Database Server
      (Public IP)                         (MySQL)
          │
          │ SSH
          │
    Application Server
  (Docker Containers)
     ├── Frontend (Nginx)
     └── Backend (Apache)
```

---

# Infrastructure Provisioning (Terraform)

Terraform was used to provision the AWS infrastructure.

### Resources Created

- Custom VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Tables
- Security Groups
- Bastion EC2 Instance
- Application EC2 Instance
- Database EC2 Instance

### Terraform Outputs

- Bastion Public IP
- Application Private IP
- Database Private IP

---

# Configuration Management (Ansible)

Ansible was used to automate software installation and configuration.

### Tasks Performed

- Passwordless SSH Configuration
- Install Docker
- Install Docker Compose
- Deploy Frontend Container
- Deploy Backend Container
- Install MySQL
- Verify Running Services

Run the playbook using:

```bash
ansible-playbook -i inventory playbook.yml
```

---

# Docker Deployment

## Frontend

- Nginx Container
- Port: 80

## Backend

- Apache HTTP Server Container
- Port: 8080

## Database

- MySQL Server
- Port: 3306

Run using:

```bash
docker compose up -d
```

---

# Jenkins CI/CD Pipeline

The Jenkins pipeline automates the deployment process.

### Pipeline Stages

1. Clone Repository from GitHub
2. Build Docker Image
3. Deploy Docker Container

### Sample Jenkins Pipeline

```groovy
pipeline {

    agent any

    stages {

        stage('Clone Repository') {

            steps {

                git branch: 'main',
                    url: 'https://github.com/Ankitaa0909/blog.git'

            }

        }

        stage('Build Docker Image') {

            steps {

                sh 'docker build -t blog-app .'

            }

        }

        stage('Deploy Application') {

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

# Validation

The following tasks were successfully completed:

- Terraform infrastructure created
- VPC configured
- Public & Private Subnets created
- Internet Gateway configured
- Route Tables configured
- Security Groups configured
- Bastion Instance deployed
- Application Instance deployed
- Database Instance deployed
- Docker installed
- Docker Compose installed
- Frontend deployed successfully
- Backend deployed successfully
- MySQL installed successfully
- Jenkins installed successfully
- GitHub repository integrated
- Docker image built through Jenkins
- Application deployed using Jenkins Pipeline
- Application accessible through browser

---

# Repository Structure

```
BlogProject/
│
├── main.tf                 # Terraform infrastructure configuration
├── outputs.tf              # Terraform output values
├── inventory               # Ansible inventory file
├── playbook.yml            # Ansible playbook for configuration management
├── Dockerfile              # Docker image configuration
├── docker-compose.yml      # Multi-container Docker deployment
├── Jenkinsfile             # Jenkins CI/CD pipeline
├── index.html              # Sample frontend web page
├── README.md               # Project documentation
├── LICENSE                 # MIT License
├── SECURITY.md             # Security policy
├── CONTRIBUTING.md         # Contribution guidelines
└── .gitignore              # Ignore sensitive and unnecessary files
```

---

# File Description

| File | Description |
|------|-------------|
| **main.tf** | Creates AWS infrastructure including VPC, subnets, Internet Gateway, route tables, security groups, and EC2 instances. |
| **outputs.tf** | Displays Terraform outputs such as Bastion Public IP, Application Private IP, and Database Private IP. |
| **inventory** | Defines Application and Database hosts managed by Ansible. |
| **playbook.yml** | Installs Docker, Docker Compose, deploys frontend/backend containers, and installs MySQL. |
| **Dockerfile** | Builds the Docker image for the frontend application. |
| **docker-compose.yml** | Deploys frontend, backend, and MySQL containers using Docker Compose. |
| **Jenkinsfile** | Defines the Jenkins Pipeline for cloning, building, and deploying the application. |
| **index.html** | Sample web page used as the frontend application. |
| **README.md** | Complete documentation of the project. |
| **LICENSE** | MIT License allowing reuse and modification. |
| **SECURITY.md** | Security policy and vulnerability reporting guidelines. |
| **CONTRIBUTING.md** | Guidelines for contributors. |
| **.gitignore** | Prevents Terraform state files, AWS credentials, SSH keys, logs, and temporary files from being committed. |

---

# Future Enhancements

- Kubernetes Deployment
- Amazon EKS Integration
- Terraform Modules
- AWS Load Balancer
- Auto Scaling Group
- HTTPS using Nginx Reverse Proxy
- Prometheus Monitoring
- Grafana Dashboard
- AWS CloudWatch Integration

---

# Learning Outcomes

This project demonstrates practical implementation of:

- Infrastructure as Code (Terraform)
- Configuration Management (Ansible)
- Containerization (Docker)
- CI/CD Automation (Jenkins)
- Version Control (Git & GitHub)
- Cloud Deployment on AWS
- DevOps Best Practices

---

# Author

**Ankita Kadam**

**DevOps | Cloud Computing | AWS | Terraform | Docker | Jenkins | Ansible**

GitHub: **https://github.com/Ankitaa0909**

---

# License

This project is licensed under the **MIT License**. See the **LICENSE** file for more details.
