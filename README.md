# tarefas-bd
Esse repositório é dedicado a tarefas de banco de dados de 2026

## Tarefa 03 - Docker Compose, MariaDB e Administração de SGBD

Os arquivos da Tarefa 03 ficam na pasta [`tarefa03/`](tarefa03/):

| Arquivo | Finalidade |
|---|---|
| [`docker-compose.yml`](tarefa03/docker-compose.yml) | Sobe o MariaDB 11 (`lab-mariadb`) e o CloudBeaver (`lab-cloudbeaver`), com volume nomeado `mariadb_data` para persistência. |
| [`.env.example`](tarefa03/.env.example) | Modelo das variáveis de ambiente (sem segredos reais). Copie para `.env` e ajuste a senha. |
| [`.gitignore`](tarefa03/.gitignore) | Impede que o `.env` com credenciais locais seja versionado. |
| [`povoamento.sql`](tarefa03/povoamento.sql) | Carga expandida gerada com IA: 10 autores e 27 livros adicionais. |
| [`setup.sql`](tarefa03/setup.sql) | Script idempotente que recria do zero o banco `biblioteca`, as tabelas, os usuários com privilégios e toda a carga de dados. |

### Como executar

```bash
cd tarefa03
cp .env.example .env   # edite a senha de root
docker compose up -d
docker exec -i lab-mariadb mariadb -uroot -p"<senha>" < setup.sql
```

CloudBeaver: http://localhost:8978 (host da conexão: `mariadb`, porta `3306`).
