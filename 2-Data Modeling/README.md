# Data Modeling

Nesta seção, abordaremos os princípios e práticas de modelagem de dados. A modelagem de dados é crucial para o design eficaz de bancos de dados, garantindo que os dados sejam organizados de forma lógica e eficiente. Abordaremos os seguintes tópicos:

- **Entidades e Atributos**: Descrevendo entidades e seus atributos, bem como a identificação de chaves primárias e estrangeiras.
- **Relacionamentos**: Definindo e implementando relacionamentos entre entidades, como 1-para-1, 1-para-N e N-para-N.
- **Normalização**: Explorando os conceitos de normalização de dados para evitar redundância e inconsistência.
- **Modelagem Física**: Considerando a implementação física do modelo, incluindo índices, partições e otimizações de desempenho.
- **Ferramentas de Modelagem**: Apresentando ferramentas populares de modelagem de dados para auxiliar no design e na documentação do modelo.

## Entidades e Atributos

Na modelagem de dados, as entidades representam objetos do mundo real, como pessoas, lugares ou coisas, que são significativas para o sistema. Os atributos são características dessas entidades, que descrevem seus detalhes ou propriedades. 
No nosso modelo:

![](DER.png)

- ### **Entidades**
    - **Address**: Representa um endereço com atributos como rua, cidade, estado e país.
    - **User**: Representa um usuário com atributos como nome, e-mail e uma chave estrangeira para o endereço associado.
    - **User_Profile**: Representa o perfil de um usuário, com atributos como data de nascimento, gênero e uma chave estrangeira para o usuário associado.
    - **Product_Category**: Representa a categoria de um produto, com atributos como nome e descrição.
    - **Product**: Representa um produto com atributos como nome, descrição, preço e uma chave estrangeira para a categoria associada.
    - **Payment_Method**: Representa um método de pagamento com atributos como nome e descrição.
    - **Order_Item**: Representa um item de pedido com atributos como quantidade, preço unitário e chaves estrangeiras para o pedido e o produto associados.
    - **Order**: Representa um pedido com atributos como status, data do pedido e chaves estrangeiras para o usuário e o método de pagamento associados.

- ### **Atributos**:

    - **ID**: Identificador único para cada entidade.
    - **Name**: Nome da entidade, como o nome do usuário ou do produto.
    - **Email**: Endereço de e-mail do usuário.
    - **Birth_Date**: Data de nascimento do usuário.
    - **Gender**: Gênero do usuário.
    - **Description**: Descrição da categoria, produto ou método de pagamento.
    - **Price**: Preço do produto.
    - **Quantity**: Quantidade do produto no pedido.
    - **Unit_Price**: Preço unitário do produto no pedido.
    - **Status**: Status do pedido.

Essa descrição destaca as entidades e atributos do modelo de dados, essenciais para entender como os dados são estruturados e como as entidades estão relacionadas entre si.

## **Relacionamentos**

Os relacionamentos definem como as entidades interagem entre si no modelo de dados. 
No modelo fornecido, temos vários tipos de relacionamentos: um-para-um (1:1), um-para-muitos (1:N). Vamos analisar cada relacionamento presente no modelo:

- **Um-para-um (1:1)**:

  - **User e User_Profile**:
    - Cada usuário possui um único perfil e cada perfil está associado a um único usuário.
    - Implementado através de uma chave estrangeira (user_id) na tabela user_profile que referencia a chave primária na tabela user.

