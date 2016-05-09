# krobots-lite

Easy-to-use and up-to-date Kubernetes tutorials based on the k8s hyperkube.

Insprired by my Kubernetes talk at Hack Reactor on May 13, 2016.


## Front Matter

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

- [Databases](docs/db/README.md)
  - [MySQL](docs/db/mysql.md) `krobots <cmd> mysql`
  - [Postgres](docs/db/psql.md) `krobots <cmd> psql`
  - [MongoDB](docs/db/mongo.md) `krobots <cmd> mongo`
  - [Elasticsearch](docs/db/elastic.md) `krobots <cmd> elastic`
- [KeyValue](docs/kv/README.md.md)
  - [Redis](docs/kv/redis.md) `krobots <cmd> redis`
  - [Memcached](docs/kv/memcached.md) `krobots <cmd> memcached`
- [Messaging](docs/msg/README.md)
  - [Kafka](docs/msg/kafka.md) `krobots <cmd> kafka`
  - [RabbitMQ](docs/msg/bunnies.md) `krobots <cmd> rabbitmq`
- [Edge Servers](docs/edge/README.md.md)
  - [Nginx Frontend](docs/edge/nginx.md) `krobots <cmd> nginx`
  - [Deis Router](docs/edge/router.md) `krobots <cmd> router`
- [k8s Addons](docs/k8s/README.md)
  - [DNS](docs/k8s/dns.yml) `krobots <cmd> dns`
  - [Registry](docs/k8s/registry.yml) `krobots <cmd> registry`
  - [Monitoring](docs/k8s/monitoring.yml) `krobots <cmd> monitoring`
  - [Logging](docs/k8s/logging.yml) `krobots <cmd> logging`
  - [Dashboard](docs/k8s/dashboard.yml) `krobots <cmd> dashboard`


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

- [Web apps](docs/webapps.md)
  - [NodeJS](docs/app/nodejs.md)
  - [Python](docs/app/python.md)
  - [Golang](docs/app/golang.md)


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




