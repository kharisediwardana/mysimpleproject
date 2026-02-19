This is simple project for deployment learn purpose.
tech stack :
- Docker as Containerization
- Terraform as Provisioning
- GCP as Cloud Server
- Kubernetest as Container Orchestra

# Setup Instruction

docker

- build image
  docker build -t my-app .

- run container
  docker run -p 8000:8000 my-app

- open app
  open http://172.17.0.2:8000/home

# terraform

- login to cloud server
- initiate to get exist infrastucture in cloud server
  terraform init

- compare scripts with exist in cloud server
  terraform plan

- apply the changes
  terrafrom apply

# Grafana and Promentheus

- login to cloud server
- Add prometheus and grafana to server repo using helm
  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  helm repo add grafana https://grafana.github.io/helm-charts
  helm repo update

- install prometheus
  helm install prometheus prometheus-community/kube-prometheus-stack

- add prometheus to dashboard
  kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090
  kubectl port-forward svc/prometheus-grafana 3000:80

- login grafana using url
  Username: admin
  Password: prom-operator
