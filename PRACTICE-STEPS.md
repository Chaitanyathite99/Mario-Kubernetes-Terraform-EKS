# Mario Game Deployment on AWS EKS using Terraform

## Project Flow

Terraform
   |
   |
AWS EKS Cluster
   |
   |
Worker Nodes
   |
   |
Kubernetes Deployment
   |
   |
Pods
   |
   |
Kubernetes LoadBalancer Service
   |
   |
AWS Network Load Balancer
   |
   |
Browser


==================================================

# 1. Go to Project Directory


cd Mario-on-Kubernetes-using-Terraform/EKS-TF


Check files:


ls


Files used:

main.tf
provider.tf
variables.tf
outputs.tf
deployment.yaml
service.yaml


==================================================

# 2. Check AWS Configuration


Verify AWS account:


aws sts get-caller-identity


Check configured region:


aws configure list


==================================================

# 3. Terraform Commands


Initialize Terraform:


terraform init


Validate Terraform:


terraform validate


Create Terraform plan:


terraform plan


Create AWS resources:


terraform apply


Confirm:

yes


Terraform created:


- EKS Cluster
- IAM Roles
- Node Group
- Security Groups
- OIDC Provider


==================================================

# 4. Check EKS Cluster


List EKS clusters:


aws eks list-clusters --region sa-east-1


Check cluster status:


aws eks describe-cluster \
--name EKS_CLOUD \
--region sa-east-1


Expected:


ACTIVE


==================================================

# 5. Connect kubectl with EKS


Update kubeconfig:


aws eks update-kubeconfig \
--name EKS_CLOUD \
--region sa-east-1


Check context:


kubectl config get-contexts


==================================================

# 6. Check Worker Nodes


View nodes:


kubectl get nodes


Expected:


STATUS

Ready


Detailed node check:


kubectl describe node <node-name>


==================================================

# 7. Deploy Mario Application


Create deployment:


kubectl apply -f deployment.yaml


Check deployment:


kubectl get deployment


Check pods:


kubectl get pods


Expected:


mario-deployment pods

Running


==================================================

# 8. Check Pod Information


Describe pod:


kubectl describe pod <pod-name>


Check logs:


kubectl logs <pod-name>


==================================================

# 9. Create LoadBalancer Service


Apply service:


kubectl apply -f service.yaml


Check service:


kubectl get svc


Example output:


mario-service

TYPE: LoadBalancer


==================================================

# 10. Get Application URL


Check LoadBalancer DNS:


kubectl describe svc mario-service


or


kubectl get svc


Copy:


xxxxx.elb.sa-east-1.amazonaws.com


Open:


http://xxxxx.elb.sa-east-1.amazonaws.com


Mario game will open in browser.


==================================================

# 11. Scaling Pods


Check pods:


kubectl get pods


Scale deployment:


kubectl scale deployment mario-deployment --replicas=2


Verify:


kubectl get pods


==================================================

# 12. Troubleshooting Commands


Check all pods:


kubectl get pods


Pod details:


kubectl describe pod <pod-name>


Service details:


kubectl describe svc mario-service


Check nodes:


kubectl get nodes


Check events:


kubectl get events


==================================================

# 13. Delete Application


Delete deployment:


kubectl delete -f deployment.yaml


Delete service:


kubectl delete -f service.yaml


==================================================

# 14. Destroy AWS Resources


Destroy Terraform infrastructure:


terraform destroy


Confirm:


yes


==================================================

# Project Explanation


I created AWS EKS infrastructure using Terraform.

Terraform created the EKS cluster, IAM roles, security groups, and worker nodes.

After connecting kubectl with EKS, I deployed the Mario application using Kubernetes Deployment.

I exposed the application using Kubernetes LoadBalancer Service.

AWS created the Network Load Balancer and provided DNS access.

The application became accessible through the browser.