- **Um-para-muitos (1:N)**:

  - **Address e User**:
    - Um endereço pode estar associado a muitos usuários, mas cada usuário possui apenas um endereço.
    - Implementado através de uma chave estrangeira (address_id) na tabela user que referencia a chave primária na tabela address.

  - **Product_Category e Product**:
    - Uma categoria de produto pode incluir muitos produtos, mas cada produto pertence a apenas uma categoria.
    - Implementado através de uma chave estrangeira (category_id) na tabela product que referencia a chave primária na tabela product_category.
      
  - **User e Order**:
    - Um usuário pode fazer muitos pedidos, mas cada pedido é feito por um único usuário.
    - Implementado através de uma chave estrangeira (user_id) na tabela order que referencia a chave primária na tabela user.

  - **Payment_Method e Order**:
    - Um método de pagamento pode ser usado em muitos pedidos, mas cada pedido usa apenas um método de pagamento.
    - Implementado através de uma chave estrangeira (payment_method_id) na tabela order que referencia a chave primária na tabela payment_method.

  - **Order e Order_Item**:
    - Um pedido pode ter muitos itens de pedido, mas cada item de pedido está associado a apenas um pedido.
    - Implementado através de uma chave estrangeira (order_id) na tabela order_item que referencia a chave primária na tabela order.

  - **Product e Order_Item**:
    - Um produto pode estar presente em muitos itens de pedido, mas cada item de pedido está associado a apenas um produto.
    - Implementado através de uma chave estrangeira (product_id) na tabela order_item que referencia a chave primária na tabela product.

Neste modelo de dados, os relacionamentos são implementados principalmente através do uso de chaves estrangeiras, que garantem a integridade referencial entre as tabelas. Esses relacionamentos são fundamentais para garantir que os dados sejam armazenados de forma consistente e que as associações entre diferentes entidades sejam mantidas corretamente.

Embora não estejam presentes no DDL fornecido, outros tipos de relacionamentos comuns em modelos de dados incluem:

- **Muitos-para-muitos (N:N)**:
  - Exemplo: Estudantes e cursos. Um estudante pode estar matriculado em muitos cursos, e um curso pode ter muitos estudantes matriculados.
  - Implementação: Geralmente, é necessária uma tabela intermediária que contém chaves estrangeiras de ambas as tabelas principais. Por exemplo, uma tabela student_course que possui as colunas student_id e course_id como chaves estrangeiras.

- **Auto-relacionamento (1:1, 1:N, N:N dentro da mesma tabela)**:
  - Exemplo: Funcionários e gerentes. Um funcionário pode ser gerente de outros funcionários na mesma tabela.
  - Implementação: Usar uma chave estrangeira na tabela que referencia a própria chave primária da mesma tabela. Por exemplo, manager_id na tabela employee que referencia id na mesma tabela.

Esses tipos de relacionamentos são fundamentais em diferentes cenários de modelagem de dados, permitindo a representação de associações complexas e hierarquias dentro do banco de dados.

## **Normalização**

Normalização é o processo de organizar os dados em um banco de dados para reduzir a redundância e melhorar a integridade dos dados. Esse processo é realizado em várias etapas, chamadas formas normais, cada uma das quais constrói sobre a anterior.

### Formas Normais

1. **Primeira Forma Normal (1NF)**:
   - Objetivo: Eliminar grupos repetidos e garantir que cada campo contenha apenas valores atômicos.
   - Exemplo: Uma tabela student onde cada estudante tem uma lista de telefones. Na 1NF, os telefones seriam armazenados em linhas separadas ou em uma tabela separada.

2. **Segunda Forma Normal (2NF)**:
   - Objetivo: Eliminar dependências parciais. Os atributos não-chave devem depender totalmente da chave primária.
   - Exemplo: Uma tabela orders onde cada pedido contém o ID do cliente e o nome do cliente. Na 2NF, o nome do cliente seria movido para uma tabela separada customers e referenciado por meio de uma chave estrangeira.

3. **Terceira Forma Normal (3NF)**:
   - Objetivo: Eliminar dependências transitivas. Os atributos não-chave devem depender apenas da chave primária e não de outros atributos não-chave.
   - Exemplo: Uma tabela orders onde cada pedido contém o ID do cliente, o nome do cliente e o endereço do cliente. Na 3NF, o endereço do cliente seria movido para a tabela customers para evitar dependências transitivas.

