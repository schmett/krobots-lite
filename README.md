# krobots-lite

AppsOps and tutorials based on the k8s hyperkube.


**_Warning, not everything works yet, but should soon.
This is a week long spare time project before Friday.
[Tony, May 8, 2016 :]_**

Jump to [Installing krobots and kubernetes](docs/install.md) for now.


## Front Matter

This project was insprired by my Kubernetes talk at Hack Reactor on May 13, 2016.

[Documentation](docs/README.md):
- [Installing krobots and kubernetes](docs/install.md)
- [Overview and theory to kubernetes](docs/theory.md)
- [Walkthrough of a simple application](docs/simple.md)
- [Explination of k8s objects and services](docs/k8s-objs.md)
- [Advanced example using krobots-lite](docs/advanced.md)
- [More krobots examples and templates](docs/examples.md)


## A Quick Overview

Now that we have a Kubernetes environment,
we can start creating all sorts of k8s services and objects.

**krobots-lite** comes with a host of services in its library.
You will find the list just below.
You can also create your own apps to run
in the hyperkube. The next section covers that.

#### Available Services

krobots-lite has the following services in its library.
With any of the services you can

```
krobots install <service>
krobots status  <service>
krobots detail  <service>
krobots remove  <service>
```

- [Databases](docs/k8s-objects/db/README.md)
  - [ ] [MySQL](docs/k8s-objects/db/mysql.md) `krobots <cmd> mysql`
  - [ ] [Postgres](docs/k8s-objects/db/psql.md) `krobots <cmd> psql`
  - [ ] [MongoDB](docs/k8s-objects/db/mongo.md) `krobots <cmd> mongo`
  - [ ] [Elasticsearch](docs/k8s-objects/db/elastic.md) `krobots <cmd> elastic`
- [KeyValue](docs/k8s-objects/kv/README.md.md)
  - [Redis](docs/k8s-objects/kv/redis.md) `krobots <cmd> redis`
  - [Memcached](docs/k8s-objects/kv/memcached.md) `krobots <cmd> memcached`
- [Messaging](docs/k8s-objects/msg/README.md)
  - [Kafka](docs/k8s-objects/msg/kafka.md) `krobots <cmd> kafka`
  - [RabbitMQ](docs/k8s-objects/msg/bunnies.md) `krobots <cmd> rabbitmq`
- [Edge Servers](docs/k8s-objects/edge/README.md.md)
  - [Nginx Frontend](docs/k8s-objects/edge/nginx.md) `krobots <cmd> nginx`
  - [Deis Router](docs/k8s-objects/edge/router.md) `krobots <cmd> router`
- [k8s Addons](docs/k8s-objects/k8s/README.md)
  - [DNS](docs/k8s-objects/k8s/dns.yml) `krobots <cmd> dns`
  - [Registry](docs/k8s-objects/k8s/registry.yml) `krobots <cmd> registry`
  - [Monitoring](docs/k8s-objects/k8s/monitoring.yml) `krobots <cmd> monitoring`
  - [Logging](docs/k8s-objects/k8s/logging.yml) `krobots <cmd> logging`
  - [Dashboard](docs/k8s-objects/k8s/dashboard.yml) `krobots <cmd> dashboard`


Don't see your favorite here? Make a PR!


#### Preparing and using your application

You should now be able to interact
with your k8s cluster from your code.

The next secion covers how to run your
app in the hyperkube cluster.
You will need to add a `Dockerfile` and `krobots-app.yml`
to your project.
If you are using a krobots-lite
builder pack, see thoses pages
for more information.



## Running Apps on Kubernetes

You can now run just about anything on kubernetes!
This process involves 

1. Deploying your app's service dependencies.
1. Building and testing your applications
1. Packaging and deploying your own app.
1. Exposing your app to the internet.
1. Modifying code and updating your app.

To simplify some of this, krobots-lite
comes with a services library and
the following builder packs too.

- [Web apps](docs/k8s-objects/app/README.md)
  - [NodeJS](docs/k8s-objects/app/nodejs.md)
  - [Python](docs/k8s-objects/app/python.md)
  - [Golang](docs/k8s-objects/app/golang.md)


#### Deploying your tech stack dependencies

See the section above. Basically you `krobots install <service>`



## Deploying New Code

how to do rolling updates with new code





## Where To Next

Kubernetes is a significant project and there is much to know.
Here are some suggestions for deepening your understanding.


Kubernetes, broadly

- Kubernetes 101, 201
- Glossary
- Videos

Storage: 

Need for explination...




