-- file init sql dari link : https://s.id/Prak_SisdatI
-- pake dulu db nya..
use pertemuan4;

-- EXISTS attribute data type
select SupplierName from suppliers
where exists (select ProductName from products where SupplierID = suppliers.SupplierID AND Price < 20);

-- IN attribute data type
select * from customers
where Country in ('Germany','France','UK');

-- ANY attribute data type
select ProductName from products
where ProductID = any (select ProductID from order_details where Quantity = 10);

-- ALL attribute data type
select ProductName from products
where ProductID = all (select ProductID from order_details where Quantity = 10);

-- select subquery
select * from suppliers
where SupplierID in (select SupplierID from products where Price < 20);

-- insert sub query
create table customers2 (
  `CustomerID` int(11),
  `CustomerName` varchar(255),
  `ContactName` varchar(255),
  `Address` varchar(255),
  `City` varchar(255),
  `PostalCode` varchar(255),
  `Country` varchar(255)
);

insert into customers2
select * from customers
where CustomerID in (
    select SupplierID from products
    where Price < 20
);

-- update subquery
update products set Price = Price + (Price * 0.10)
where SupplierID in (
    select SupplierID from suppliers
    where SupplierName = "Exotic Liquid"
);

-- delete subquery
-- ...bakal keluar error cannot delete: a foreign key constraint fails
-- ini gegara tabel orders dipake di tabel lain (yaitu order_details) sebagai foreign key
delete from orders
where CustomerID in (
    select CustomerID from customers
    where City = 'London'
);

-- biar query diatas gak error
delete from order_details
where OrderID in (
    select orderid from orders
    where customerid in (
        select customerid from customers
        where city = 'London'
    )
);