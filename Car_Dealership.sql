create table customer(
customer_id SERIAL primary key, 
first_name VARCHAR(50),
last_name VARCHAR(50),
phone_number numeric (15),
email VARCHAR(100),
address VARCHAR(100),
city VARCHAR(50),
state VARCHAR (2),
country VARCHAR(50)
);   

create table salesperson(
salesperson_id SERIAL primary key,
first_name VARCHAR(20),
last_name VARCHAR(20)
)

create table car (
car_id SERIAL primary key,
serial_number INTEGER,
make VARCHAR (30),
model VARCHAR (30),
color VARCHAR (30),
year_ VARCHAR (30)
);
create table invoice (
invoice_id SERIAL primary key,
amount integer ,
date_ date 
);
create table service_ticket (
ticket_id SERIAL primary key,
date_ DATE,
amount numeric (6,2),
date_recieved DATE,
date_returned DATE,
comment_ VARCHAR (50)
);

create table mechanic(
mechanic_id SERIAL primary key,
first_name VARCHAR(20),
last_name VARCHAR(20)
);
create table parts(
parts_id SERIAL primary key,
parts_name VARCHAR(20),
parts_number integer,
part_price numeric (4,2)
);
alter table invoice 
add salesperson_id INTEGER ;

alter table invoice
add foreign key (salesperson_id) references salesperson(salesperson_id);

alter table invoice 
add customer_id INTEGER ;

alter table invoice
add foreign key (customer_id) references customer(customer_id);

alter table service_ticket 
add car_id INTEGER ;

alter table service_ticket
add foreign key (car_id) references car(car_id);

alter table mechanic 
add ticket_id INTEGER ;

alter table mechanic
add foreign key (ticket_id) references service_ticket(ticket_id);

create or replace procedure add_customer(
	first_name_ VARCHAR(50),
	last_name_ VARCHAR (50),
	phone_number_ numeric (15),
	email_ VARCHAR(100),
	address_ VARCHAR(100),
	city_ VARCHAR(50),
	state_ VARCHAR (2),
	country_ VARCHAR(50)
)
language plpgsql
as $$
begin 
	insert into customer(first_name, last_name,phone_number,email,address,city,state,country)
	values(first_name_,last_name_,phone_number_,email_,address_,city_,state_,country_);
end
$$

call add_customer('Allison', 'Arciniega', 2102102100, 'allisona1012@gmail.com', '123 circle dr', 'San Antonio', 'TX', 'USA')

call add_customer('Devin', 'Garcia', 1234567890, 'dgarcia@email.com', '453 square dr', 'El Paso', 'TX', 'USA') 

call add_customer('Fratelli', 'Pupp', 0987654321, 'telli@email.com', '786 Treat Street', 'Dallas', 'TX', 'USA') 

call add_customer('Ronald', 'Dogg', 4561237890, 'ronnieboy@gmail.com', '764 Squeak Lane', 'Austin', 'TX', 'USA') 

select * from customer;

create or replace procedure add_salesperson(
	first_name_ VARCHAR(50),
	last_name_ VARCHAR (50)
	
)
language plpgsql
as $$
begin 
	insert into salesperson(first_name, last_name)
	values(first_name_,last_name_);
end
$$

call add_salesperson ('Scooby','Doo')

call add_salesperson ('Scrappy','Doo')

call add_salesperson ('Danny','Phantom')

create or replace procedure add_car(
	serial_number_ numeric (15),
	make_ VARCHAR(100),
	model_ VARCHAR(100),
	color_ VARCHAR(50),
	_year_  integer
)
language plpgsql
as $$
begin 
	insert into car(serial_number, make,model,color,year_)
	values(serial_number_, make_,model_,color_,_year_);
end
$$

call add_car (123123, 'Ford','Fiesta','Blue', 2013)

call add_car (456456, 'Hyundai', 'Veloster','Silver',2015)

call add_car (789789, 'Tesla', 'Model X', 'White', 2020)

 