set -e

NAME="kubernetes_demo-api"
USERNAME="fad16papa"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Applying Kubernetes manifest..."
kubectl apply -f k8s/

echo "Getting pods status..."
kubectl get pods

echo "Getting service status..."
kubectl get services

echo "Fetching the main services..."
kubectl get services $NAME-service