**Benefícios da Normalização**
  - **Redução da Redundância**: Elimina dados duplicados, economizando espaço de armazenamento.
  - **Melhoria da Integridade dos Dados**: Garante que os dados sejam consistentes e precisos.
  - **Facilidade de Manutenção**: Simplifica operações de inserção, atualização e exclusão.

**Desvantagens da Normalização**
  - **Complexidade**: Pode tornar o design do banco de dados mais complexo.
  - **Performance**: Pode exigir mais junções (joins) entre tabelas, o que pode impactar a performance das consultas.

A normalização é uma técnica essencial para o design eficiente de bancos de dados, balanceando entre a eliminação de redundâncias e a manutenção de performance adequada.

Ao analisar nosso exemplo, podemos verificar como as tabelas foram projetadas em relação aos princípios de normalização. A seguir, descrevemos como cada tabela está normalizada de acordo com as primeiras três formas normais (1NF, 2NF e 3NF):

- **Primeira Forma Normal (1NF)**
  - Para estar na 1NF, cada tabela deve ter:
    - Colunas contendo apenas valores atômicos (sem listas ou conjuntos).
    - Colunas que contenham valores do mesmo tipo.
    - Cada coluna deve ter um nome único.
    - A ordem em que os dados são armazenados não deve importar.
    - Não há repetição de colunas

- **Segunda Forma Normal (2NF)**
  - Para estar na 2NF, a tabela deve estar na 1NF e todos os atributos não-chave devem depender completamente da chave primária.
    - Todas as tabelas têm uma chave primária clara e todos os atributos não-chave dependem completamente da chave primária. Por exemplo, na tabela user, todos os atributos (name, email, address_id) dependem da chave primária id.

- **Terceira Forma Normal (3NF)**
  - Para estar na 3NF, a tabela deve estar na 2NF e não deve haver dependências transitivas, ou seja, os atributos não-chave devem depender apenas da chave primária.
    - As tabelas no DDL também atendem a este critério. Por exemplo, na tabela order, os atributos user_id e payment_method_id dependem da chave primária id da tabela order, e as informações detalhadas de user e payment_method são armazenadas em suas respectivas tabelas (user e payment_method), evitando dependências transitivas.

## Modelagem Física

A modelagem física é a etapa de implementação do modelo lógico em um sistema de gerenciamento de banco de dados (SGBD). Esta fase envolve a criação de tabelas, índices e outras estruturas de banco de dados para armazenar e gerenciar os dados de forma eficiente. Aqui, abordaremos alguns aspectos essenciais da modelagem física:

### Componentes da Modelagem Física

1. **Tabelas e Colunas**:
   - **Definição das Tabelas**: As tabelas são criadas conforme definido no modelo lógico. Cada tabela representa uma entidade do modelo, com colunas correspondentes aos atributos da entidade.
   - **Tipos de Dados**: A escolha do tipo de dado apropriado para cada coluna é crucial para otimizar o armazenamento e o desempenho. Por exemplo, usar tipos de dados numéricos para valores numéricos, tipos de dados de data para valores de data, e assim por diante.

2. **Índices**:
   - **Criação de Índices**: Índices são criados para acelerar a recuperação de dados. Eles são especialmente úteis em colunas frequentemente usadas em cláusulas WHERE, JOIN, e ORDER BY.
   - **Tipos de Índices**: Diferentes tipos de índices (como B-tree, hash, bitmap) podem ser usados dependendo das necessidades específicas. Índices compostos podem ser criados em múltiplas colunas para otimizar consultas complexas.

3. **Particionamento**:
   - **Particionamento Horizontal**: Dividir uma tabela em várias tabelas menores com base em um valor de chave, como datas ou intervalos numéricos. Isso pode melhorar o desempenho de consultas e simplificar a manutenção de dados.
   - **Particionamento Vertical**: Separar colunas de uma tabela em tabelas diferentes. Isso pode ser útil para otimizar o acesso a colunas específicas ou para gerenciar colunas de dados muito grandes.

