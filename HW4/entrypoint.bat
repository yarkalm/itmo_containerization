docker build -t app/init_image:latest .
minikube start
minikube image load app/init_image:latest
kubectl apply -f .
