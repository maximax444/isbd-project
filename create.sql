create database stocks_of_products;
use stocks_of_products;

drop table if exists products;
create table products(
	id int primary key not null,
	id_return_products int not null,
	name varchar(100) not null,
	brand varchar(100) null,
	price int not null,
	best_before_date date not null,
	manufacturers_country varchar(100) null,
	manufacrurers_name varchar(100) null
);


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


drop table if exists positions;
create table positions(
	id int primary key not null,
	name varchar(100) not null default 'sorting'
);


drop table if exists suppliers;
create table suppliers(
	id int primary key not null,
	name varchar(100) not null,
	address varchar(100) null,
	number_phone varchar(100) null
);


drop table if exists orders;
create table orders(
	id int primary key not null,
	id_of_client int not null,
	id_supplier int not null,
	id_delivery int not null,
	id_employees int not null,
	id_wr_pr int not null,
	shipping_date date not null,
	departure_date date null
);


drop table if exists supplies;
create table supplies(
	id int primary key not null,
	id_shops int not null,
	sum_suply int not null,
	date_suply date null
);



drop table if exists return_products ;
create table return_products (
	id int primary key not null,
	price int not null,
	amount int not null,
	date_return date null
);


drop table if exists write_off_products;
create table write_off_products(
	id int primary key not null,
	price int not null,
	amount int not null
);


drop table if exists shops;
create table shops(
	id int primary key not null,
	name varchar(100) not null,
	address varchar(100) null,
	number_phone varchar(100) null
);


drop table if exists ordered;
create table ordered(
	id int primary key not null,
	id_product int not null,
	id_form_of_payment int not null,
	price int not null,
	amount int not null,
	discount int null default 0
);


drop table if exists form_of_payment;
create table form_of_payment(
	id int primary key not null,
	name varchar(100) not null
);


drop table if exists delivery;
create table delivery(
	id int primary key not null,
	name varchar(100) not null,
	number_phone varchar(100) null,
	price int not null default 0
);


drop table if exists clients;
create table clients(
	id int primary key not null,
	name varchar(100) not null,
	surname varchar(100) not null,
	patronymic varchar(100) null,
	address varchar(100) null,
	number_phone varchar(100) null
);
