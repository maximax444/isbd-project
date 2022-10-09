
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

select * from clients c where year (birthdate) > 1990 ;

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
select name, avg(price) from products p group by name ;

select id_suppliers, name, price from products p where name = 'Сыр' ;
select avg(price) from products p2 where name = 'Сыр' ; 
select id_suppliers, avg(price) from products p where name = 'Сыр' group by name, id_suppliers having avg(price) > 300 ;


-- 11

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

-- 6
-- Вывести тех клиентов, которые не делали заказ и отсортировать их по убыванию, если таких клиентов нет, 
-- то добавить как минимум двоих.

select c.id, c.name 
from clients as c
where not exists (select * from orders as o where c.id = o.id_of_client)
order by c.name desc;

-- 7
-- Вывести количество поставок за каждый месяц в каждом магазине (месяц, количество и название магазина).

select extract(month from date_suply) as "месяц", s2.name as "Магазин" , count(s.id) as "Количество поставок" 
from supplies s inner join shops s2 on s.id_shops = s2.id 
group by s.id, s2.name
order by extract(month from date_suply);

-- select extract(month from date_suply ) as "month" from supplies s ;
-- select month(date_suply) from supplies;

-- 8
-- Вывести всех клиентов, у которых месяц рождения 6,7 или 8.

select * from clients c 
where month(birthdate) in (6,7,8);

-- 9
-- Вывести тех клиентов, у которых отчество заканчивается на букву ч, а имя начинается на букву о.

select * from clients as c 
where c.name like 'О%' and c.patronymic like '%ч';

-- 10 
-- Вывести все те заказы, которые были заказаны, цена которых входит в тройку самых дорогих.

select id, max(price) 
from ordered 
group by id 
order by max(price) desc 
limit 3;

-- 11
-- Вывести среднюю цену возвращаемых товаров.

select rp.id as "Номер заказа", avg(price) as "Средняя цена" 
from return_products as rp 
having avg(price) > 400;

-- 12
-- Количество завершенных заказов.

select count(o.id) from ordered o ;


-- *************************************************************************************


-- Триггер 1 -------------------------------------------------

/*Нельзя добавить стоимость поставки равную 3333*/
CREATE DEFINER=`root`@`localhost` TRIGGER `after_supplies_insert` AFTER INSERT ON `supplies` FOR EACH ROW BEGIN
IF new.sum_suply= 3333 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'STOP';
END if;
end;

insert into supplies values
(16,6,3333,'2022-05-13');

-- Триггер 2 ---------------------------------------------------

/* Нельзя добавить человека с именем Андрей в таблицу*/

CREATE DEFINER=`root`@`localhost` TRIGGER `andrey` AFTER INSERT ON `clients` FOR EACH ROW BEGIN
IF new.name= 'Андрей' THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Do not paste this name';
END if;
end

insert into clients values
(110,'Андрей','Жуков','Александрович','Санкт-Петербург','89198706900');

-- Триггер 3 ----------------------------------------------------

/* Нельзя обновить данные в таблице*/

CREATE DEFINER=`root`@`localhost` TRIGGER `NO_UPDATE` BEFORE UPDATE ON `shops` FOR EACH ROW BEGIN 
IF (OLD.id >= 3 )THEN
SET NEW.id = OLD.id;
SET NEW.name= OLD.name;
SET NEW.address = OLD.address;
SET NEW.number_phone = OLD.number_phone;
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'NOOOOOOOOOOOOOOO';
END IF;

end;

update shops set address = 'Санкт-Петербург' where address  = 'Москва';
update shops set name = 'Лента' where name  = 'Магнит';

-- Процедура 1. -----------------------------------------------------------------------
/*В данной процедуре count_of_orders считается значение цены из таблицы ordered.
 Далее полученное значение попадает в цикл case и происходит его сравнение, 
 после чего выводится полученный ответ, в моём случае ответ "хорошо" */

CREATE PROCEDURE count_of_orders()
BEGIN
DECLARE ordered int;
select count(bpo.id_ordered) from basket_prod_ordered bpo ;
CASE
    WHEN ordered<10 THEN select 'Плохо';
    WHEN ordered<25 THEN select 'Нормально';
    WHEN ordered<37 THEN select 'Удовлетворительно';
    ELSE select 'Хорошо';
END CASE;
END;


CALL count_of_orders();

-- ---------------------------------------------------------------
-- Запрос, который выводит общее количество заказов.\
select count(bpo.id_ordered) from basket_prod_ordered bpo ;

-- Процедура 2-----------------------------------------------------------------------
/*В представленной процедуре day_routine() c помощью функции CURTIME узнаётся время в данный момент, потом оно 
 попадает в цикл и сравнивается с интервалами времени, пока не попадёт в интервал, далее
 выводится сообщение о том, что я делаю в данный промежуток времени*/

