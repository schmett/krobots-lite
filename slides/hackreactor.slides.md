name: inverse
layout: true
class: center, middle, inverse
---

# AppOps for a Greater Good



<br><br>

Dr. Tony Worm

verdverm@gmail.com

IBM Watson - AppOps


.footnote[Project Site: [krobots.io](https://github.com/krobots/krobots-lite)]

---

layout: false
class: left, top

# Agenda

1. Introduction
1. Overview
1. Theory
1. Deep-dive
1. Demo [unicode for crossed fingers]
1. Hands On with krobots-lite

---


# Introduction

Docker is great,
it makes isolation, configuration, consistency, and development
easy.

Running lots of containers is hard.


---

# Enter Kubernetes

Kubernetes is an open-source container orchestration framework.

- Released by Google 2 years ago.
- Based on their Borg container system.

"Cluster-level operation system"

---


# Four Levels in the Stack

add Diagram here

---

# Theory




---


# DevOps becomes AppOps

Kubernetes automates common cluster-level tasks.

- Service Discovery
- Deployment management
- Load-balancing & health checks
- Fault-tolerance & High-availability
- Security, secrets, org/user accounts.

It enables developers to manage much fo the
traditional role of DevOps and system admins.

---

# Two Pieces to understand

Services are _Named Endpoints_

- Named set of Pods
- Service discovery
- Load balancing

Pods are _Single Intention_

- One or more containers
- Horizontally scalable (12 factor)
- Looks and acts as a single unit

Powered by tags, labels, and annotations.

---
# Examples

- Pods and Deployments
- Services
- Accessing services

---

# Pods and Deployment

Header:

```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: "..."
```

Spec:

```
spec:
  replicas: #
  template:
    metadata:
      labels: "..."
      annotations: "..."
    spec:
      serviceAccount: "..."
      containers:
      - name: "..."
        image: "..."
        env: "..."
        ports: "..."
        volumeMounts: "..."
        resources: "..."
      volumes: "..."
      securityContext: "..."
```

---

# Pods and Deployment - sample

```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: "golang-webapp"
spec:
  replicas: 2
  template:
    metadata:
      labels:
        app: golang-webapp
        group: webapp
        tier: frontend
        env: dev
    spec:
      containers:
      - name: golang-webapp
        image: "kubernetes/guestbook:v2"
        ports:
        - containerPort: 3000
```

---

# Services

Header:

```
apiVersion: v1
kind: Service
metadata:
  name: "..."
  labels: "..."
  annotations: "..."
```

Spec:

```
spec:
  type: "..."
  ports: "..."
  selector: "..."
```


---

# Services - sample

```
apiVersion: v1
kind: Service
metadata:
  name: "golang-webapp"
  labels:
    app: golang-webapp
    group: webapp
    tier: frontend
    env: dev
    router.deis.io/routable: "true"
  annotations:
    router.deis.io/domains: guestbook,hyper-k8s,www.krobots.io,krobots.io
spec:
  ports:
    - port: 80
      targetPort: 3000
  selector:
    app: golang-webapp
    group: webapp
    tier: frontend
    env: dev
```

---

# Accessing a service



---


# Demo

1. Docker-machine
1. Clone repository
1. Launch cluster
1. edit /etc/hosts
1. Add DNS
1. Add Redis
1. Add guestbook-go
1. Expose service
1. Show in browser
1. Repeat for todos



