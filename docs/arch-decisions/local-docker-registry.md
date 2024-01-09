# Deprecated
This document is longer relevant, only kept for historical reasons. By using kind load image, it was enough to not use a local registry


~~#### Concepts & Constraints

Everything running in containers, no installation of any binaries on local machine (Kubernetes, KubeCTL, Terraform.etc) other than Docker as containerization software.
Same setup of containers and Kubernetes between local machine and cloud environment
Problem:

Kubernetes IN Docker (Kind) as a terraform provider requires a registry to be able to pull images from, even a local one.
Solution:

Use terraform provider docker to create a container with a local registry to hold the images created in the local k8s cluster
Inject the local registry into the Kind cluster
Use images from the local registry~~