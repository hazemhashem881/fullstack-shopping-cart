#! /usr/bin/bash
kubectl create namespace mern
echo "------------applying Database---------------"
kubectl apply -f ./db/conf.yaml
sleep 5s
kubectl apply -f ./db/pvc.yaml
sleep 3s
kubectl apply -f ./db/mong.yaml
sleep 10s

echo "------------applying Backend----------------"
kubectl apply -f ./backend/conf.yaml
sleep 5s
kubectl apply -f ./backend/deploy.yaml
sleep 10s
echo "------------apply Frontend------------------"
kubectl apply -f ./frondend/react.yml