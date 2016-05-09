#!/bin/bash

krobotsPath=${0%/*}
krobotsPath=$(dirname $(readlink  $0))
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
        `$krobotsPath/hyperkube.sh`
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

    CMD=$2
    case $CMD in
      create)
        echo "sorry, create is not implemented yet. PR?"
        ;;
      install)
        kubectl create -f k8s-app.yml
        ;;
      update)
        kubectl apply -f k8s-app.yml
        ;;
      status)
        kubectl get svc,ep,deployment,rs
        ;;
      detail)
        echo "krobots detail... not implemented yet. PR?"
        exit 1
        ;;
      remove)
        kubectl delete -f k8s-app.yml
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
    k8sfile="k8s/skydns.yml"
    k8s_status="svc,ep,rc,pods --namespace=kube-system"
    ;;
  mysql)
    k8sfile="db/mysql.yml"
    ;;
  psql)
    k8sfile="db/psql.yml"
    ;;
  mongo)
    k8sfile="db/mongo.yml"
    ;;
  elastic)
    k8sfile="db/elastic.yml"
    ;;
  rabbitmq)
    k8sfile="msg/rabbitmq.yml"
    ;;
  kafka)
    k8sfile="msg/kafka.yml"
    ;;
  redis)
    k8sfile="kv/redis.yml"
    ;;
  memcached)
    k8sfile="kv/memcached.yml"
    ;;
  nginx)
    k8sfile="edge/nginx.yml"
    ;;
  router)
    k8sfile="edge/router.yml"
    ;;
  all)
    ;;
  *)
    echo "sorry, '$service' is still under construction. PR?"
esac

case $CMD in
  install)
    kubectl create -f $krobotsPath/$k8sfile
    ;;
  update)
    kubectl apply -f $krobotsPath/$k8sfile
    ;;
  status)
    kubectl get $k8s_objects
    ;;
  detail)
    kubectl get $k8s_objects
    kubectl describe $k8s_objects
    ;;
  remove)
    kubectl delete -f $krobotsPath/$k8sfile
    ;;
  app)
    ISAPP=1
    ;;
  *)
    echo "shouldn't get here... CMD='$CMD'"
    exit 1

esac


