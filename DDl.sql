-- checkpoint 1 DDL -- 
create table customer
(
    customer_id varchar(20) Primary key,
    customer_name varchar(20) NOT NULL,
    customer_tel number,
);

create table product
(
    product_id varchar(20) Primary key,
    product_name varchar(20) NOT NULL,
    price number CHECK (price > 0),
);

create table orders
(
    customer_id varchar(20) FOREIGN KEY REFERENCES customer (customer_id),
    product_id varchar(20) FOREIGN KEY REFERENCES product (product_id),
    Quantity number,
    Total_amount number,
);

alter table
    product
add
    Category varchar (20);

alter table
    orders
ADD
    orderDate date default Sysdate;
alter table 
    product 
ADD
    category varchar2 (20)
-- checkpoint 2 --
INSERT into product
    (product_id , product_name , category, price)
values
    (PO1, 'samsung galaxy s20', 'smartphone', 3299)
INSERT into product
    (product_id , product_name , category, price)
values
    (PO2, 'ASUS notebook', 'PC', 4599)
INSERT into customer
    (customer_id, customer_name,customer_tel)
values
    (CO1, 'ali', 71321009)
INSERT into customer
    (customer_id, customer_name,customer_tel)
values
    (CO2, 'ASMA', 77345823)
INSERT into orders
    (customer_id,product_id,orderDate,Quantity,Total_amount)
values
    (CO1, PO2, NULL, 2, 9198)
INSERT into orders
    (customer_id,product_id,orderDate,Quantity,Total_amount)
values
    (CO2, PO1, 28/05/2020, 1, 3299)
--checkpoint 3 --
SELECT *
from customer
select product_name, category
from product
WHERE price BETWEEN  5000 AND 10000
SELECT *
FROM product
order by price DESC
SELECT COUNT (*) , AVG (Total_amount), MAX (Total_amount), MIN(Total_amount), sum(Total_amount)
FROM orders
group by product_id
SELECT COUNT (*) customer_id
FROM orders
group by customer_id
having count (*)> 2;

SELECT
    EXTRACT(MONTH FROM OrderDate) AS month,
    COUNT() AS total_orders
FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2020
GROUP BY EXTRACT(MONTH FROM OrderDate);


SELECT o.Customer_Id, o.Product_Id, p.Product_Name, c.Customer_Name, o.OrderDate
FROM Orders o
    JOIN Product p ON o.Product_Id = p.Product_Id
    JOIN Customer c ON o.Customer_Id = c.Customer_Id;

SELECT *
FROM Orders
WHERE OrderDate = ADD_MONTHS(TRUNC(SYSDATE), -3);

SELECT c.Customer_Id
FROM Customer c
    LEFT JOIN Orders o ON c.Customer_Id = o.Customer_Id
WHERE o.Customer_Id IS NULL;



    

 
