drop table if exists products;
create table products(
	id int primary key not null,
	id_return_products int not null,
	id_suppliers int not null,
	name varchar(100) not null,
	brand varchar(100) null,
	price int not null,
	best_before_date date not null,
	manufacturers_country varchar(100) null,
	manufacrurers_name varchar(100) null
);
delete from products ; 
insert into products (id,id_return_products,id_suppliers,name,brand,price,best_before_date,manufacturers_country
,manufacrurers_name) values

(1,7,1,'Сыр','Тысяча Озёр',319,'2022-08-01','Беларусь','Нева-Милк'),
(2,7,2,'Сыр','Тысяча Озёр',350,'2022-08-01','Беларусь','Нева-Милк'),
(3,7,3,'Сыр','Тысяча Озёр',300,'2022-08-01','Беларусь','Нева-Милк'),
(4,3,1,'Ликер','BAILEYS',1855,'2020-07-14','Ирландия','R.A.Bailey & Co'),
(5,3,2,'Ликер','BAILEYS',2025,'2020-07-14','Ирландия','R.A.Bailey & Co'),
(6,3,3,'Ликер','BAILEYS',2100,'2020-07-14','Ирландия','R.A.Bailey & Co'),
(7,3,4,'Ликер','BAILEYS',1800,'2020-07-14','Ирландия','R.A.Bailey & Co'),
(8,3,5,'Ликер','BAILEYS',1690,'2020-07-14','Ирландия','R.A.Bailey & Co'),
(9,2,2,'Зубная щётка','President',300,'2022-05-12','Италия','Бетафарма'),
(10,1,3,'Гель для стирки белья','Ariel Color',779,'2021-12-09','Великобритания','Procter & Gamble'),
(11,4,3,'Бритва','Venus',1359,'2021-07-26','Германия','Procter & Gamble'),
(12,6,1,'Сосиски','Докторские',400,'2022-08-13','Беларусь','Брестский мясокобинат'),
(13,6,2,'Сосиски','Докторские',413,'2022-08-13','Беларусь','Брестский мясокобинат'),
(14,6,3,'Сосиски','Докторские',499,'2022-08-13','Беларусь','Брестский мясокобинат'),
(15,6,4,'Сосиски','Докторские',387,'2022-08-13','Беларусь','Брестский мясокобинат'),
(16,6,5,'Сосиски','Докторские',400,'2022-08-13','Беларусь','Брестский мясокобинат'),
(17,7,3,'Креветки','VICI',850,'2022-09-19','Литва','Viciunaj Group'),
(18,7,4,'Креветки','VICI',850,'2022-09-19','Литва','Viciunaj Group'),
(19,7,5,'Креветки','VICI',900,'2022-09-19','Литва','Viciunaj Group'),
(20,7,1,'Рыба','Русское море',650,'2022-09-17','Россия','Русская рыбная компания'),
(21,7,2,'Рыба','Русское море',490,'2022-09-17','Россия','Русская рыбная компания'),
(22,7,3,'Рыба','Русское море',609,'2022-09-17','Россия','Русская рыбная компания'),
(23,7,4,'Рыба','Русское море',549,'2022-09-17','Россия','Русская рыбная компания'),
(24,7,4,'Рыба','Русское море',535,'2022-09-17','Россия','Русская рыбная компания'),
(25,6,1,'Пельмени','Сибирская коллекция',500,'2022-09-09','Россия','Щёлковский МПК'),
(26,6,2,'Пельмени','Сибирская коллекция',590,'2022-09-09','Россия','Щёлковский МПК'),
(27,6,3,'Пельмени','Сибирская коллекция',537,'2022-09-09','Россия','Щёлковский МПК'),
(28,6,4,'Пельмени','Сибирская коллекция',499,'2022-09-09','Россия','Щёлковский МПК'),
(29,6,5,'Пельмени','Сибирская коллекция',487,'2022-09-09','Россия','Щёлковский МПК');

select * from products p ;


-- 2 
drop table if exists employees;
create table employees(
	id int primary key not null,
	id_positions int not null,
	first_name varchar(100) not null,
	surname varchar(100) not null,
	patronymic varchar(100) null,
	address varchar(100) null,
	number_phone varchar(100) null
);

