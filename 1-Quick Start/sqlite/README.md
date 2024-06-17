## Quick Start: Utilizando SQLite no Docker

SQLite é um sistema de gerenciamento de banco de dados relacional (RDBMS) leve e de código aberto. Diferente de outros sistemas de banco de dados que usam um processo cliente-servidor, SQLite é um mecanismo de banco de dados embutido que escreve diretamente em arquivos de disco. Ele é ideal para aplicações pequenas a médias, desenvolvimento, testes e situações onde a simplicidade e a portabilidade são importantes.

Nesta seção, vamos aprender como usar o SQLite no Docker. O Docker é uma ferramenta de containerização que permite empacotar e distribuir aplicativos em contêineres, facilitando a implantação e a execução de serviços.

### Requisitos
- Certifique-se de ter o Docker instalado no seu sistema. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: https://docs.docker.com/get-docker/.

### Utilizando Docker
SQLite é um banco de dados embutido, então não há um "servidor" para subir como em outros RDBMS. Em vez disso, vamos usar um contêiner Docker para criar e interagir com um banco de dados SQLite. Aqui está um exemplo de como você pode fazer isso usando um contêiner Docker com uma imagem que possui o SQLite instalado.

### Criando o Banco de Dados SQLite

Primeiro, crie um arquivo Dockerfile com o seguinte conteúdo para criar uma imagem Docker que possui o SQLite instalado:

```Dockerfile
FROM alpine:latest

RUN apk add --no-cache sqlite

WORKDIR /data

ENTRYPOINT ["sqlite3"]
```

Em seguida, crie um arquivo `docker-compose.yml` para facilitar a execução do contêiner:

```yaml
version: '3.8'

services:
  sqlite:
    build: .
    container_name: sqlite
    volumes:
      - ./data:/data
    entrypoint: ["sqlite3", "/data/store.db"]
```

### Subindo o Contêiner SQLite

Navegue até o diretório onde você criou os arquivos `Dockerfile` e `docker-compose.yml` e execute o seguinte comando para construir e subir o contêiner:

```shell
docker-compose up -d
```

### Interagindo com o Banco de Dados SQLite

Para interagir com o banco de dados SQLite, você pode acessar o contêiner Docker e usar o cliente de linha de comando do SQLite:

```shell
docker exec -it sqlite sqlite3 /data/store.db
```

Isso abrirá o cliente de linha de comando do SQLite onde você pode executar comandos SQL para criar tabelas, inserir dados e consultar o banco de dados.

### Nota

SQLite é uma ótima escolha para desenvolvimento, testes e pequenas aplicações. Ele é fácil de usar e não requer configuração complexa. No entanto, para aplicações maiores ou ambientes de produção que necessitam de funcionalidades avançadas, pode ser mais apropriado considerar um RDBMS mais robusto como MySQL, PostgreSQL, ou SQL Server.