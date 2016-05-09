# Installing and Setting Up krobots-lite

This document will walk you through the process 
of installing and setting up kuberenetes hyperkube
and the krobots-lite cli tool.

## Getting Setup

You only need [Docker](www.docker.com) and this repository.
Instructions will be based on OS X, but should work on linux with minor changes.

```
# Get the project
git clone https://github.com/verdverm/krobots-lite
cd krobots-lite

# sudo install the tool
sudo ln -s $(PWD)/scripts/krobots.sh /usr/local/bin/krobots

# set the data directory
# defaults to the install directory
# you should put this in your .profile
export KROBOTS_DATADIR=/path/to/data
```


## Starting Kubernetes

To simplify things, we will be using the Kubernetes **hyperkube**.
It is a self contained docker container for experimenting with Kubernetes.
We will then connect the `kubectl` tool to our dockerized cluster.

#### Starting the Hyperkube

```
krobots hyperkube start
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

## Installing cluster Addons

Kubernetes has a number of addons
for DNS, logging, monitoring,
and many more. We definitely
recommend adding the DNS,
so go through the next two sections.

You can find more addons here:
[kubernetes/cluster/addons](https://github.com/kubernetes/kubernetes/tree/master/cluster/addons)

#### Adding kube-system namespace

We need to add a `kube-system` namespace
which the kubernetes addons live within.

```
kubectl create namespace kube-system
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
krobots install dns
```

You can verify that dns is setup, run

```
kubectl cluster-info
krobots status dns
```


#### Adding cluster Registry

```
krobots install registry
```


#### Adding cluster Monitoring

```
krobots install monitoring
```


#### Adding cluster Logging

```
krobots install logging
```


#### Adding cluster Dashboard

```
krobots install dashboard
```



