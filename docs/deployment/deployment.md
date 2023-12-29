## Deployment
#### Prerequisites
- [Docker version > 24.0](https://docs.docker.com/engine/install/)

#### Installation
##### For Windows
Use Powershell and run the following: `cd deployment && ./deploy.ps1 local`

##### For Linux
Use a terminal and run the following: `cd deployment && ./deploy.sh local`


###### Explanation
This builds a terraform docker image that is able to run terraform commands. The docker image has the ability to create docker containers on the host machine by sharing the docker socket via the volume command when running the docker container. 
After building the image, it runs terraform apply to create the required containers on the host local machine.

###### Reasoning
Please check [Deployment Concept / Architecture decision](../arch-decisions/deployment-concept.md)