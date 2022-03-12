## HurdleRace API

### `/`

Request:
```json
{
  "k": 4,
  "height": [1, 6, 5, 1]
}
```

Response:
```json
{
  "data": 2,
}
```

Example:
```sh
curl -XPOST 'http://localhost:8080' -H 'Content-Type: application/json' --data '{"k": 4, "height": [1, 6, 5, 1]}'
```
