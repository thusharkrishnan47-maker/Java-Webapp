<img width="940" height="630" alt="image" src="https://github.com/user-attachments/assets/d05fe272-e56b-456d-af53-3ddc9285af0b" />

---

# 🚀 Java Web Application CI/CD Pipeline on AWS using Jenkins, Docker, Ansible & Kubernetes (K3s)

## 📌 Project Overview

This project demonstrates a **complete end-to-end CI/CD pipeline** implemented on **AWS EC2 instances** for a Java web application.
The pipeline automatically builds, packages, and deploys the application to a **Kubernetes (K3s) cluster** whenever code is pushed to GitHub.

The implementation follows **real-world DevOps best practices**, including immutable Docker images, automated deployments, and zero-downtime rolling updates.

---

## 🛠️ Technology Stack

* **Source Control:** GitHub
* **CI/CD Tool:** Jenkins
* **Build Tool:** Maven
* **Containerization:** Docker
* **Image Registry:** Docker Hub
* **Configuration Management / Deployment:** Ansible
* **Container Orchestration:** Kubernetes (K3s)
* **Infrastructure:** AWS EC2

---

## 🏗️ Architecture Overview

```
Developer
   ↓
GitHub (Webhook)
   ↓
Jenkins (CI)
   ↓
Maven Build
   ↓
Docker Image (BUILD_NUMBER tag)
   ↓
Docker Hub
   ↓
Ansible (CD)
   ↓
Kubernetes (K3s – Rolling Update)
```

---

## 🖥️ Infrastructure Setup

Two AWS EC2 instances are used:

| Instance          | Purpose                                     |
| ----------------- | ------------------------------------------- |
| Jenkins Server    | CI/CD orchestration, build, Docker, Ansible |
| Kubernetes Server | K3s cluster for application runtime         |

---

## ⚙️ Jenkins Server Setup

### 1. Java Installation (Amazon Corretto 21)

```bash
sudo dnf install -y java-21-amazon-corretto
java -version
```

---

### 2. Jenkins Installation

```bash
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo curl -o /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo dnf install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

Initial admin password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

### 3. Git, Maven, Docker & Ansible Installation

```bash
sudo dnf install -y git
sudo dnf install -y maven
sudo dnf install -y docker
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

sudo dnf install -y ansible
ansible --version
```

---

## 🔐 SSH Trust Setup (Jenkins → Kubernetes)

### Generate SSH Key on Jenkins Server

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
```

---

### Configure SSH on Kubernetes Server

```bash
mkdir -p /home/ec2-user/.ssh
chmod 700 /home/ec2-user/.ssh
vi /home/ec2-user/.ssh/authorized_keys
chmod 600 /home/ec2-user/.ssh/authorized_keys
chown -R ec2-user:ec2-user /home/ec2-user/.ssh
```

This enables **passwordless SSH access** for Ansible deployments.

---

## ☸️ Kubernetes (K3s) Server Setup

### Install K3s

```bash
curl -sfL https://get.k3s.io | sh -
sudo systemctl status k3s
```

---

### Configure kubectl for ec2-user

```bash
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown ec2-user:ec2-user ~/.kube/config
chmod 600 ~/.kube/config
```

Persist configuration:

```bash
echo 'export KUBECONFIG=$HOME/.kube/config' >> ~/.bashrc
source ~/.bashrc
```

Verify cluster:

```bash
kubectl get nodes
kubectl get pods -A
```

---

## 🔑 Jenkins Credentials Configuration

Configured in **Jenkins → Manage Credentials**:

### 1. GitHub Credentials

* Used for source code checkout

### 2. Docker Hub Credentials

* Type: Username & Password
* Credential ID: `dockerhub-creds`

### 3. Kubernetes SSH Credential

* Type: SSH Username with Private Key
* Credential ID: `k3s-ssh-key`
* Username: `ec2-user`

---

## 🔁 GitHub Webhook Configuration

**Repository:**
👉 [https://github.com/thusharkrishnan47-maker/Java-Webapp.git](https://github.com/thusharkrishnan47-maker/Java-Webapp.git)

Webhook URL:

```
http://<JENKINS_PUBLIC_IP>:8080/github-webhook/
```

* Content type: `application/json`
* Trigger: Push events

This ensures Jenkins is triggered automatically on every commit.

---

## 🚀 CI/CD Pipeline Flow

1. Code is pushed to GitHub
2. GitHub webhook triggers Jenkins
3. Jenkins builds the application using Maven
4. Docker image is built and tagged with `${BUILD_NUMBER}`
5. Image is pushed to Docker Hub
6. Jenkins triggers Ansible playbook
7. Ansible updates Kubernetes Deployment using `kubectl set image`
8. Kubernetes performs a rolling update (zero downtime)

---

## 📊 Runtime Visibility

The deployed JSP application displays:

* CI build number
* Deployment timestamp
* Pod hostname
* Pod IP address

This confirms successful CI/CD execution and Kubernetes runtime behavior.

---

## ✅ Final Outcome

* Fully automated CI/CD pipeline
* Immutable Docker image versioning
* Zero-downtime rolling deployments
* Clean separation of CI (Jenkins) and CD (Ansible)
* Production-style Kubernetes deployment

---

## 🧠 Key Learnings

* Kubernetes redeploys only when pod templates change
* Avoid using `latest` Docker tag in production
* Jenkins orchestrates; Ansible handles deployment
* SSH key management is critical for automation
* Rolling updates ensure high availability

---

## 📌 One-Line Summary

> Implemented a complete CI/CD pipeline on AWS EC2 where Jenkins builds and packages a Java application, Docker containerizes it, Ansible deploys it, and Kubernetes runs it with rolling updates.

---

## 📎 Repository Link

👉 [https://github.com/thusharkrishnan47-maker/Java-Webapp.git](https://github.com/thusharkrishnan47-maker/Java-Webapp.git)

---
