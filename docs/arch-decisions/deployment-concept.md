#### Concepts & Constraints
- Everything running in containers, no installation of any binaries on local machine (Kubernetes, KubeCTL, Terraform.etc) other than Docker as containerization software.
- Same setup of containers and Kubernetes between local machine and cloud environment

Problems:
- Find a way to have a Terraform-based docker container to run a Kubernetes cluster using Docker as a container runtime on the local machine
- Have as much abstraction on top of Terraform code to allow re-use of code between local machine and cloud provider

Solution:
1. Create a docker container that is able to run Terraform code
2. Have one entrypoint of the Terraform code that takes a variable as an input (local or aws or..)
3. Forward this variable from the `.sh` or the `.ps1` file to the Terraform command running inside the docker container
4. Load the correct variables & providers based on the variable
5. Use [`kind`](https://kind.sigs.k8s.io/docs/user/quick-start/) inside the Terraform code to create and manage the Kubernetes infrastructure