set echo on

connect sys/1234

	drop user user cascade;
	create user user identified by 123;
	grant connect, resource to user;
	alter user user default tablespace users
	temporary tablespace temp account unlock;

	drop user item cascade;
	create user item identified by 123;
	alter user item default tablespace system
	temporary tablespace temp account unlock;
	grant create procedure, create session, create table, resource, select any dictionary to item;

	drop user cart cascade;
	create user cart identified by 123;
	alter user item default tablespace system
	temporary tablespace temp account unlock;
	grant create procedure, create session, create table, resource, select any dictionary to cart;

	connect user/123

	create table user(user id primary key,
					  username varchar2(50) unique,
					  user_password varchar2(50));



	connect item/123

	create table item(user_id primary key,
					  item_name varchar2(50),
					  item_size varchar2(50),
					  item_num number(10),
					  item_quanity number(5),
					  item_prize number(7,2));


	connect cart/123

	create table cart(user_id primary key,
					  item_name varchar2(50),
					  item_size varchar2(50),
					  item_num number(10),
					  item_prize number(7,2),
					  cart_date date);


	grant select on item to user;

