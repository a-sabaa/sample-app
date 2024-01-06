#### Concepts & Constraints
- Everything running in containers, no installation of any binaries on local machine (Kubernetes, KubeCTL, Terraform.etc) other than Docker as containerization software.
- Same setup of containers and Kubernetes between local machine and cloud environment

Problem:
- Kubernetes IN Docker (Kind) as a terraform provider requires a registry to be able to pull images from, even a local one.

Solution:
1. Use terraform provider `docker` to create a container with a local registry to hold the images created in the local k8s cluster
2. Inject the local registry into the Kind cluster
3. Use images from the local registry