# Install Prometheus

```sh
helm install prometheus prometheus-communtity/prometheus

export POD_NAME=$(kubectl get pods -n default -l app=prometheus,component=server --output=jsonpath="{.items[*].metadata.name}")

kubectl -n default port-forward $POD_NAME 9090
```

# Query memory usage bytes

```
sum(container_memory_usage_bytes{namespace="default", container="cats-and-a-mouse"}) by (name)
```
