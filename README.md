# Desafio Lógico de Banco de Dados

Este projeto foi desenvolvido como parte de um desafio da Dio para modelar e implementar um banco de dados relacional. O objetivo é demonstrar habilidades em modelagem de dados, normalização e uso de SQL para atender a requisitos específicos.

## Descrição do Projeto

O projeto consiste em um sistema de banco de dados para um e-commerce, com tabelas projetadas para armazenar informações sobre clientes, fornecedores, produtos, pedidos, pagamentos, estoques, vendedores e entregas.

Através deste banco de dados, é possível realizar consultas para responder a perguntas como:
- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos, fornecedores e estoques.
- Detalhes de pagamentos e entregas para cada pedido.

## Tecnologias Utilizadas

- **MySQL**: Banco de dados relacional.
- **SQL**: Linguagem utilizada para criação de tabelas e consultas.
- **DBeaver/MySQL Workbench**: Ferramentas recomendadas para manipulação do banco.

## Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas principais:
- **client**: Cadastro de clientes.
- **supplier**: Cadastro de fornecedores.
- **product**: Cadastro de produtos, com vínculo ao fornecedor.
- **orders**: Registro de pedidos realizados pelos clientes.
- **payment**: Controle de pagamentos dos pedidos.
- **delivery**: Gerenciamento do status de entregas.

### Diagrama de Entidades e Relacionamentos

Um diagrama detalhado das tabelas e seus relacionamentos está disponível no repositório.

## Consultas SQL Exemplo

Aqui estão algumas consultas para explorar o banco de dados:

1. **Obter todos os pedidos entregues e pagos:**
    ```sql
    SELECT o.idOrder, o.orderdate, p.Typepayment, p.status, d.deliverystatus, d.trackingcode
    FROM orders o
    JOIN payment p ON o.idOrder = p.order_idorder
    JOIN delivery d ON o.idOrder = d.order_idorder
    WHERE d.deliverystatus = 'Delivered' AND p.status = 'Aprovado';
    ```

2. **Relação de produtos e fornecedores:**
    ```sql
    SELECT pr.Pname AS Product_Name, s.socialname AS Supplier_Name
    FROM product pr
    JOIN supplier s ON pr.idsupplier = s.idsupplier;
    ```

3. **Relação de produtos em estoque:**
    ```sql
    SELECT ps.location AS Storage_Location, ps.quantity, p.Pname AS Product_Name
    FROM productStorage ps
    JOIN product_productStorage pps ON ps.idproductStorage = pps.productStorage_idproductStorage
    JOIN product p ON pps.product_idproduct = p.idproduct;
    ```

## Como Usar

1. Clone o repositório:
    ```bash
    git clone https://github.com/taniacremonini/desafio-L-gico-de-Banco-de-Dados-.git
    ```

2. Crie o banco de dados no MySQL:
    ```sql
    CREATE DATABASE ecommerce;
    ```

3. Importe o arquivo SQL disponível no repositório para criar as tabelas e carregar dados fictícios:
    ```bash
    mysql -u <seu_usuario> -p ecommerce < caminho_para_o_arquivo.sql
    ```

4. Use ferramentas como MySQL Workbench ou DBeaver para explorar o banco de dados e realizar consultas.

## Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para criar um fork, abrir issues ou enviar pull requests com sugestões e melhorias.

## Licença

Este projeto está disponível sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.

---

**Autor**: Tânia Cremonini  
[GitHub](https://github.com/taniacremonini)
