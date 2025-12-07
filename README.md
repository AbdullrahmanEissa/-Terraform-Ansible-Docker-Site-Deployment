# 🌐 **Terraform-Ansible Docker Site Deployment**
# 🚀 Terraform + Ansible Automated Docker Website Deployment  
A fully automated infrastructure-as-code project deploying a Dockerized website on AWS using **Terraform**, **Ansible**, and **AWS Application Load Balancer (ALB)**.

This project demonstrates modern DevOps practices and production-grade architecture using clean, simple, modular, and repeatable automation.

---

## 📌 Project Overview

This setup automatically:

1. **Creates EC2 instances on AWS** using **Terraform**  
2. **Generates an Ansible inventory file dynamically**  
3. **Configures each EC2 instance** via **Ansible**  
4. **Deploys a Docker container** running your website  
5. **Creates an Application Load Balancer (ALB)** to expose the website publicly in a secure, scalable way  

Everything is hands-free after `terraform apply`.

---

## 🏗️ Architecture Diagram (Conceptual)

```

Internet → Application Load Balancer → Target Group → EC2 Instances
|
→ Docker Container (Website)

```

- ALB = public-facing  
- EC2 = private-facing (accessible only from the ALB)  
- Docker = hosting your website  
- Terraform = builds the infrastructure  
- Ansible = configures it  

---

## 🧩 Tech Stack

- **Terraform** (AWS provisioning)
- **Ansible** (server configuration)
- **Docker** (application deployment)
- **AWS EC2**
- **AWS Application Load Balancer (ALB)**
- **Ubuntu 22.04 LTS AMI**

---

## 📁 Project Structure

```

.
├── main.tf               # Terraform infrastructure configuration
├── inventory             # Auto-generated Ansible inventory
├── ansible.cfg           # Global Ansible configuration
├── playbook.yml          # Full server setup + Docker deployment
└── terraform.tfstate     # Terraform state (local)

````

---

## ⚙️ How It Works

### 1️⃣ **Terraform Phase**

Terraform will:

- Fetch the latest Ubuntu AMI  
- Create two EC2 instances  
- Generate the inventory file (`inventory`) automatically  
- Create a security group  
- Create a Target Group  
- Create an Internet-facing Load Balancer  
- Attach EC2 instances to the Target Group  

Run:

```bash
terraform init
terraform apply -auto-approve
````

---

### 2️⃣ **Ansible Phase**

After Terraform finishes, deploy configuration:

```bash
ansible-playbook playbook.yml
```

Ansible will:

* Update package repos
* Install Docker
* Install Git
* Clone your website repo
* Build the Docker image
* Run the container
* Expose it on port 80

---

## 🌍 Accessing the Website

Once finished, you can access your site from:

```
http://<LOAD_BALANCER_DNS_NAME>
```

Terraform outputs this automatically (or you can get it from AWS Console).

---

## 🔐 SSH Access (Important)

The EC2 instances are **not exposed to the Internet** directly.

They only accept traffic from the **Load Balancer**.

This is a best practice for production systems.

---

## 🧹 Cleanup

To delete all resources:

```bash
terraform destroy -auto-approve
```

---

## 🏆 Why This Project is Awesome

* Fully-automated end-to-end DevOps pipeline
* Clean separation between Infrastructure (Terraform) & Configuration (Ansible)
* Scalable production-grade architecture
* Dockerized application
* Professional-level structure great for CVs and portfolios

---

## 👨‍💻 Author

**Abdullrahman Sherief Eissa**
Linux System Administrator & DevOps Engineer
GitHub: [https://github.com/AbdullrahmanEissa](https://github.com/AbdullrahmanEissa)

---

## 📜 License

This project is open-source under the MIT License.

```