insert into employees (id, id_positions, first_name, surname, patronymic, address, number_phone) values
(1,1,'Петр','Соловьев','Игоревич','Москва','84955131718'),
(2,2,'Егор','Крылов','Артемович','Москва','84956785969'),
(3,3,'Глеб','Жуков','Олегович','Санкт-Петербург','89445467410'),
(4,4,'Виктор','Максимов','Артемович','Тула','87656453219'),
(5,4,'Павел','Сидоров','Евгеньевич','Ростов-на-Дону','89185097651'),
(6,4,'Евгений','Фролов','Денисович','Москва','84956797543'),
(7,4,'Петр','Попов','Петров','Великий Новгород','89435198703'),
(8,5,'Константин','Соловьев','Игоревич','Москва','84950109876'),
(9,5,'Юлия','Никонова','Олеговна','Москва','84955400100'),
(10,5,'Антон','Гаврилов','Игоревич','Калининград','89076785412');

select * from employees e ;
-- 3
drop table if exists positions;
create table positions(
	id int primary key not null,
	name varchar(100) not null default 'sorting'
);

insert into positions(id, name) values
(1,'менеджер'),
(2,'заведующий складом'),
(3,'старший складовщик'),
(4,'кладовщик-комплетовщик'),
(5,'сортировщик');

select * from positions p ;
-- 4 
drop table if exists suppliers;
create table suppliers(
	id int primary key not null,
	name varchar(100) not null,
	address varchar(100) null,
	number_phone varchar(100) null
);

insert into suppliers (id,name,address,number_phone) values
(1,'ООО Лента','Москва','89455876091'),
(2,'ООО Перекресток','Санкт-Петербург','89312008761'),
(3,'ООО Призма','Москва','89451009861'),
(4,'ООО Пятерочка','Ростов-на-дону','89175002969'),
(5,'ООО Магнит','Новосибирск','89696906900');

select * from suppliers s ;

-- 5
drop table if exists orders;
create table orders(
	id int primary key not null,
	id_ordered int not null,
	id_of_client int not null,
	id_supplier int not null,
	id_delivery int not null,
	id_employees int not null,
	id_wr_pr int not null,
	shipping_date date not null,
	departure_date date null
);



-- 6    -> 9
drop table if exists supplies;
create table supplies(
	id int primary key not null,
	id_shops int not null,
	sum_suply int not null,
	date_suply date null
);
insert into supplies (id,id_shops,sum_suply,date_suply) values
(1,6,13890,'2022-06-12'), -- YYYY-MM-DD
(2,1,14800,'2022-07-15'),
(3,3,15800,'2021-12-26'),
(4,2,23070,'2022-09-14'),
(5,2,28889,'2022-08-25'),
(6,3,10912,'2022-07-23'),
(7,4,7600,'2021-07-24'),
(8,4,21091,'2022-08-13'),
(9,4,5800,'2022-09-03'),
(10,1,18300,'2021-12-21'),
(11,6,10500,'2021-12-27');

select * from supplies s ;


-- 7
drop table if exists return_products ;
create table return_products (
	id int primary key not null,
	price int not null,
	amount int not null,
	date_return date null
);

insert into return_products (id,price,amount,date_return) values
(1,510,4,'2022-05-13'),
(2,849,2,'2021-11-18'),
(3,1380,1,'2022-05-18'),
(4,790,9,'2022-05-17'),
(5,2308,4,'2022-03-14'),
(6,459,6,'2021-03-13'),
(7,650,3,'2022-08-14');

select * from return_products rp ;

-- 8
drop table if exists write_off_products;
create table write_off_products(
	id int primary key not null,
	price int not null,
	amount int not null
);

insert into write_off_products(id, price, amount) values
(1,789,3),
(2,1300,4),
(3,650,6),
(4,549,2),
(5,2400,8);

select * from write_off_products wop ;
-- 9
drop table if exists shops;
create table shops(
	id int primary key not null,
	name varchar(100) not null,
	address varchar(100) null,
	number_phone varchar(100) null
);