CREATE PROCEDURE day_routine()
BEGIN
  CASE 
    WHEN CURTIME() BETWEEN '06:00:00' AND '08:59:59' THEN
      SELECT 'Сон';
    WHEN CURTIME() BETWEEN '09:00:00' AND '11:59:59' THEN
      SELECT 'Завтрак';
    WHEN CURTIME() BETWEEN '12:00:00' AND '14:59:59' THEN
      SELECT 'Учеба';
    WHEN CURTIME() BETWEEN '15:00:00' AND '17:59:59' THEN
      SELECT 'Учеба дополнительная';
    WHEN CURTIME() BETWEEN '18:00:00' AND '20:59:59' THEN
      SELECT 'Спорт';
    WHEN CURTIME() BETWEEN '21:00:00' AND '23:59:59' THEN
      SELECT 'Домашняя работа';
    WHEN CURTIME() BETWEEN '00:00:00' AND '02:59:59' THEN
      SELECT 'Сон вечерний';
    WHEN CURTIME() BETWEEN '03:00:00' AND '05:59:59' THEN
      SELECT 'Сон ночной';
    ELSE
      SELECT 'Гуляю';
  END CASE;
end;

CALL day_routine();

-- Процедура 3---------------------------------------------------
-- Сюды можно впихнуть абсолютно любой запрос) Конкретно тут происходит вывод количества поставок со всех магазинов за каждый месяц 

CREATE PROCEDURE query()
     select extract(month from date_suply) as "месяц", s2.name as "Магазин" , count(s.id) as "Количество поставок" 
	 from supplies s inner join shops s2 on s.id_shops = s2.id 	
	 group by s.id, s2.name
	 order by extract(month from date_suply);
 
CALL query ();


select * from basket_prod_ordered bpo ;

-- Процедура 4 ---------------------------------------------------------------
/* В следующей процедуре используется параметр IN 'var1' (тип integer), который принимает число от пользователя. 
В теле процедуры есть оператор SELECT, который выбирает строки из таблицы 'form_of_payment', и количество строк будет предоставлено пользователем. */
drop procedure if exists my_proc_payment;

CREATE PROCEDURE my_proc_payment (IN var1 INT)
begin
SELECT * FROM form_of_payment LIMIT var1;
end ;

-- Чтобы вывести первые 2 строки из таблицы 'form_of_payment', необходимо выполнить следующую команду:
call my_proc_payment (2);


-- Процедура 5---------------
-- Такая процедура подсчитывает количество всех магазинов.
CREATE PROCEDURE count_of_shops_()
    	 select count(s.name) from shops s  ;

CALL count_of_shops_ ();


-- Функция 1. -----------------
-- Данная функция выводит слово, переданное в переменную result.
drop function if exists HelloWorld;
 
CREATE FUNCTION HelloWorld() RETURNS VARCHAR(20)
    DETERMINISTIC
BEGIN
    DECLARE result varchar(30);
 
   
 SET result = 'Продукты';
 
 RETURN (result); 
END
 
select HelloWorld();


-- Функция 2. -----------------
-- Эта функция умеет складывать числа
drop function if exists plus;
  
CREATE FUNCTION plus(a int,b int) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE result INT;

 SET result = a+b;
 
 RETURN (result); 
END
 
Select plus(4,7);

-- Функция 3. ---------------------------------------------------------
-- Следующая функция может подсчитать количество форм оплаты.
create function query_res()
returns int
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
begin
	declare a int;
	DECLARE cur1 cursor FOR select count(*) from form_of_payment;
	OPEN cur1;
	FETCH cur1 INTO a;
	CLOSE cur1;    
	return(a);
end

select query_res();

-- Функция 4. -----------------------------------------------------------
-- Такая функция находит общую сумму всех сделанных заказов.

create function query_answ()
returns int
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
begin
	declare a int;
	DECLARE cur1 cursor FOR select sum(price*amount) from ordered o ;
	OPEN cur1;
	FETCH cur1 INTO a;
	CLOSE cur1;    
	return(a);
end

select query_answ();


-- Функция 5. ------------------------------------------------------
-- И последняя функция выводит имя клиента, заданное нами из таблицы clients.

create function get_name()
returns varchar(50)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
begin
	declare a varchar(50);
	DECLARE cur1 cursor FOR select c.name from clients c where name = 'Максим';
	OPEN cur1;
	FETCH cur1 INTO a;
	CLOSE cur1;    
	return(a);
end

select get_name();





-- Функция 3. -------------
/* drop function if exists count_of_orders;


delimiter $$
CREATE FUNCTION count_of_orders(result1 int) 
RETURNS VARCHAR(50)
deterministic
begin
	DECLARE result1 int;
	declare result2 VARCHAR(50);
	declare result3 int;
	select count(o.id) into `result3` from ordered o;
	if `result1` <`result3` then select 'Плохо' into `result2`;
    else if `result1` >`result3` then select 'Нормально' into `result2`;
    else if `result1` = `result3` then select 'Удовлетворительно' into `result2`;
    END if;	
    return(result2);
end $$
DELIMITER ;

-- -----------------------------------------







 
