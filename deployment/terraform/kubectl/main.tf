terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}



resource "kubectl_manifest" "ngninx-config-map" {
  yaml_body = <<-YAML
kind: ConfigMap
apiVersion: v1
metadata:
  name: nginx-config
YAML
}

resource "kubectl_manifest" "nginx-ingress-class" {
  yaml_body = <<-YAML
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  name: nginx
  annotations:
    ingressclass.kubernetes.io/is-default-class: "true"
spec:
  controller: nginx.org/ingress-controller
  YAML
}

resource "kubectl_manifest" "nginx-ingress-resource" {
  yaml_body = <<-YAML
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: sample-ingress
spec:
  ingressClassName: nginx
  tls:
  - hosts:
    - sample-app.local
  rules:
  - host: sample-app.com
    http:
      paths:
      - path: /scalable
        pathType: Prefix
        backend:
          service:
            name: scalable-app
            port:
              number: 80
      - path: /backend
        pathType: Prefix
        backend:
          service:
            name: backend-app
            port:
              number: 80
  YAML
}

resource "kubectl_manifest" "deployment-backend-app" {
  yaml_body = <<-YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: backend-app
  template:
    metadata:
      labels:
        app: backend-app
    spec:
      containers:
      - name: backend-app
        image: backend-app:1.0
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 80
  YAML
}

resource "kubectl_manifest" "service-backend-app" {
  yaml_body = <<-YAML
apiVersion: v1
kind: Service
metadata:
  name: backend-app  
spec:
  type: ClusterIP
  ports:
  - port: 80
  selector:
    app: backend-app
  YAML
}

resource "kubectl_manifest" "deployment-scalable-app" {
  yaml_body = <<-YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: scalable-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: scalable-app
  template:
    metadata:
      labels:
        app: scalable-app
    spec:
      containers:
      - name: scalable-app
        image: scalable-app:1.0
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 80
  YAML
}

resource "kubectl_manifest" "service-scalable-app" {
  yaml_body = <<-YAML
apiVersion: v1
kind: Service
metadata:
  name: scalable-app  
spec:
  type: ClusterIP
  ports:
  - port: 80
  selector:
    app: scalable-app
  YAML
}