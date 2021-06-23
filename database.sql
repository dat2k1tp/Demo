create database sof3021;

use sof3021;

create table categories
(
	id int not null auto_increment,
    name nvarchar(255) not null,
    constraint PK_Categories primary key(id)
);

create table users
(
	id int  not null auto_increment,
    username nvarchar(255) not null,
    password nvarchar(255) not null,
    email varchar(255)  not null unique,
    photo varchar(255) not null,
    activated int not null default 1,
    admin int not null default 0,
    constraint PK_Users primary key(id)
);

create table products(
	id int not null auto_increment,
    name nvarchar(255) not null,
    image varchar(255) not null,
    price float not null,
    create_date datetime not null,
    available int not null,
    category_id int not null,
	constraint PK_Products primary key(id)
  
);

create table orders(
	id int not null auto_increment primary key,
    user_id int not null,
	create_date datetime not null,
	address nvarchar(255) not null


);

create table order_details(
	id int not null auto_increment primary key,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    price float not null
);

-- drop table order_details;
-- drop table orders;

alter table products
add constraint FK_Products_Categories  foreign key(category_id) references categories(id);

alter table orders
add constraint FK_Orders_Account  foreign key(user_id) references users(id);

alter table order_details
add constraint FK_OrderDetails_Orders  foreign key(order_id) references orders(id);

alter table order_details
add constraint FK_OrderDetails_Products  foreign key(product_id) references products(id);

alter table categories
add delete_at int not null default 0;

alter table products
add delete_at int not null default 0;

alter table orders
add telephone int not null ;

alter table orders
add activated int not null default 1;







