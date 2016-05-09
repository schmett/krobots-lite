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

if [ "$#" -eq "3" ]; then
  APP=$3
fi

case $CMD in
  help) USAGE; exit 0 ;;
  hyperkube) ;;
  install) ;;
  status) ;;
  detail) ;;
  update) ;;
  remove) ;;
  app) ;;
  *)
    echo "unknown command '$CMD'"
    exit 1
esac

if [ "$#" -lt "2" ];  then
  echo "Error: $CMD requires arguements"
  USAGE
  exit 1
fi

k8sfile="unknown"
k8s_status="get svc,ep,deployment,rs,hpa,rc,pods"
case $ARG in
  dns)
    k8sfile="kube-system/skydns.yml"
    k8s_status="get svc,ep,rc,pods --namespace=kube-system"
    ;;
  mysql)
    k8sfile="databases/mysql.yml"
    ;;
  psql)
    k8sfile="databases/psql.yml"
    ;;
  mongo)
    k8sfile="databases/mongo.yml"
    ;;
  elastic)
    k8sfile="databases/elastic.yml"
    ;;
  all)
    ;;
  *)
    echo "sorry, '$service' is still under construction. PR?"
esac

ISAPP=0
case $CMD in
  install)
    kubectl create -f $krobotsPath/$k8sfile
    ;;
  update)
    kubectl apply -f $krobotsPath/$k8sfile
    ;;
  status)
    kubectl $k8s_status
    ;;
  detail)
    echo "krobots detail... not implemented yet. PR?"
    exit 1
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

if [ "$ISAPP" -eq "0" ]; then
    exit 0
fi

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
    kubectl $k8s_status 
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


