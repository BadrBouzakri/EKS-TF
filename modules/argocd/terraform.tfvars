# Configurations ArgoCD
fall-project_repo = "https://github.com/BadrBouzakri/EKS-TF.git"
GIT_SECRET_KEY = " "
profile = "prod"

# Configurations du hostname et des ingress pour ArgoCD
argocd_server_host = "argocd-projet.badr.cloud"
argocd_ingress_class = "nginx"
argocd_ingress_enabled = true
argocd_ingress_tls_acme_enabled = "true"
argocd_ingress_ssl_passthrough_enabled = "true"

# Configurez d'autres variables du projet si nécessaire
namespace = "eks-tf"
region = "eu-west-1"
cluster_name = "eks-tf-cluster"
instance_number = 2
instance_type = "t3a.medium"
root_domain_name = "eks-tf.example.com"
GRAFANA_PWD = "StrongPassword123!"