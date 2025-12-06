# 🚀 Blue-Green Deployment on AWS using ASG + ALB

This project demonstrates a real-time **Blue-Green Deployment architecture** using **Auto Scaling Groups (ASG)**, **Application Load Balancer (ALB)**, and **Target Groups** in AWS. It enables **zero-downtime deployments**, seamless rollback, and scalable infrastructure for web applications.

---

## 📦 Project Overview

- **Blue Environment:** Deploys the [HexaShop template](https://templatemo.com/download/templatemo_571_hexashop)
- **Green Environment:** Deploys the [Liberty Market template](https://templatemo.com/download/templatemo_577_liberty_market)
- **Deployment Strategy:** Traffic is routed via ALB to either Blue or Green Target Group based on deployment phase.
- **Rollback Ready:** Blue remains active until Green is validated, allowing instant rollback if needed.

---
## Project Folder Structure

aws-blue-green-deployment/
│
├── README.md
├── architecture.png
├── screenshots/
│   ├── alb-config.png
│   ├── alb-resource-map.png
│   ├── alb-rule80-20.png   
|   ├── alb-rule-100.png
│   ├── blue-green-instances.png
│   ├── blue-green-launch-template.png
│   ├── target-groups.png
│   ├── user-data-blue.png
│   └── user-data-green.png
└── user-data/
    ├── blue-userdata.sh
    └── green-userdata.sh

---

## 🧱 Architecture Components

- **Application Load Balancer (ALB):** Single entry point for client traffic.
- **Target Groups (TG):**
  - `tg-frontend-blue` → linked to `asg-frontend-blue`
  - `tg-frontend-green` → linked to `asg-frontend-green`
- **Auto Scaling Groups (ASG):**
  - `asg-frontend-blue` → uses `lt-frontend-blue-v1`
  - `asg-frontend-green` → uses `lt-frontend-green-v2`
- **Launch Templates (LT):**
  - `lt-frontend-blue-v1` → installs HexaShop via user data
  - `lt-frontend-green-v2` → installs Liberty Market via user data

---

## 🚀 Deployment Steps

1. **Create Target Groups:** `tg-frontend-blue`, `tg-frontend-green`
2. **Create Launch Templates:**
   - Blue: install HexaShop
   - Green: install Liberty Market
3. **Create Auto Scaling Groups:**
   - Attach ASGs to respective TGs
4. **Configure ALB Listener:**
   - Initially routes traffic to TG-Blue
5. **Deploy Green Version:**
   - ASG-Green launches instances
   - Validate health checks
6. **Switch Traffic:**
   - Update ALB listener to TG-Green
7. **Rollback (if needed):**
   - Revert listener to TG-Blue
8. **Decommission Blue:**
   - Scale down or delete ASG-Blue

---

## ⚠️ Real-Time Anomaly

**Issue:** Green instances failed health checks  
**Cause:** Security Group blocked ALB health probe traffic  
**Fix:** Updated SG to allow port 80 from ALB → instances became healthy

---

## 🔧 Troubleshooting Checklist

- ✅ ASG attached to correct TG  
- ✅ Health check path and port configured  
- ✅ Security Group allows ALB traffic  
- ✅ User data script installs required packages  
- ✅ ALB listener rules updated correctly

---

## 📈 Improvements & Alternatives

- **Weighted Routing:** Gradual traffic shift using ALB rules  
- **Automation:** Integrate with CodeDeploy or CodePipeline  
- **Monitoring:** Use CloudWatch alarms and X-Ray  
- **Alternative:** Use ECS/EKS for containerized blue/green deployments

---

## 🏷️ Tags

`#AWS #DevOps #BlueGreenDeployment #ASG #ALB #ZeroDowntime #CloudArchitecture #UserData #ScalableInfrastructure`

---

## 📌 Author Notes

This project is designed for real-world deployment scenarios and can be adapted for any web application requiring safe, scalable, and rollback-capable release strategies.


## Licence
Copyright (c) 2025 Ghanashyama

Permission is hereby granted, free of charge, to use, copy, modify, and distribute this project for any purpose, including commercial applications, provided that the above copyright notice is included in all copies.

THE PROJECT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY ARISING FROM THE USE OF THIS PROJECT.
