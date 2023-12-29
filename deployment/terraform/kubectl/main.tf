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
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-resource-backend
spec:
  rules:
  - http:
      host: sample-app.local
      paths:
      - path: /testpath
        pathType: "Prefix"
        backend:
          serviceName: test
          servicePort: 80
-------------------------------------
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376

YAML
}
