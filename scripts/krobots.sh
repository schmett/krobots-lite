#!/bin/bash

set -e

krobotsPath=${0%/*}
#krobotsPath=$(dirname $(readlink  $0))
printf "krobots-lite\n---------------\n\n"
# echo "$krobotsPath"

. $krobotsPath/krobots_helpers.sh

if [ "$#" -lt "1" ] || [ "$#" -gt "3" ];  then
  USAGE
  exit 1
fi

CMD=$1
ARG=$2

ISAPP=0
case $CMD in
  help) USAGE; exit 0 ;;
  hyperkube) 
    case $ARG in
      start)
        $krobotsPath/hyperkube.sh
        exit 0
        ;;
      stop)
        docker rm -f $(docker ps -aq)
        exit 0
        ;;
      *)
        echo "unknown arg to hyperkube: $ARG"
        USAGE
        exit 1
        ;;
    esac
    ;;
  install) ;;
  status) ;;
  detail) ;;
  update) ;;
  remove) ;;
  app)
    ISAPP=1
    ;;
  *)
    echo "unknown command '$CMD'"
    exit 1
esac

if [ "$#" -lt "2" ];  then
  echo "Error: $CMD requires arguements"
  USAGE
  exit 1
fi



if [ "$ISAPP" -eq "1" ]; then
    APP=`cat krobots.txt`
    CMD=$2
    echo "krobots: app ($APP) $CMD"
    case $CMD in
      create)
        echo "sorry, create is not implemented yet. PR?"
        ;;
      install)
        kubectl create -f krobots.yml
        ;;
      update)
        kubectl apply -f krobots.yml
        ;;
      status)
        kubectl get svc,ep,deployment,rs -l app=$APP
        ;;
      detail)
        echo "krobots detail... not implemented yet. PR?"
        exit 1
        ;;
      remove)
        kubectl delete -f krobots.yml
        ;;
      *)
        echo "shouldn't get here... CMD='$CMD'"
        exit 1

    esac

    exit 0
fi





k8sfile="unknown"
k8s_objects="svc,ep,deployment,rs,hpa,rc,pods"
k8s_labels=""
case $ARG in
  dns)
    k8sfile="k8s/dns.yml"
    k8s_objects="svc,ep,rc,pods --namespace=kube-system"
    ;;
  monitoring)
    k8sfile="k8s/monitoring.yml"
    ;;
  logging)
    k8sfile="k8s/logging.yml"
    ;;
  dashboard)
    k8sfile="k8s/dashboard.yml"
    ;;
  mysql)
    k8sfile="db/mysql.yml"
    k8s_labels="-l app=mysql"
    ;;
  psql)
    k8sfile="db/psql.yml"
    k8s_labels="-l app=postgres"
    ;;
  mongo)
    k8sfile="db/mongo.yml"
    k8s_labels="-l app=mongo"
    ;;
  elastic)
    k8sfile="db/elastic.yml"
    k8s_labels="-l app=elastic"
    ;;
  rabbitmq)
    k8sfile="msg/rabbitmq.yml"
    k8s_labels="-l app=rabbitmq"
    ;;
  kafka)
    k8sfile="msg/kafka.yml"
    k8s_labels="-l app=kafka"
    ;;
  redis)
    k8sfile="kv/redis.yml"
    k8s_labels="-l app=redis"
    ;;
  memcached)
    k8sfile="kv/memcached.yml"
    k8s_labels="-l app=memcached"
    ;;
  nginx)
    k8sfile="edge/nginx.yml"
    k8s_labels="-l app=nginx"
    ;;
  router)
    k8sfile="edge/router.yml"
    k8s_labels="--namespace=deis"
    k8s_objects="svc,ep,deployment,rs,pods"
    ;;
  all)
    k8s_objects="svc,ep,deployment,rs,pods"
    k8s_labels="--all-namespaces"
    ;;
  *)
    echo "sorry, '$ARG' is still under construction. PR?"
    exit 1
esac

case $CMD in
  install)
    kubectl create -f $krobotsPath/../k8s-objects/$k8sfile
    ;;
  update)
    kubectl apply -f $krobotsPath/../k8s-objects/$k8sfile
    ;;
  status)
    echo kubectl get $k8s_objects $k8s_labels
    kubectl get $k8s_objects $k8s_labels
    ;;
  detail)
    kubectl get $k8s_objects
    kubectl describe $k8s_objects
    ;;
  remove)
    kubectl delete -f $krobotsPath/../k8s-objects/$k8sfile
    ;;
  app)
    ISAPP=1
    ;;
  *)
    echo "shouldn't get here... CMD='$CMD'"
    exit 1

esac


