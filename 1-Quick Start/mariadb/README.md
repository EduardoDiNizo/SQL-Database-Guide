## Quick Start: Subindo um Servidor MariaDB no Docker

MariaDB é um sistema de gerenciamento de banco de dados relacional (RDBMS) de código aberto, derivado do MySQL. Ele é conhecido por sua robustez, escalabilidade e conformidade com os padrões SQL, oferecendo uma ampla gama de recursos como suporte a transações ACID, integridade referencial, índices e muito mais. MariaDB é uma escolha popular para aplicativos da web, análise de dados e outras aplicações que exigem armazenamento e recuperação eficientes de dados.

Nesta seção, vamos aprender como subir um servidor MariaDB básico no Docker. O Docker é uma ferramenta de containerização que permite empacotar e distribuir aplicativos em contêineres, tornando a implantação e a execução de serviços mais fáceis e rápidas.

### Requisitos
- Certifique-se de ter o Docker instalado no seu sistema. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: https://docs.docker.com/get-docker/.

### Utilizando Docker Compose
Para subir o servidor MariaDB, você pode utilizar o arquivo `docker-compose.yml` abaixo. Certifique-se de ter este arquivo no diretório onde você deseja executar o servidor MariaDB:

```yaml
services:
  mariadb:
    image: mariadb:latest
    container_name: mariadb
    restart: always
    environment:
      MARIADB_DATABASE: store
      MARIADB_USER: store_admin
      MARIADB_PASSWORD: "!StringP@ssw@rd"
      MARIADB_ROOT_PASSWORD: "!StringP@ssw@rd"
    ports:
      - "3306:3306"
    volumes:
      - mariadb_data:/var/lib/mysql

volumes:
  mariadb_data:
    driver: local
```

Este arquivo `docker-compose.yml` define um serviço MariaDB usando Docker Compose. O serviço é configurado com as seguintes características:

- **Imagem**: Utiliza a imagem mais recente do MariaDB disponível no Docker Hub.
- **Nome do Contêiner**: O contêiner será chamado de `mariadb`.
- **Reinicialização Automática**: Configurado para reiniciar sempre que o Docker reiniciar.
- **Variáveis de Ambiente**:
  - **MARIADB_DATABASE**: Define o nome do banco de dados como `store`.
  - **MARIADB_USER**: Define o usuário do banco de dados como `store_admin`.
  - **MARIADB_PASSWORD**: Define a senha do usuário do banco de dados como `!StringP@ssw@rd`.
  - **MARIADB_ROOT_PASSWORD**: Define a senha do usuário root do MariaDB como `!StringP@ssw@rd`.
- **Portas**: Mapeia a porta 3306 do contêiner MariaDB para a porta 3306 do host, permitindo acesso ao banco de dados.
- **Volumes**: Monta um volume chamado `mariadb_data` para armazenar os dados do banco de dados MariaDB de forma persistente no host.

### Subindo o Servidor MariaDB

```shell
docker-compose up -d
```

### Conectando-se ao Servidor MariaDB

Para se conectar ao servidor MariaDB, você pode usar ferramentas como o MySQL Workbench, DBeaver ou o cliente MariaDB na linha de comando. Use as seguintes informações de conexão:

- Host: localhost
- Porta: 3306
- Usuário: store_admin
- Senha: !StringP@ssw@rd
- Banco de Dados: store

### Nota

MariaDB é altamente configurável e extensível. Para ambientes de produção, considere ajustar as configurações de acordo com suas necessidades específicas e adicionar práticas recomendadas de segurança e backup.