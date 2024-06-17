## Quick Start: Subindo um Servidor IBM Db2 no Docker

IBM Db2 é um sistema de gerenciamento de banco de dados relacional (RDBMS) robusto e escalável, desenvolvido pela IBM. Ele é amplamente utilizado em ambientes empresariais devido à sua confiabilidade, desempenho e suporte a funcionalidades avançadas, como transações ACID, segurança, e integração com outras soluções da IBM. Db2 é ideal para aplicações críticas e análise de grandes volumes de dados.

Nesta seção, vamos aprender como subir um servidor IBM Db2 básico no Docker. O Docker é uma ferramenta de containerização que permite empacotar e distribuir aplicativos em contêineres, facilitando a implantação e a execução de serviços.

### Requisitos
- Certifique-se de ter o Docker instalado no seu sistema. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: https://docs.docker.com/get-docker/.

### Utilizando Docker Compose
Para subir o servidor IBM Db2, você pode utilizar o arquivo `docker-compose.yml` abaixo. Certifique-se de ter este arquivo no diretório onde você deseja executar o servidor Db2:

```yaml
services:
  db2:
    image: ibmcom/db2:latest
    container_name: db2
    restart: always
    environment:
      LICENSE: accept
      DB2INST1_PASSWORD: "!StringP@ssw@rd"
      DBNAME: store
    ports:
      - "50000:50000"
    volumes:
      - db2_data:/database

volumes:
  db2_data:
    driver: local
```

Este arquivo `docker-compose.yml` define um serviço Db2 usando Docker Compose. O serviço é configurado com as seguintes características:

- **Imagem**: Utiliza a imagem mais recente do IBM Db2 disponível no Docker Hub.
- **Nome do Contêiner**: O contêiner será chamado de `db2`.
- **Reinicialização Automática**: Configurado para reiniciar sempre que o Docker reiniciar.
- **Variáveis de Ambiente**:
  - **LICENSE**: Aceita o contrato de licença do Db2.
  - **DB2INST1_PASSWORD**: Define a senha do usuário administrador do Db2 como `!StringP@ssw@rd`.
  - **DBNAME**: Define o nome do banco de dados como `store`.
- **Portas**: Mapeia a porta 50000 do contêiner Db2 para a porta 50000 do host, permitindo acesso ao banco de dados.
- **Volumes**: Monta um volume chamado `db2_data` para armazenar os dados do banco de dados Db2 de forma persistente no host.

### Subindo o Servidor Db2

```shell
docker-compose up -d
```

### Conectando-se ao Servidor Db2

Para se conectar ao servidor Db2, você pode usar ferramentas como o IBM Data Studio, DBeaver ou o cliente Db2 na linha de comando. Use as seguintes informações de conexão:

- Host: localhost
- Porta: 50000
- Usuário: db2inst1
- Senha: !StringP@ssw@rd
- Banco de Dados: store

### Nota

Db2 é altamente configurável e extensível. Para ambientes de produção, considere ajustar as configurações de acordo com suas necessidades específicas e adicionar práticas recomendadas de segurança e backup. Além disso, o Db2 requer pelo menos 4 GB de RAM disponível no sistema host para funcionar corretamente.