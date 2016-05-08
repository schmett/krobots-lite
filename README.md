# hackreactor_talk
Kubernetes talk at Hack Reactor on May 13, 2016


## Introduction


## Getting Setup

You only need [Docker](www.docker.com) and this repository.
Instructions will be based on OS X, but should work on linux with minor changes.

```
git clone https://github.com/verdverm/hackreactor_talk
cd hackreactor_talk
```


## Starting Kubernetes

To simplify things, we will be using the Kubernetes **hyperkube**.
It is a self contained docker container for experimenting with Kubernetes.
We will then connect the `kubectl` tool to our dockerized cluster.

#### Starting the Hyperkube

```
./scripts/start_hyperkube.sh
```

This will bring up a docker container 
which will in turn spawn a number of
Kubernetes containers.

#### Downloading the `kubectl` tool

`kubectl` is the CLI tool we use to talk to the cluster.

OS X:

```
curl -O "http://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/darwin/amd64/kubectl"
chmod 755 kubectl
sudo mv kubectl /usr/local/bin
```

Linux:

```
wget "http://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl"
chmod 755 kubectl
sudo mv kubectl /usr/local/bin
```

You can verify it is installed by running `kubectl version`



#### Connecting `kubectl` to the Hyperkube


For OS X only, we need to expose the localhost port inside the Docker Machine.
In a second terminal, run

```
docker-machine ssh $(docker-machine active) -N -L 8080:localhost:8080
```

Now we can tell the `kubectl` tool about our cluster.

```
kubectl config set-cluster hyper-k8s --server=http://localhost:8080
kubectl config set-context hyper-k8s --cluster=hyper-k8s
kubectl config use-context hyper-k8s
```

Test that it worked by running:

```
kubectl get nodes
```

You should see something similar to:

```
NAME        STATUS    AGE
127.0.0.1   Ready     18m
```

#### Adding cluster DNS

Having cluster NDS will allow us to easily find
and reference our services by name.

We can do things like...

```
db.connect("postgres:5432")

http.GET("myservice:9000/api/stuff")
```

Installing skydns:

```
kubectl create namespace kube-system
kubectl create -f k8s-objects/skydns.yml
```

You can verify that dns is setup, run

```
kubectl cluster-info
kubectl get svc,ep,rc,pods --namespace=kube-system
```



## Creating the k8s objects

Now that we have a Kubernetes environment,
we can start creating our MEAN stack objects.

The stack will consist of the following k8s objects:

- MongoDB
  -- Deployment
  -- Service
- NodeJS apps
  -- Deployment
  -- Service
- Nginx
  -- Deployment
  -- Service


MongoDB Deployment:

```
```






## Starting the MEAN stack






## Developing and deploying new code






## Where to next

Kubernetes is a significant project and there is much to know.
Here are some suggestions for deepening your understanding.


Kubernetes, broadly

- Kubernetes 101, 201
- Glossary
- Videos

Storage: 

Need for explination...






## TL;DR

on OS X:

```
# Get this repositort
git clone https://github.com/verdverm/hackreactor_talk
cd hackreactor_talk

# Start the Kubernetes hyperkube
./scripts/start_hyperkube.sh

# Download the kubectl tool




```


