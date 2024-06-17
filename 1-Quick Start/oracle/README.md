## Quick Start: Subindo um Servidor Oracle no Docker

Oracle Database é um sistema de gerenciamento de banco de dados relacional (RDBMS) amplamente utilizado, conhecido por sua robustez, escalabilidade e capacidade de gerenciar grandes volumes de dados de maneira eficiente. É frequentemente utilizado em ambientes corporativos e de missão crítica devido ao seu desempenho, segurança e recursos avançados.

Nesta seção, vamos aprender como subir um servidor Oracle básico no Docker. O Docker é uma ferramenta de containerização que permite empacotar e distribuir aplicativos em contêineres, tornando a implantação e a execução de serviços mais fáceis e rápidas.

### Requisitos
- Certifique-se de ter o Docker instalado no seu sistema. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: https://docs.docker.com/get-docker/.

### Utilizando Docker Compose
Para subir o servidor Oracle, você pode utilizar o arquivo `docker-compose.yml` abaixo. Certifique-se de ter este arquivo no diretório onde você deseja executar o servidor Oracle:

```yaml
services:
  oracle:
    image: oracleinanutshell/oracle-xe-11g:latest
    container_name: oracle
    restart: always
    environment:
      ORACLE_DATABASE: ORCL
      ORACLE_USER: oracle_admin
      ORACLE_PASSWORD: "!StringP@ssw@rd"
      ORACLE_CHARACTERSET: AL32UTF8
    ports:
      - "1521:1521"
    volumes:
      - oracle_data:/u01/app/oracle

volumes:
  oracle_data:
    driver: local
```

Este arquivo `docker-compose.yml` define um serviço Oracle usando Docker Compose. O serviço é configurado com as seguintes características:

- **Imagem**: Utiliza a imagem Oracle XE 11g disponível no Docker Hub.
- **Nome do Contêiner**: O contêiner será chamado de `oracle`.
- **Reinicialização Automática**: Configurado para reiniciar sempre que o Docker reiniciar.
- **Variáveis de Ambiente**:
  - **ORACLE_DATABASE**: Define o nome do banco de dados como `ORCL`.
  - **ORACLE_USER**: Define o usuário do banco de dados como `oracle_admin`.
  - **ORACLE_PASSWORD**: Define a senha do usuário do banco de dados como `!StringP@ssw@rd`.
  - **ORACLE_CHARACTERSET**: Define o conjunto de caracteres do banco de dados como `AL32UTF8`.
- **Portas**: Mapeia a porta 1521 do contêiner Oracle para a porta 1521 do host, permitindo acesso ao banco de dados.
- **Volumes**: Monta um volume chamado `oracle_data` para armazenar os dados do banco de dados Oracle de forma persistente no host.

### Subindo o Servidor Oracle

```shell
docker-compose up -d
```

### Conectando-se ao Servidor Oracle

Para se conectar ao servidor Oracle, você pode usar ferramentas como o SQL Developer ou o cliente SQL*Plus na linha de comando. Use as seguintes informações de conexão:

- Host: localhost
- Porta: 1521
- SID: xe
- Usuário: oracle_admin
- Senha: !StringP@ssw@rd

### Nota

O Oracle XE é uma versão gratuita e limitada do Oracle Database. Se você precisar de recursos mais avançados ou desempenho superior, considere utilizar uma versão paga do Oracle Database.