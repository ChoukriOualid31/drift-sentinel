# 🚀 Drift Sentinel - Enterprise MLOps Platform

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Java](https://img.shields.io/badge/Java-17-orange)](https://openjdk.org/)
[![Python](https://img.shields.io/badge/Python-3.11-blue)](https://www.python.org/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2-green)](https://spring.io/projects/spring-boot)

> **Production-grade MLOps platform with automated drift detection, model retraining, and secure deployment.**

Developed by **Oualid Choukri** - Software Engineer specializing in Backend (Java Spring Boot), MLOps, and DevSecOps

---

## 📖 Overview

Drift Sentinel is a complete, production-ready MLOps platform that demonstrates modern machine learning operations best practices. It handles the full ML lifecycle from data ingestion to automated model retraining and deployment.

### 🎯 Key Features

- ✅ **Automated Drift Detection** - Evidently-powered monitoring triggers retraining
- ✅ **Secure API Gateway** - Spring Boot 3 + Keycloak OIDC authentication
- ✅ **ML Model Serving** - FastAPI service with MLflow registry integration
- ✅ **Feature Store** - Feast for consistent online/offline features
- ✅ **Explainable AI** - SHAP values for model interpretability
- ✅ **Policy Enforcement** - OPA gates for model promotion
- ✅ **Full Observability** - Prometheus + Grafana + OpenTelemetry
- ✅ **CI/CD Pipelines** - Automated testing, security scanning, deployment

---

## 🏗️ Architecture

---

## 📦 Service Repositories

This project is organized into **separate microservices repositories**:

| Repository | Description | Tech Stack | Status |
|------------|-------------|------------|--------|
| [**backend**](https://github.com/oualid-choukri/drift-sentinel-backend) | Spring Boot API Gateway | Java 17, Spring Boot 3, Keycloak | 🚧 In Progress |
| [**ml-service**](https://github.com/oualid-choukri/drift-sentinel-ml-service) | Python ML inference | Python 3.11, FastAPI, MLflow | 🚧 In Progress |
| [**mlops**](https://github.com/oualid-choukri/drift-sentinel-mlops) | ML pipelines | DVC, MLflow, Evidently, XGBoost | 🚧 In Progress |
| [**infrastructure**](https://github.com/oualid-choukri/drift-sentinel-infrastructure) | Docker, K8s configs | Docker, Kubernetes, Prometheus | 🚧 In Progress |

---

## 🚀 Quick Start

### Prerequisites

- Docker 24+ and Docker Compose 2.20+
- Git with submodule support
- 16GB RAM (32GB recommended)
- 50GB free disk space

### Installation
```bash
# Clone with all submodules
git clone --recursive https://github.com/oualid-choukri/drift-sentinel.git
cd drift-sentinel

# Setup environment
bash scripts/setup.sh

# Start all services
docker compose up -d

# Check status
docker compose ps

Access Services
ServiceURLCredentialsBackend APIhttp://localhost:8081See KeycloakML Servicehttp://localhost:8000/docsN/AKeycloakhttp://localhost:8080admin / adminMLflowhttp://localhost:5000N/AGrafanahttp://localhost:3000admin / admin

🛠️ Tech Stack
Backend

Java 17, Spring Boot 3.2, Spring Security
Keycloak, PostgreSQL, OpenTelemetry

ML & Data

Python 3.11, FastAPI, scikit-learn, XGBoost
MLflow, DVC, Feast, Evidently, SHAP

Infrastructure

Docker, Kubernetes, Prometheus, Grafana
OPA, MinIO, Redis, Jaeger


📚 Documentation

Architecture Guide
Deployment Guide
Security Overview


🤝 Contributing
This is a portfolio project. Suggestions and improvements are welcome!

📝 License
MIT License - See LICENSE file

👤 Author
Oualid Choukri

Software Engineer specializing in Backend (Java Spring Boot), MLOps, and DevSecOps
GitHub: @oualid-choukri


⭐ If you find this project helpful, please consider giving it a star!

**Save the file:**
- Press `CTRL + X`
- Press `Y`
- Press `Enter`

---

## 🎯 STEP 3: Commit Your Changes

Now let's save your work to GitHub:
```bash
# Check what files changed
git status

# Add the files
git add README.md .env.example

# Commit with a message
git commit -m "docs: update README and add environment template"

# Push to GitHub
git push origin main

