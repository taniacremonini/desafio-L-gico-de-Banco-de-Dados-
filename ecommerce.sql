
show databases;
use ecommerce;

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

create table product (
    idproduct int primary key auto_increment,
    Pname varchar (10) not null,
    classification_Kids tinyint not null,
    category enum('Eletronico' ,'Vestimenta' , 'Brinquedo', 'Alimentos', 'Moveis') not null,
    descriptions varchar(45) not null,
    avaliação float default 0,
    price decimal(10,2) not null,
    idsupplier int not null,
    constraint unique_cpf_client unique(CPF),
    foreign key (idsupplier) references supplier(idsupplier)
);

create table orders(
    idOrder   int primary key auto_increment,
	order_idclient int,
    orderstatus enum('Pendente', 'Enviado', 'Cancelado', 'Concluído') default 'Em Processamento',
    orderdescription varchar(255),
    freight float default 10,
    orderdate date,
    totalvalue decimal(10,2),
    paymentCash bool default false	,
    constraint fk_ordes_client foreign key (order_idclient) references  client(idclient)
);
    
create table payment (
    idpayment int primary key auto_increment,
    order_idorder int,
    order_client_idclient int,
    Typepayment enum('Cartões', 'Boleto', 'Pix', 'Transferencia') not null,
	limitAvaliable float not null,
    totalvalue decimal(10,2),
	status enum('Pendente', 'Aprovado', 'Cancelado') not null,
    foreign key (order_idorder) references ordertable(idorder),
    foreign key (order_client_idclient) references client(idclient)
);

create table productStorage (
    idproductStorage int primary key auto_increment,
    location varchar(45) not null,
    quantity int default 0
);

create table supplier (
    idsupplier int primary key auto_increment,
    socialname varchar(255) not null,
    cnpj char(15)not null,
    contact char (11) not null,
    constraint unique_supplier unique (cnpj)
);

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
create table productSeller (
    product_idproduct int,
    seller_idseller int,
    quantity int default 1 ,
    unitprice decimal(10,2),
    primary key (product_idproduct, seller_idseller),
    constraint fk_product_product foreign key (product_idproduct) references product(idproduct),
    constraint fk_product_seller foreign key  (seller_idseller) references seller(idseller)
    
);


create table delivery (
    iddelivery int primary key auto_increment,
    responsiblecarrier varchar(45) not null,
    shippingdate date,
    deliveryprecision date,
    deliverystatus enum('In Transit', 'Delivered', 'Cancelled') not null,
    trackingcode varchar(45),
    order_idorder int,
    order_client_idclient int,
    foreign key (order_idorder) references ordertable(idorder),
    foreign key (order_client_idclient) references client(idclient)
);



create table product_productStorage (
    productStorage_idproductStorage int,
    product_idproduct int,
    quantity int not null,
    primary key (productStorage_idproductStorage, product_idproduct),
    foreign key (productStorage_idproductStorage) references productStorage(idproductStorage),
    foreign key (product_idproduct) references product(idproduct)
);



create table order_product_relation (
    product_idproduct int,
    order_idorder int,
    quantity varchar(45) not null,
    primary key (product_idproduct, order_idorder),
    foreign key (product_idproduct) references product(idproduct),
    foreign key (order_idorder) references ordertable(idorder)
);




create table providing_product (
    supplier_idsupplier int,
    product_idproduct int,
    primary key (supplier_idsupplier, product_idproduct),
    foreign key (supplier_idsupplier) references supplier(idsupplier),
    foreign key (product_idproduct) references product(idproduct)
);