4. **Conformidade e Integridade**:
   - **Constraints**: Restrições como chaves primárias, chaves estrangeiras, unique constraints e check constraints são implementadas para garantir a integridade dos dados.
   - **Triggers**: Procedimentos armazenados que são executados automaticamente em resposta a certos eventos, como inserções, atualizações ou exclusões, para garantir regras de negócios e integridade dos dados.

5. **Otimizações Específicas**:
   - **Armazenamento e Compressão**: Utilização de técnicas de compressão de dados para economizar espaço de armazenamento e melhorar a performance de I/O.
   - **Tuning de Performance**: Ajustes específicos no SGBD, como configuração de buffers de memória, parâmetros de cache, e otimização de planos de execução de consultas.

### Exemplos Práticos

- **Criação de Tabelas**:
```sql
CREATE TABLE User (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE Order (
    id INT PRIMARY KEY,
    status VARCHAR(50),
    order_date DATE,
    user_id INT,
    payment_method_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (payment_method_id) REFERENCES Payment_Method(id)
);
```

- **Criação de Índices**:
```sql
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_order_user_id ON Order(user_id);
```

- **Particionamento Horizontal**:
```sql
CREATE TABLE Order_2023_01 PARTITION OF Order FOR VALUES FROM ('2023-01-01') TO ('2023-01-31');
CREATE TABLE Order_2023_02 PARTITION OF Order FOR VALUES FROM ('2023-02-01') TO ('2023-02-28');
```

## Ferramentas de Modelagem

Existem diversas ferramentas de modelagem de dados disponíveis que ajudam a criar, visualizar e documentar modelos de dados. Essas ferramentas facilitam o processo de design e garantem que os modelos sejam bem documentados e consistentes. Aqui estão algumas das ferramentas de modelagem de dados mais populares:

1. **ER/Studio**:
   - **Descrição**: Ferramenta robusta de modelagem de dados que oferece recursos avançados para design e documentação de modelos de dados.
   - **Características**: Suporte a modelagem lógica e física, engenharia reversa, comparação de modelos, e geração de scripts de banco de dados.

2. **Oracle SQL Developer Data Modeler**:
   - **Descrição**: Ferramenta gratuita da Oracle para modelagem de dados, integrada ao Oracle SQL Developer.
   - **Características**: Suporte a modelagem lógica, relacional e física, engenharia reversa e sincronização de modelos com bancos de dados.

3. **Microsoft Visio**:
   - **Descrição**: Ferramenta de diagramas amplamente utilizada que também oferece suporte à modelagem de dados.
   - **Características**: Suporte a diagramas ERD (Entity-Relationship Diagrams), integração com bancos de dados via ODBC, e geração de diagramas de banco de dados.

4. **DBDesigner**:
   - **Descrição**: Ferramenta de design visual de banco de dados com suporte a vários SGBDs.
   - **Características**: Interface intuitiva, suporte a engenharia reversa e direta, e integração com MySQL.

5. **Toad Data Modeler**:
   - **Descrição**: Ferramenta de modelagem de dados que suporta uma ampla gama de SGBDs e oferece recursos avançados de design.
   - **Características**: Modelagem lógica e física, engenharia reversa, validação de modelo, e geração de scripts de banco de dados.

6. **MySQL Workbench**:
   - **Descrição**: Ferramenta integrada para design de banco de dados, desenvolvimento SQL, administração e modelagem de dados para MySQL.
   - **Características**: Suporte a engenharia reversa e direta, design de diagramas ER, e geração de scripts SQL.

7. **Lucidchart**:
   - **Descrição**: Ferramenta online de diagramas que oferece suporte à criação de diagramas ERD e modelagem de dados.
   - **Características**: Colaboração em tempo real, templates de diagramas, e integração com várias plataformas de armazenamento em nuvem.

Cada uma dessas ferramentas oferece recursos distintos que podem ser escolhidos com base nas necessidades específicas do projeto e do SGBD em uso. Utilizar ferramentas de modelagem de dados é essencial para garantir que os modelos sejam bem projetados, documentados e mantidos ao longo do tempo.























