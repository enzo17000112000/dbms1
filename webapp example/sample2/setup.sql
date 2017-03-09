set echo on

connect system/amakal

	drop user enzouser cascade;
	create user enzouser identified by patrick;
	grant connect, resource to enzouser;
	alter user enzouser default tablespace users
	temporary tablespace temp account unlock;

	drop user enzo_admin cascade;
	create user enzo_admin identified by patrick;
	alter user enzo_admin default tablespace system
	temporary tablespace temp account unlock;
	grant create procedure, create session, create table,
	resource, select any dictionary to enzo_admin;

connect enzouser/patrick

	create table parts
		(id number primary key, category varchar2(20), name varchar2(20));

		insert into parts values(1,'RedHorse','500ml');
		

connect enzo_admin/patrick;

	create table enzo
		(app_username varchar2(20) primary key, app_password varchar2(20) not null);

		insert into enzo values('enzo','enzo');
		insert into enzo values('pat','pat');
		commit;

		grant select on enzo to enzouser;