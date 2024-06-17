## Quick Start: Subindo um Servidor SQL Server no Docker

Microsoft SQL Server é um sistema de gerenciamento de banco de dados relacional (RDBMS) amplamente utilizado, conhecido por sua robustez, escalabilidade e recursos avançados de análise de dados, segurança e integração com o ecossistema da Microsoft. Ele é uma escolha popular para aplicações empresariais, análise de negócios e outras aplicações críticas que exigem desempenho e confiabilidade.

Nesta seção, vamos aprender como subir um servidor SQL Server básico no Docker. O Docker é uma ferramenta de containerização que permite empacotar e distribuir aplicativos em contêineres, tornando a implantação e a execução de serviços mais fáceis e rápidas.

### Requisitos
- Certifique-se de ter o Docker instalado no seu sistema. Se você ainda não tem o Docker instalado, siga as instruções de instalação para o seu sistema operacional no site oficial do Docker: https://docs.docker.com/get-docker/.

### Utilizando Docker Compose
Para subir o servidor SQL Server, você pode utilizar o arquivo `docker-compose.yml` abaixo. Certifique-se de ter este arquivo no diretório onde você deseja executar o servidor SQL Server:

```yaml
services:
  sqlserver:
    image: mcr.microsoft.com/mssql/server:latest
    container_name: sqlserver
    restart: always
    environment:
      ACCEPT_EULA: "Y"
      SA_PASSWORD: "!StringP@ssw@rd"
    ports:
      - "1433:1433"
    volumes:
      - sqlserver_data:/var/opt/mssql

volumes:
  sqlserver_data:
    driver: local
```

Este arquivo `docker-compose.yml` define um serviço SQL Server usando Docker Compose. O serviço é configurado com as seguintes características:

- **Imagem**: Utiliza a imagem mais recente do SQL Server disponível no Microsoft Container Registry.
- **Nome do Contêiner**: O contêiner será chamado de `sqlserver`.
- **Reinicialização Automática**: Configurado para reiniciar sempre que o Docker reiniciar.
- **Variáveis de Ambiente**:
  - **ACCEPT_EULA**: Define a aceitação do contrato de licença como "Y" (sim).
  - **SA_PASSWORD**: Define a senha do usuário administrador (SA) do SQL Server como `!StringP@ssw@rd`.
- **Portas**: Mapeia a porta 1433 do contêiner SQL Server para a porta 1433 do host, permitindo acesso ao banco de dados.
- **Volumes**: Monta um volume chamado `sqlserver_data` para armazenar os dados do banco de dados SQL Server de forma persistente no host.

### Subindo o Servidor SQL Server

```shell
docker-compose up -d
```

### Conectando-se ao Servidor SQL Server

Para se conectar ao servidor SQL Server, você pode usar ferramentas como o SQL Server Management Studio (SSMS), Azure Data Studio ou o cliente sqlcmd na linha de comando. Use as seguintes informações de conexão:

- Host: localhost
- Porta: 1433
- Usuário: sa
- Senha: !StringP@ssw@rd

### Nota

O SQL Server no Docker é ideal para desenvolvimento e testes. Para ambientes de produção, considere ajustar as configurações de acordo com suas necessidades específicas e adicionar práticas recomendadas de segurança e backup. Além disso, o SQL Server requer pelo menos 2 GB de RAM disponível no sistema host para funcionar corretamente.