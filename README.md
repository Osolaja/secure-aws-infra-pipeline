# Secure AWS Infrastructure Deployment Pipeline

## Overview

This project implements a secure AWS infrastructure using Terraform and a CI/CD pipeline with security best practices.

---

## Architecture

The infrastructure includes:

* VPC with public and private subnets
* Application Load Balancer (public)
* EC2 instance (private subnet, no public IP)
* RDS database (private subnet)
* S3 bucket (secure storage)
* IAM roles (no hardcoded credentials)
* CloudTrail and CloudWatch logging
* KMS encryption
* Secrets Manager for sensitive data

---

## CI/CD Pipeline Stages

1. Terraform Format Check
2. Terraform Validate
3. Terraform Plan
4. Terraform Security Scan (KICS)
5. Manual Approval
6. Terraform Apply

---

## Security Controls Implemented

### 1. Identity & Access Management

* IAM roles used instead of access keys
* Principle of least privilege applied

### 2. Network Security

* EC2 deployed in private subnet
* No SSH (port 22) open to 0.0.0.0/0
* ALB handles public traffic

### 3. Data Protection

* S3 encryption enabled
* S3 Block Public Access enabled
* RDS encrypted using KMS

### 4. Monitoring & Logging

* CloudTrail enabled for API logging
* Logs sent to CloudWatch
* Audit trail stored in S3

### 5. Secrets Management

* Database credentials stored securely in Secrets Manager
* No hardcoded secrets in Terraform

### 6. DevSecOps Integration

* KICS scan prevents insecure infrastructure deployment
* Security integrated into CI/CD pipeline

---

## Tools Used

* Terraform
* AWS
* GitHub Actions
* KICS (Security scanning)

---

## Outcome

This project demonstrates a secure, production-ready infrastructure deployment pipeline with DevSecOps best practices.
