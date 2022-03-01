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

# Query histogram quantile

```
histogram_quantile(0.95, sum(rate(http_server_request_duration_seconds_bucket{app="cats-and-a-mouse"}[5m])) by (le))

histogram_quantile(0.95, sum(rate(http_server_request_duration_seconds_bucket{app="cats-and-a-mouse"}[5m])) by (le, path))
```

# Query requests total

```
sum(irate(http_server_requests_total[5m])) by(app)
```
