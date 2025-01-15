
create database ecommerce;
use ecommerce;


-- Tabela Cliente
create table client (
    idclient int primary key auto_increment,
    Fname varchar(15) not null,
    minit char(3),
    Lname varchar(45) not null,
    CPF char(11) not null,
    namefantasy char(25),
    address varchar(255),
    phone varchar(15),
    constraint unique_cpf_client unique(CPF)
);


-- Tabela Fornecedor
create table supplier (
    idsupplier int primary key auto_increment,
    socialname varchar(255) not null,
    cnpj char(15)not null,
    contact char (11) not null,
    constraint unique_supplier unique (cnpj)
    );


-- Tabela Produto
create table product (
    idproduct int primary key auto_increment,
    Pname varchar (10) not null,
    classification_Kids tinyint not null,
    category enum('Eletronico' ,'Vestimenta' , 'Brinquedo', 'Alimentos', 'Moveis') not null,
    descriptions varchar(45) not null,
    avaliação float default 0,
    price decimal(10,2) not null,
    idsupplier int not null,
    constraint fk_supplier_product foreign key (idsupplier) references supplier(idsupplier)
);


-- Tabela Pedido
create table orders(
    idOrder   int primary key auto_increment,
	order_idclient int,
    orderstatus enum('Pendente', 'Enviado', 'Cancelado', 'Concluído', 'Em Processamento') default 'Em Processamento',
    orderdescription varchar(255),
    freight float default 10,
    orderdate date,
    totalvalue decimal(10,2),
    paymentCash bool default false	,
    trackingNumber varchar(50),
    constraint fk_ordes_client foreign key (order_idclient) references  client(idclient)
);


-- Tabela Pagamento
create table payment (
    idpayment int primary key auto_increment,
    order_idorder int,
    order_client_idclient int,
    Typepayment enum('Cartões', 'Boleto', 'Pix', 'Transferencia') not null,
	limitAvaliable float not null,
    totalvalue decimal(10,2),
	status enum('Pendente', 'Aprovado', 'Cancelado') not null,
    constraint fk_order_order foreign key (order_idorder) references orders(idorder),
    constraint fk_order_client  foreign key (order_client_idclient) references client(idclient)
);


-- Tabela Produto_em_Estoque
create table productStorage (
    idproductStorage int primary key auto_increment,
    location varchar(45) not null,
    quantity int default 0
);


-- Tabela Terceiro_Vendedor
create table seller (
    idseller int primary key auto_increment,
    socilaname varchar(45) not null,
    abstratname varchar(255),
    documenttype enum('CPF', 'CNPJ') not null,
    document varchar(14),
    location varchar (255),
    email varchar(45),
    phone varchar(45),
    constraint unique_seller unique (document) 
);


-- Tabela Produto_Por_Vendedor
   create table productSeller (
    product_idproduct int,
    seller_idseller int,
    quantity int default 1 ,
    unitprice decimal(10,2),
    primary key (product_idproduct, seller_idseller),
    constraint fk_product_product foreign key (product_idproduct) references product(idproduct),
    constraint fk_product_seller foreign key  (seller_idseller) references seller(idseller)
    
);


-- Tabela Produto_Pedido
create table ProductOrder(
    product_idproduct int,
    order_idorder int,
    quantity int default 1,
    PoStatus enum ('Disponivel' , 'Sem Estoque') default 'Disponivel',
    primary key (product_idproduct, order_idorder),
    constraint fk_productorder_product foreign key (product_idproduct) references product(idproduct),
    constraint fk_prductorder_order foreign key (order_idorder) references orders(idorder)
    
);


-- Tabela Produto_Estoque
create table product_productStorage (
    productStorage_idproductStorage int,
    product_idproduct int,
    quantity int not null,
    primary key (productStorage_idproductStorage, product_idproduct),
    constraint fk_productStorage_productStorage foreign key (productStorage_idproductStorage) references productStorage(idproductStorage),
    constraint fk_productStorage_product foreign key (product_idproduct) references product(idproduct)
);


-- Tabela Produto_fornecedor
create table providing_product (
    supplier_idsupplier int,
    product_idproduct int,
    primary key (supplier_idsupplier, product_idproduct),
    constraint fk_providing_product_supplier foreign key (supplier_idsupplier) references supplier(idsupplier),
    constraint fk_product_providing_product foreign key (product_idproduct) references product(idproduct)
);


-- Tabela Entrega
create table delivery (
    iddelivery int primary key auto_increment,
    responsiblecarrier varchar(45) not null,
    shippingdate date,
    deliveryprecision date,
    deliverystatus enum('In Transit', 'Delivered', 'Cancelled') not null,
    trackingcode varchar(45),
    order_idorder int,
    order_client_idclient int,
    constraint fk_delivery_order foreign key (order_idorder) references orders(idorder),
    constraint fk_delivery_client foreign key (order_client_idclient) references client(idclient)
);

show tables;
use information_schema;
show tables;
desc table TABLE_CONSTRAINTS;

select * from REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'ecommerce';
