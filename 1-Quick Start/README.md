## Quick Start

#### MySQL é um sistema de gerenciamento de banco de dados relacional (RDBMS) de código aberto amplamente utilizado. Ele fornece um ambiente robusto e confiável para armazenar e gerenciar dados, oferecendo suporte a recursos como transações ACID, índices, chaves estrangeiras e muito mais. MySQL é conhecido por sua velocidade, escalabilidade e facilidade de uso, tornando-o uma escolha popular para aplicativos da web e outras aplicações que exigem armazenamento e recuperação eficientes de dados.

#### Este arquivo docker-compose.yml define um serviço MySQL usando Docker Compose. O serviço é configurado com as seguintes características:


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
MySQL

