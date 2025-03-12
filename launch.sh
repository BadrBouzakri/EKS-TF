#!/bin/bash

#aws eks update-kubeconfig --region eu-west-3 --name badr-project-cluster --profile eks_admin_role

export ARGO_PWD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

echo $ARGO_PWD

#export ARGOCD_SERVER=`kubectl get ingress argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname'`

export ARGOCD_SERVER='argocd-badr-project.olivierrey.cloudns.ph'

argocd login $ARGOCD_SERVER --username admin --password $ARGO_PWD --insecure

argocd repo rm git@github.com:CashNowMobile/badr-project-k8s.git

argocd repo add git@github.com:CashNowMobile/badr-project-k8s.git --ssh-private-key-path ~/.ssh/id_rsa_badr-project

argocd app create badr-project --repo git@github.com:CashNowMobile/badr-project-k8s.git --path helm/badr-project --revision main --values values.aws.yaml --dest-server https://kubernetes.default.svc --dest-namespace badr-project --sync-policy automated --self-heal

# TO delete app
#kubectl patch app -n argocd badr-project -p '{"metadata": {"finalizers": null}}' --type merge
#kubectl patch crd -n argocd badr-project -p '{"metadata": {"finalizers": null}}' --type merge
