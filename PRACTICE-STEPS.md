# Mario Game Deployment on AWS EKS using Terraform and Kubernetes

## Project Overview

This project deploys the Mario game application on AWS EKS cluster using Terraform and Kubernetes.

Technologies Used:

- AWS EKS
- Terraform
- Kubernetes
- Docker
- Docker Hub
- AWS Load Balancer
- IAM
- VPC


# 1. Clone Repository

git clone <repository-url>

cd Mario-Kubernetes-Terraform-EKS


# 2. Check Terraform Files

ls

Expected files:

main.tf
provider.tf
variables.tf
outputs.tf
backend.tf


# 3. Configure AWS CLI

aws configure

Enter:

AWS Access Key
AWS Secret Key
AWS Region


Verify:

aws sts get-caller-identity


# 4. Initialize Terraform

terraform init


# 5. Check Terraform Configuration

terraform validate


# 6. Create Execution Plan

terraform plan


# 7. Create AWS Infrastructure

terraform apply


Resources Created:

- IAM Roles
- EKS Cluster
- Node Group
- Security Groups
- OIDC Provider
- Load Balancer Controller Role


# 8. Connect Kubernetes with EKS

aws eks update-kubeconfig \
--name EKS_CLOUD \
--region sa-east-1


Verify:

kubectl config get-contexts


# 9. Check Cluster Nodes

kubectl get nodes


Expected:

STATUS
Ready


# 10. Deploy Mario Application


Deploy application:

kubectl apply -f deployment.yaml


Check pods:

kubectl get pods


Detailed:

kubectl describe pod <pod-name>


# 11. Create Kubernetes Service


Deploy LoadBalancer:

kubectl apply -f service.yaml


Check service:

kubectl get svc


Example:

TYPE
LoadBalancer


Get LoadBalancer URL:

kubectl describe svc mario-service


# 12. Access Application


Check LoadBalancer DNS:

kubectl get svc


Open:

http://LoadBalancer-DNS


# 13. Kubernetes Scaling


Check deployment:

kubectl get deployment


Scale application:

kubectl scale deployment mario-deployment --replicas=3


Verify:

kubectl get pods


# 14. Horizontal Pod Autoscaler


Apply HPA:

kubectl apply -f horizontal-pod-autoscaler.yaml


Check:

kubectl get hpa


Describe:

kubectl describe hpa


# 15. Network Policy


Apply:

kubectl apply -f network-policy.yaml


Check:

kubectl get networkpolicy


# 16. Docker Image


Login Docker Hub:

docker login


Pull image:

docker pull chaitanyathite/mario:latest


Run container:

docker run -d \
-p 80:80 \
--name mario-game \
chaitanyathite/mario:latest


Check:

docker ps


Open:

http://localhost


# 17. Create Own Docker Image


Tag image:

docker tag sevenajay/mario:latest chaitanyathite/mario:latest


Push:

docker push chaitanyathite/mario:latest


Verify:

docker images


# 18. Debug Commands


Check pods:

kubectl get pods


Pod logs:

kubectl logs <pod-name>


Service details:

kubectl describe svc mario-service


Node details:

kubectl describe node <node-name>


Events:

kubectl get events


# 19. Destroy Infrastructure


Remove Kubernetes resources:

kubectl delete -f deployment.yaml

kubectl delete -f service.yaml


Destroy AWS resources:

terraform destroy


# Complete Architecture Flow


Developer

↓

Docker Image

↓

Docker Hub

↓

AWS EKS

↓

Kubernetes Deployment

↓

Kubernetes Service

↓

AWS LoadBalancer

↓

User Browser


# Final Result

Mario Game successfully deployed on AWS EKS using Terraform and Kubernetes.
