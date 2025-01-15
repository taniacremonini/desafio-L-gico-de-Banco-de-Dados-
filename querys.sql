	show tables;
	select * from client;
	select * from delivery;
	select * from orders;
	select * from payment;
	select * from product;
	select * From productSeller;
	select * from productStorage;
	select * from providing_product;
	select * from seller;
	select * from supplier;



-- Como recuperar todos os nomes dos clientes e seus respectivos CPFs.
	select Fname, lname,CPF 
    from client;
    
-- relação de nomes dos fornecedores e nomes dos produtos, 
select s.socialname as supplier_name,p.Pname as product_name
	from supplier s
	join providing_product pp on s.idsupplier = pp.supplier_idsupplier
	join product p on pp.product_idproduct = p.idproduct;


-- Encontrar clientes com sobrenome "Silva"
select Fname,Lname, CPF 
    from client
    where Lname = 'Oliveira';
    
    
-- Algum vendedor também é fornecedor
select s.socilaname  as seller_name, p.socialname as supplier_name, s.document
	from seller s 
    join supplier p on s.document = p.cnpj
    where s.documenttype = 'CNPJ';


-- Calcular o valor total de um pedido com frete incluído.
select idOrder , totalvalue, (totalvalue +  freight) as total_with_freight
	from orders;
    
    
-- Quantos pedidos foram feitos por cada cliente?"
select c.Fname as first_name, c.Lname as last_name, count(o.idOrder) as total_orders,
	concat(c.Fname, ' ', c.lname) as full_name
    from client c 
    left join orders o on c.idclient = o.order_idclient
    group by c.idclient, c.Fname, c.Lname
    having COUNT(o.idOrder) > 2;
    
    
-- relação de produtos, fornecedores e estoques 
select p.Pname as product_name,s.socialname as supplier_name, ps.location as stock_location,ps.quantity as stock_quantity
	from product p
	join supplier s on p.idsupplier = s.idsupplier
	join product_productStorage pps on p.idproduct = pps.product_idproduct
	join productStorage ps on pps.productStorage_idproductStorage = ps.idproductStorage;


-- Quais pedidos foram entregues e já tiveram o pagamento aprovado?
select o.idOrder AS order_id, o.orderdate AS order_date, p.Typepayment AS payment_type,p.status as payment_status,
    d.deliverystatus AS delivery_status, d.trackingcode AS tracking_code
	from orders o
	join payment p on o.idOrder = p.order_idorder
	join delivery d on o.idOrder = d.order_idorder
	where d.deliverystatus = 'Delivered'and p.status = 'Aprovado';

