# Kubernetes challenge

Deploy this application to [Minikube](https://github.com/kubernetes/minikube) and customise the environment variable to display your name.

```
$ curl $(minikube ip)
Hello Dan!
```

## Instructions

- Fork this repo
- Build the Docker image
- Write yaml files for a deployment, service, ingress and configmap
- Deploy your application to Minikube
- You should be able to `curl` Minikube's ip and retrieve the string `Hello {yourname}!`
- Commit your files to Github

## Notes

There's no need to push the Docker image to a Docker registry. You should be able to build and use the image from within Minikube.

You can expose Minikube's Docker daemon with:

```shell
$ eval (minkube docker-env)
```

# Solution
We setup docker, minikube, and kubectl using the given bash file
```
$ bash ./sh_setup.sh
```
It is advisable to log out and log back in so that the current user's shell is registered under the docker group
We build the docker image and tag it
```
$ bash ./sh_build.sh
```
We then compile and deploy the kubernetes deployment,service and ingress
```
$ bash ./sh_deploy.sh
```
We can then test the service
```
$ curl $(minikube ip)
```
