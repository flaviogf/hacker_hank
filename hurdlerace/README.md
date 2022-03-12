# HurdleRace

## Path
```
/
```

## Request body

```json
{
  "k": 4,
  "height": [1, 6, 5, 1]
}
```

## Response body
```json
{
  "data": 2,
}
```

## curl

```sh
curl 'http://localhost:8080' -H 'Content-Type: application/json' --data '{"k": 4, "height": [1, 6]}'
```
