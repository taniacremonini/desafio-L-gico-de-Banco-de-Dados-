use ecommerce ;


insert into client (Fname, minit, Lname, CPF, namefantasy, address, phone) values
('João', 'P.', 'Silva', '12345678901', null, 'Rua das Flores, 123, São Paulo - SP', '11999998888'),
('Maria', 'A.', 'Souza', '98765432100', null, 'Avenida Paulista, 456, São Paulo - SP', '11988887777'),
('Pedro', 'B.', 'Oliveira', '11122233344', 'Loja PedroTech', 'Rua dos Industriários,
 789, Belo Horizonte - MG', '31999994444'),
('Ana', 'C.', 'Costa', '44455566677', null, 'Rua do Sol, 1010, Rio de Janeiro - RJ', '21977776666'),
('Lucas', 'D.', 'Lima', '33344455566', null, 'Rua das Palmeiras, 2020, Salvador - BA', '71966665555');


insert into supplier (socialname, cnpj, contact) values
('Tech Supplies Ltda', '12345678000101', '11999992222'),
('Fabrica de Brinquedos SA', '98765432000199', '21988883333'),
('Alimentos Frescos ME', '11223344000155', '31977774444'),
('Moveis Modernos Ltda', '44556677000122', '71966662222'),
('Roupas e Estilos Ltda', '33445566000188', '81955551111');


insert into product (Pname, classification_Kids, category, descriptions, avaliação, price, idsupplier) values
('Notebook', 0, 'Eletronico', 'Notebook 15 polegadas', 4.8, 3500.00, 1),
('Camiseta', 0, 'Vestimenta', 'Camiseta 100% algodão', 4.2, 50.00, 5),
('Carrinho', 1, 'Brinquedo', 'Carrinho de controle remoto', 4.5, 120.00, 2),
('Mesa', 0, 'Moveis', 'Mesa de escritório', 4.7, 450.00, 4),
('Chocolate', 1, 'Alimentos', 'Chocolate meio amargo', 4.9, 12.50, 3);




insert into orders (order_idclient, orderstatus, orderdescription, freight, orderdate, totalvalue, paymentCash) values
(1, 'Pendente', 'Pedido de 1 Notebook e 1 Camiseta', 15.00, '2024-01-10', 3550.00, true),
(2, 'Enviado', 'Pedido de 3 Chocolates', 10.00, '2024-01-09', 37.50, false),
(3, 'Concluído', 'Pedido de 2 Carrinhos', 20.00, '2024-01-08', 240.00, true),
(4, 'Cancelado', 'Pedido de 1 Mesa', 25.00, '2024-01-07', 475.00, false),
(5, 'Em Processamento', 'Pedido de 2 Camisetas', 12.00, '2024-01-11', 100.00, true);


insert into payment (order_idorder, order_client_idclient, Typepayment, limitAvaliable, totalvalue, status) values
(1, 1, 'Cartões', 5000.00, 3550.00, 'Aprovado'),
(2, 2, 'Pix', 1000.00, 37.50, 'Aprovado'),
(3, 3, 'Boleto', 3000.00, 240.00, 'Aprovado'),
(4, 4, 'Transferencia', 2000.00, 475.00, 'Cancelado'),
(5, 5, 'Pix', 1500.00, 100.00, 'Pendente');


insert into orders (order_idclient, orderstatus, orderdescription, orderdate, totalvalue, paymentCash)
values
(1, 'Concluído', 'Pedido de roupas', '2024-01-10', 200.50, false),
(2, 'Pendente', 'Pedido de eletrônicos', '2024-01-11', 800.75, true),
(3, 'Concluído', 'Pedido de brinquedos', '2024-01-12', 150.20, false);



insert into payment (order_idorder, order_client_idclient, Typepayment, limitAvaliable, totalvalue, status)
values
(1, 1, 'Cartões', 200.50, 200.50, 'Aprovado'),
(2, 2, 'Boleto', 800.75, 800.75, 'Pendente'),
(3, 3, 'Pix', 150.20, 150.20, 'Aprovado');


insert into delivery (responsiblecarrier, shippingdate, deliveryprecision, deliverystatus, trackingcode, order_idorder, order_client_idclient)
values
('Transportadora X', '2024-01-13', '2024-01-15', 'Delivered', 'ABC123', 1, 1),
('Transportadora Y', '2024-01-14', '2024-01-16', 'In Transit', 'DEF456', 2, 2),
('Transportadora Z', '2024-01-14', '2024-01-16', 'Delivered', 'GHI789', 3, 3);


