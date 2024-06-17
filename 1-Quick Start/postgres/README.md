## Quick Start: Subindo um Servidor PostgreSQL no Docker

PostgreSQL é um sistema de gerenciamento de banco de dados relacional (RDBMS) de código aberto amplamente utilizado. Ele é conhecido por sua robustez, escalabilidade e conformidade com os padrões SQL, oferecendo uma ampla gama de recursos, como suporte a transações ACID, integridade referencial, índices, extensibilidade e muito mais. PostgreSQL é uma escolha popular para aplicativos da web, análise de dados e outras aplicações que exigem armazenamento e recuperação eficientes de dados.

Nesta seção, vamos aprender como subir um servidor PostgreSQL básico no Docker. O Docker é uma ferramenta de containerização que permite empacotar e distribuir aplicativos em contêineres, tornando a implantação e a execução de serviços mais fáceis e rápidas.

### Requisitos
- Certifique-se de ter o Docker instalado no seu sistema. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: https://docs.docker.com/get-docker/.

### Utilizando Docker Compose
Para subir o servidor PostgreSQL, você pode utilizar o arquivo `docker-compose.yml` abaixo. Certifique-se de ter este arquivo no diretório onde você deseja executar o servidor PostgreSQL:

```yaml
services:
  postgres:
    image: postgres:latest
    container_name: postgres
    restart: always
    environment:
      POSTGRES_DB: store
      POSTGRES_USER: store_admin
      POSTGRES_PASSWORD: "!StringP@ssw@rd"
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
    driver: local
```

Este arquivo `docker-compose.yml` define um serviço PostgreSQL usando Docker Compose. O serviço é configurado com as seguintes características:

- **Imagem**: Utiliza a imagem mais recente do PostgreSQL disponível no Docker Hub.
- **Nome do Contêiner**: O contêiner será chamado de `postgres`.
- **Reinicialização Automática**: Configurado para reiniciar sempre que o Docker reiniciar.
- **Variáveis de Ambiente**:
  - **POSTGRES_DB**: Define o nome do banco de dados como `store`.
  - **POSTGRES_USER**: Define o usuário do banco de dados como `store_admin`.
  - **POSTGRES_PASSWORD**: Define a senha do usuário do banco de dados como `!StringP@ssw@rd`.
- **Portas**: Mapeia a porta 5432 do contêiner PostgreSQL para a porta 5432 do host, permitindo acesso ao banco de dados.
- **Volumes**: Monta um volume chamado `postgres_data` para armazenar os dados do banco de dados PostgreSQL de forma persistente no host.

### Subindo o Servidor PostgreSQL

```shell
docker-compose up -d
```

### Conectando-se ao Servidor PostgreSQL

Para se conectar ao servidor PostgreSQL, você pode usar ferramentas como o pgAdmin, DBeaver ou o cliente psql na linha de comando. Use as seguintes informações de conexão:

- Host: localhost
- Porta: 5432
- Usuário: store_admin
- Senha: !StringP@ssw@rd
- Banco de Dados: store

### Nota

PostgreSQL é altamente configurável e extensível. Para ambientes de produção, considere ajustar as configurações de acordo com suas necessidades específicas e adicionar práticas recomendadas de segurança e backup.