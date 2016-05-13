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

## Agenda

1. Introduction
1. Overview
1. Theory
1. Deep-dive
1. Demo [unicode for crossed fingers]
1. Hands On with krobots-lite

[NOTE]: Note that you need remark.js alongside this html file, but no internet connection.
---


## Introduction

Docker is great,
it makes isolation, configuration, consistency, and development
easy.

Running lots of containers is hard.


---

## Enter Kubernetes

Kubernetes is an open-source container orchestration framework.

- Released by Google 2 years ago.
- Based on their Borg container system.

"Cluster-level operation system"

---


## 4 Tiers

add Diagram here

# Theory

---
## DevOps => AppOps

Kubernetes automates common cluster-level tasks.

- Service Discovery
- Deployment management
- Load-balancing & health checks
- Fault-tolerance & High-availability
- Security, secrets, org/user accounts.

It enables developers to manage much fo the
traditional role of DevOps and system admins.

---

## Two Pieces to understand

Services: Named Endpoint

- Named set of Pods
- Service discovery
- Load balancing

Pods: Single Intention

- One or more containers
- Horizontally scalable (12 factor)
- Looks and acts as a single unit

Powered by tags, lables, and annotations.

---
# Examples

- Pods
- Deployments
- Services
- Exposing and Accessing

---

## Pods - template


---

## Pods - sample

```
```

---

## Deployment - template



---

## Deployment - sample

```
```

---

## Services - template



---

## Services - sample

```
```

---

## Accessing a service



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



