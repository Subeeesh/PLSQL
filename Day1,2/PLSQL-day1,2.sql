show databases;
create database plsql;

use plsql;

CREATE TABLE `depart` (
  `depart_id` int NOT NULL,
  `depart_name` varchar(30) NOT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`depart_id`),
  UNIQUE KEY `manager_id` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

show tables;
desc depart;

create table employees(emp_id integer(6)primary key, emp_name varchar(20), email character(25),phone_number varchar(10),dept_id integer(4));

CREATE TABLE `empl` (
  `emp_id` int PRIMARY KEY NOT NULL,
  `emp_name` varchar(20) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

show tables;
desc employees;

alter table employees add(salary decimal(8,2));
desc employees;
alter table employees add foreign key(dept_id) references depart(depart_id);

desc employees;

-- Field 		     Type 			Null 	Key 
-- emp_id		    int				NO			PRI
-- emp_name		varchar(20)		YES			
-- phone_number	varchar(10)		YES			
-- dept_id		int				YES			MUL
-- salary		decimal(8,2)	YES	

alter table employees drop primary key;
desc employees;

alter table employees drop dept_id;

alter table employees drop foreign key employees_ibfk_1;

alter table employees drop index dept_id;

desc employees;

-- Field 		     Type 			Null 	Key 
-- emp_id		    int				NO			
-- emp_name		varchar(20)		YES			
-- phone_number	varchar(10)		YES			
-- dept_id		int				YES			
-- salary		decimal(8,2)	YES		


alter table employees drop email;

alter table empl add constraint check_salary check (salary>10000);

desc employees;

-- Field 		     Type 			Null 	Key 
-- emp_id		    int				NO			
-- emp_name		varchar(20)		YES			
-- phone_number	varchar(10)		YES			
-- dept_id		int				YES			
-- salary		decimal(8,2)	YES		

alter table employees rename to empl;

show tables;

desc empl;


create table depart1 like depart;

desc depart;

-- Field 		Type 			Null 	Key 
-- depart_id	int				NO		PRI		
-- depart_name	varchar(30)		NO			
-- manager_id	int				YES		UNI	

drop table depart1;

show tables;

desc empl;

-- Field 		     Type 			Null 	Key 
-- emp_id		    int				NO			
-- emp_name		varchar(20)		YES			
-- phone_number	varchar(10)		YES			
-- dept_id		int				YES			
-- salary		decimal(8,2)	YES			




-- DAY-2 PLSQL ASSIGNMENT --

insert into depart values(10,'purchase',123),(20,'inventory',345),(30,'sales',567),(40,'material',789),(50,'production',901);


insert into empl values(101,'goku','98462684',50,20000.50,'goku@'),(102,'subro','0975029',10,16000.50,'subro@'),(103,'walter','684342684',20,17000.50,'gus@'),(104,'stark','98462684',30,20000.50,'stark@');
insert into empl values(105,'pink','98462684',40,20000.50,'pinkman@');

desc empl;

select * from empl;

-- 101	goku	68462684	50	15000.50	goku@
-- 102	subro	0975029	10	16000.50	subro@
-- 103	walter	684342684	20	17000.50	gus@
-- 104	stark	98462684	30	20000.50	stark@

select * from depart;

-- depart_id	depart_name		manager_id
-- 10			purchase		123
-- 20			inventory		345
-- 30			sales			567
-- 40			material		789
-- 50			production		901


select * from empl e, depart d where e.dept_id = d.depart_id and d.depart_name='material';
-- 105	pink	98462684	40	20000.50	pinkman@	40	material	789


select depart_id, emp_name from empl, depart where depart_id=dept_id and depart_name='sales';

-- 30	stark

select emp_name from empl, depart where depart_id=dept_id and depart_name='material' and salary>10000;

-- emp_name
-- pink

select emp_name, salary+(salary*0.05) as sal from empl;

-- emp_name   sal

-- goku	21000.5250
-- subro	16800.5250
-- walter	17850.5250
-- stark	21000.5250
-- pink	21000.5250


select * from empl where emp_name like 'g%';

-- 101	goku	98462684	50	20000.50	goku@


update empl, depart set salary=salary+(salary*0.1) where depart_id=dept_id and depart_name='sales';


select * from empl;

-- 101	goku	98462684	50	20000.50	goku@
-- 102	subro	0975029	10	16000.50	subro@
-- 103	walter	684342684	20	17000.50	gus@
-- 104	stark	98462684	30	22000.55	stark@
-- 105	pink	98462684	40	20000.50	pinkman@


update empl, depart set salary=salary-(salary*0.01) where  depart_id=dept_id and depart_name='inventory';



select * from empl;

-- 101	goku	98462684	50	20000.50	goku@
-- 102	subro	0975029	10	16000.50	subro@
-- 103	walter	684342684	20	16830.50	gus@
-- 104	stark	98462684	30	22000.55	stark@
-- 105	pink	98462684	40	20000.50	pinkman@


create table updatedemp as select emp_id, emp_name, phone_number from empl where dept_id>20;


desc updatedemp;

-- Field 	Type 			Null 	Key 
-- emp_id	int				NO			
-- emp_name	varchar(20)		YES			
-- phone_number	varchar(10)	YES			

select * from updatedemp;

-- 101	goku	98462684
-- 104	stark	98462684
-- 105	pink	98462684


delete from empl where salary<13000;

select *from empl;

-- 101	goku	98462684	50	20000.50	goku@
-- 102	subro	0975029	10	16000.50	subro@
-- 103	walter	684342684	20	16830.50	gus@
-- 104	stark	98462684	30	22000.55	stark@
-- 105	pink	98462684	40	20000.50	pinkman@


create view view_updatedemp as select * from updatedemp;

select * from view_updatedemp;

-- 101	goku	98462684
-- 104	stark	98462684
-- 105	pink	98462684
create view view_empl as select emp_id, emp_name, dept_id from empl where salary>=12000;

select * from view_empl;


-- 101	goku	50
-- 102	subro	10
-- 103	walter	20
-- 104	stark	30
-- 105	pink	40

select * from empl order by salary asc;
-- 102	subro	0975029	10	16000.50	subro@
-- 103	walter	684342684	20	16830.50	gus@
-- 101	goku	98462684	50	20000.50	goku@
-- 105	pink	98462684	40	20000.50	pinkman@
-- 104	stark	98462684	30	22000.55	stark@

select * from empl order by emp_name desc;

-- 103	walter	684342684	20	16830.50	gus@
-- 102	subro	0975029	10	16000.50	subro@
-- 104	stark	98462684	30	22000.55	stark@
-- 105	pink	98462684	40	20000.50	pinkman@
-- 101	goku	98462684	50	20000.50	goku@








					















					



					














					
































