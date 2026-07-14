# PostgreSQL Dev Container

PostgreSQL 16 Alpine per sviluppo e test locale.

## Avvio

```bash
docker compose up -d
```

## Accesso CLI

```bash
./cli.sh                       # shell interattiva psql
./cli.sh -c "SELECT version()" # query singola
```

## Credenziali

| Campo     | Valore           |
|-----------|------------------|
| Host      | localhost        |
| Porta     | 5434             |
| User      | dev              |
| Password  | DevPassword123!  |
| Database  | devdb            |

## Connection string (.NET)

```
Host=localhost;Port=5434;Database=devdb;Username=dev;Password=DevPassword123!
```

## Note

- Porta 5434 per evitare conflitti con altre istanze Postgres (es. grain su 5432)
- Immagine Alpine (~250MB vs ~400MB standard)
- Dati persistenti in volume Docker `postgres_data`