insert into shops (id,name,address,number_phone) values
(1,'Лента','Москва','84951002346'),
(2,'Перекресток','Москва','84950987607'),
(3,'Пятерочка','Ростов-на-Дону','89281006969'),
(4,'Магнит','Москва','84956900785'),
(5,'Призма','Санкт-Петербург','89315109697'),
(6,'Дикси','Санкт-Петербург','89312074560');

select * from shops s ;

-- 10
drop table if exists ordered;
create table ordered(
	id int primary key not null,
	id_product int not null,
	id_form_of_payment int not null,
	price int not null,
	amount int not null,
	discount int null default 0
);
insert into ordered (id,id_product,id_form_of_payment,price,amount,discount) values
(1,3,2,350,4,2),
(2,2,2,350,9,3),
(3,1,2,319,15,5),
(4,13,3,413,18,NULL),
(5,15,3,387,21,NULL),
(6,12,2,400,4,4),
(7,16,3,400,6,20),
(8,9,3,300,10,NULL),
(9,19,3,900,3,2),
(10,17,3,850,2,5),
(11,29,3,487,9,NULL),
(12,26,3,590,16,3),
(13,25,3,500,13,2),
(14,28,3,499,7,NULL),
(15,20,3,650,5,4),
(16,22,3,609,9,10),
(17,24,3,535,11,20),
(18,21,3,490,4,NULL),
(19,23,3,549,2,NULL);

select * from ordered o ;
-- 11
drop table if exists form_of_payment;
create table form_of_payment(
	id int primary key not null,
	name varchar(100) not null
);
insert into form_of_payment (id,name) values
(1,'наличными'),
(2,'картой'),
(3,'онлайн'),
(4,'наложенным платежом');

select * from form_of_payment fop ;

-- 12
drop table if exists delivery;
create table delivery(
	id int primary key not null,
	name varchar(100) not null,
	number_phone varchar(100) null,
	price int not null default 0
);
delete from delivery; -- удаляет строки
insert into delivery(id,name,number_phone,price) values
(1,'Самовывоз',NULL,0),
(2,'Курьер','89185109685',0),
(3,'Курьер','89281004768',500);

select * from delivery d ;


-- 13
drop table if exists clients;
create table clients(
	id int primary key not null,
	name varchar(100) not null,
	surname varchar(100) not null,
	patronymic varchar(100) null,
	address varchar(100) null,
	number_phone varchar(100) null
);

insert into clients(id, name, surname, patronymic, address, number_phone) values
(1,'Алексей','Иванов','Игоревич','Санкт-Петербург','89318776869'),
(2,'Максим','Кузнецов','Андреевич','Новосибирск','83831003764'),
(3,'Екатерина','Михайлова','Евгеньевна','Великий Новогород','89524867531'),
(4,'Вадим','Смирнов','Петрович','Ростов-на-Дону','89198776732'),
(5,'Сергей','Васильев','Алексеевич','Москва','84957680123'),
(6,'Полина','Колесникова','Викторовна','Новосибирск','83832456750'),
(7,'Олег','Петров','Геннадьевич','Москва','84957600103');

select * from clients c ;

alter table employees 
add constraint fk_empl_positions
foreign key (id_positions) references positions(id); 

alter table supplies 
add constraint fk_supps_shops
foreign key (id_shops) references shops(id);

alter table products  
add constraint fk_suplrs_pro
foreign key (id_suppliers) references suppliers(id);

alter table products 
add constraint fk_products_retprod
foreign key (id_return_products) references return_products(id);

alter table ordered  
add constraint fk_ordered_products
foreign key (id_product) references products(id);

alter table ordered 
add constraint fk_ordered_payment
foreign key (id_form_of_payment) references form_of_payment(id);

alter table orders  
add constraint fk_orders_ordered
foreign key (id_ordered) references ordered(id);

alter table orders 
add constraint fk_orders_supplies
foreign key (id_supplier) references supplies(id);

alter table orders
add constraint fk_orders_clients
foreign key (id_of_client) references clients(id);

alter table orders 
add constraint fk_orders_wri_prod
foreign key (id_wr_pr) references write_off_products(id);

alter table orders 
add constraint fk_orders_employyes
foreign key (id_employees) references employees(id);

alter table orders 
add constraint fk_orders_delivery
foreign key (id_delivery) references delivery(id);

