## Quick Start: Subindo um Servidor MySQL no Docker

MySQL é um sistema de gerenciamento de banco de dados relacional (RDBMS) de código aberto amplamente utilizado. Ele fornece um ambiente robusto e confiável para armazenar e gerenciar dados, oferecendo suporte a recursos como transações ACID, índices, chaves estrangeiras e muito mais. MySQL é conhecido por sua velocidade, escalabilidade e facilidade de uso, tornando-o uma escolha popular para aplicativos da web e outras aplicações que exigem armazenamento e recuperação eficientes de dados.

Nesta seção, vamos aprender como subir um servidor MySQL básico no Docker. O Docker é uma ferramenta de containerização que permite empacotar e distribuir aplicativos em contêineres, tornando a implantação e a execução de serviços mais fáceis e rápidas.

### Requisitos
- Certifique-se de ter o Docker instalado no seu sistema. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: https://docs.docker.com/get-docker/.

### Utilizando Docker Compose
Para subir o servidor MySQL, você pode utilizar o arquivo docker-compose.yml abaixo. Certifique-se de ter este arquivo no diretório onde você deseja executar o servidor MySQL:

````yaml
services:
  mysql:
    image: mysql:latest
    container_name: mysql
    restart: always
    environment:
      MYSQL_DATABASE: store
      MYSQL_USER: store_admin
      MYSQL_PASSWORD: "!StringP@ssw@rd"
      MYSQL_ROOT_PASSWORD: "!StringP@ssw@rd"
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  mysql_data:
    driver: local

````
Este arquivo docker-compose.yml define um serviço MySQL usando Docker Compose. O serviço é configurado com as seguintes características:


- **Imagem**: Utiliza a imagem mais recente do MySQL disponível no Docker Hub.

- **Nome do Contêiner**: O contêiner será chamado de mysql.
- **Reinicialização Automática**: Configurado para reiniciar sempre que o Docker reiniciar.
- **Variáveis de Ambiente**:
  - **MYSQL_DATABASE**: Define o nome do banco de dados como store.
  - **MYSQL_USER**: Define o usuário do banco de dados como store_admin.
  - **MYSQL_PASSWORD**: Define a senha do usuário do banco de dados como !StringP@ssw@rd.
  - **MYSQL_ROOT_PASSWORD**: Define a senha do usuário root do MySQL como !StringP@ssw@rd.

- **Portas**: Mapeia a porta 3306 do contêiner MySQL para a porta 3306 do host, permitindo acesso ao banco de dados.

- **Volumes**: Monta um volume chamado mysql_data para armazenar os dados do banco de dados MySQL de forma persistente no host.

### Subindo o Servidor MySQL

````shell
docker-compose up -d
````

### Conectando-se ao Servidor MySQL

Para se conectar ao servidor MySQL, você pode usar ferramentas como o MySQL Workbench ou o cliente MySQL na linha de comando. Use as seguintes informações de conexão:

- Host: localhost
- Porta: 3306
- Usuário: store_admin
- Senha: !StringP@ssw@rd
- Banco de Dados: store

