# Quick Start

Esta seção fornece guias rápidos para configurar e subir diversos sistemas de gerenciamento de banco de dados (RDBMS) usando Docker. Cada seção contém instruções detalhadas para subir um servidor de banco de dados específico e conectar-se a ele. Docker é uma ferramenta de containerização que facilita a implantação e execução de serviços, garantindo um ambiente consistente e portável.

## [db2](db2/README.md)
IBM Db2 é um sistema de gerenciamento de banco de dados relacional robusto e escalável, ideal para ambientes empresariais. Ele oferece suporte a transações ACID, segurança avançada e integração com outras soluções da IBM. Neste guia, aprenderemos a subir um servidor Db2 usando Docker.

## [mariadb](mariadb/README.md)
MariaDB é um sistema de gerenciamento de banco de dados relacional derivado do MySQL. Ele é conhecido por sua robustez, escalabilidade e conformidade com os padrões SQL. Este guia mostra como configurar e subir um servidor MariaDB básico utilizando Docker.

## [mysql](mysql/README.md)
MySQL é um dos sistemas de gerenciamento de banco de dados relacional mais populares do mundo, conhecido por sua velocidade, escalabilidade e facilidade de uso. Aqui, você aprenderá a subir um servidor MySQL básico usando Docker e Docker Compose.

## [oracle](oracle/README.md)
Oracle Database é um sistema de gerenciamento de banco de dados relacional amplamente utilizado em ambientes empresariais devido às suas capacidades avançadas de gerenciamento de dados e segurança. Este guia mostra como configurar e subir um servidor Oracle Database básico usando Docker.

## [postgres](postgres/README.md)
PostgreSQL é um sistema de gerenciamento de banco de dados relacional avançado, conhecido por sua conformidade com os padrões SQL e suporte a funcionalidades avançadas como extensões e transações ACID. Este guia mostra como subir um servidor PostgreSQL básico usando Docker.

## [sqlite](sqlite/README.md)
SQLite é um sistema de gerenciamento de banco de dados relacional leve e embutido, ideal para desenvolvimento, testes e pequenas aplicações. Este guia demonstra como usar o SQLite em um contêiner Docker.

## [sqlserver](sqlserver/README.md)
Microsoft SQL Server é um sistema de gerenciamento de banco de dados relacional robusto, utilizado amplamente em ambientes empresariais devido às suas funcionalidades avançadas e integração com o ecossistema Microsoft. Este guia mostra como configurar e subir um servidor SQL Server básico usando Docker.

---

Cada seção contém um arquivo `docker-compose.yml` e instruções detalhadas para subir o servidor de banco de dados correspondente. Certifique-se de ter o Docker instalado no seu sistema antes de começar. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: [Instalar Docker](https://docs.docker.com/get-docker/).

Explore cada seção para configurar e utilizar o banco de dados que melhor atende às suas necessidades.