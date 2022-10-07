docker build -t sriraj14/multi-client:latest -t sriraj14/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sriraj14/multi-server:latest -t sriraj14/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sriraj14/multi-worker:latest -t sriraj14/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sriraj14/multi-client:latest
docker push sriraj14/multi-server:latest
docker push sriraj14/multi-worker:latest
docker push sriraj14/multi-client:$SHA
docker push sriraj14/multi-server:$SHA
docker push sriraj14/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=sriraj14/multi-server:$SHA
kubectl set image deployments/client-deployment server=sriraj14/multi-client:$SHA
kubectl set image deployments/worker-deployment server=sriraj14/multi-worker:$SHA


