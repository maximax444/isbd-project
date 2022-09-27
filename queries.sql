
-- 1

select distinct id_return_products from products p ;

-- 2

select concat(first_name,' ', surname,' ', patronymic) as FIO  from employees e ;

-- 3

select concat(name, ' ', surname, ' ', patronymic) as "ФИО" from clients c   ;

select concat(name, ' ', surname, ' ', patronymic), (year(now())- year (birthdate)) as "DATE" from clients c   ;

-- 4

select * from clients c where name = 'Максим';

-- 5

select * from clients c where year (birthdate) > 2000 ;

-- 6

select * from employees e where patronymic = 'Артемович' and first_name ='Егор';
select * from employees e where first_name = 'Петр'and patronymic <> 'Петрович';

-- 7

select * from return_products rp where month(date_return) = 5 or month(date_return) = 11 ;
select * from return_products rp where month(date_return) in (5,8,11) ;
select * from return_products rp where month(date_return) between 3 and 5 ;

-- 8

select * from orders o where id_ordered like '1_' ; 
select * from employees e where first_name like 'П%' ;

-- 9

select * from delivery d where number_phone is null ;
select * from delivery d where number_phone is not null ;

-- 10

select count(*) from form_of_payment fop ;
select count(distinct name) from delivery d ;
select avg(id_wr_pr) from orders o ;
select name, avg(price) from products p group by name ;

select id_suppliers, name, price from products p where name = 'Сыр' ;
select avg(price) from products p2 where name = 'Сыр' ; 
select id_suppliers, avg(price) from products p where name = 'Сыр' group by name, id_suppliers having avg(price) > 300 ;


-- 11

select * from products p ;
select * from products p where name = 'Сыр' and price > (select avg(price) from products p2 where name = 'Сыр') ;
select * from products p where price = 300 ;
select * from products p3 where price in (select price from products p4 where price = 300) ;
select * from products p where name in (select name from products p2 where manufacturers_country = 'Беларусь') ;
select * from products p where 850 = any (select price from products p2 where p.price  = p2.price) ;


-- 12

select e.surname as "Фамилия сотрудника", o.id, o.shipping_date, o.departure_date, c.surname as "Фамилия клиента"  
from employees as e inner join orders o on e.id = o.id_employees 
inner join clients as c on o.id_of_client = c.id  

select s.name, p.name, rp.amount  from return_products rp inner join products p on rp.id = p.id_return_products  
inner join suppliers s on p.id_suppliers  = s.id 

select c.name, o.id_ordered, wop.price from clients c inner join orders o on c.id = o.id_of_client 
inner join write_off_products wop on o.id_wr_pr = wop.id 

select * from shops s inner join supplies s2 on s.id = s2.id_shops 
inner join orders o on s2.id = o.id_supplier 

-- 1
-- Какое количество заказов совершил каждый клиент, вывести фамилию клиента и количество заказов, которое он сделал.

select c.surname as "Фамилия клиента", count(o2.id) as "Количество сделанных заказов"  
from clients as c inner join orders o on c.id = o.id_of_client 
inner join ordered as o2 on o.id_ordered = o2.id  
group by c.surname 

-- 2
-- Вывести номер сделанного заказа и его сумму

select o.id as "Номер сделанного заказа", sum(price*amount) as "Сумма заказа" 
from ordered as o
group by o.id; 

-- 3
-- Вывести фамилии сотрудников, их должности и только тех из сотрудников, кто сделал минимум 2 заказа.

select e.surname as "Фамилия сотрудника", p.name as "Должность сотрудника", count(o.id_ordered) as "Количество заказов"
from employees as e inner join positions as p on e.id_positions = p.id 
inner join orders as o on o.id_employees = e.id 
group by e.id 
having count(o.id_ordered) >= 2 ;

-- 4
-- Какое количество клиентов обслуживал каждый сотрудник 

select c.surname as "Фамилия клиента", e.surname as "Фамилия сорудника", count(e.id) as "Количество обслуживших клиентов"
from clients as c inner join orders as o on c.id = o.id_of_client 
inner join employees as e on e.id = o.id_employees 
group by c.name  ;

-- 5
-- Вывести названия продуктов, у которых цена выше средней цены по продуктам.

select p.name, p.price from products as p where price > (select avg(p2.price) from products p2);