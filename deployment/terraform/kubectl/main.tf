terraform {
  
}

# admissionregistration.k8s.io/v1
# apiextensions.k8s.io/v1
# apiregistration.k8s.io/v1
# apps/v1
# authentication.k8s.io/v1
# authorization.k8s.io/v1
# autoscaling/v1
# autoscaling/v2
# batch/v1
# certificates.k8s.io/v1
# coordination.k8s.io/v1
# discovery.k8s.io/v1
# events.k8s.io/v1
# flowcontrol.apiserver.k8s.io/v1
# flowcontrol.apiserver.k8s.io/v1beta3
# networking.k8s.io/v1
# node.k8s.io/v1
# policy/v1
# rbac.authorization.k8s.io/v1
# scheduling.k8s.io/v1
# storage.k8s.io/v1

resource "kubectl_manifest" "manifest" {
    yaml_body = <<-YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend-app
spec:
  selector:
    matchLabels:
      app: backend-app
  replicas: 2
  template:
    metadata:
      labels:
        app: backend-app
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80


YAML
}
