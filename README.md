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

## Accesso remoto via tunnel SSH

Per connettere un client (DBeaver, pgAdmin, psql) da una macchina remota senza esporre la porta su internet:

```powershell
# Da Windows (PowerShell) — tunnel per entrambi i database:
ssh -L 127.0.0.1:11433:localhost:1433 -L 127.0.0.1:15434:localhost:5434 -N utente@host

# Solo PostgreSQL:
ssh -L 127.0.0.1:15434:localhost:5434 -N utente@host
```

L'opzione `-N` mantiene il tunnel senza aprire la shell. Lascia il terminale aperto.

Poi nel client:

| Campo | Valore |
|---|---|
| Host | `127.0.0.1` |
| Port | `15434` |
| Database | `devdb` |
| Username | `dev` |
| Password | `DevPassword123!` |

Scegli una porta locale libera diversa da `15434` se è già in uso.

## Note

- Porta 5434 per evitare conflitti con altre istanze Postgres (es. grain su 5432)
- Immagine Alpine (~250MB vs ~400MB standard)
- Dati persistenti in volume Docker `postgres_data`
