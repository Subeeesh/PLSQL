use plsql;

create table myemp(Eno integer(4)primary key, Ename varchar(30)not null,Deptno integer(10)not null,Esal float(8,2));


insert into myemp values(101,'Anu',10,55300),(102,'Anbu',20,34500),(103,'Subeesh',30,64500),(104,'Mahez',40,44500),(105,'Amal',50,34500);

insert into myemp values(106,'gokul',10,8000,3),(107,'latha',20,7000,2);

select * from empcommnul;

ALTER TABLE myemp
ADD Eexp integer(25)not null;

update myemp set Esal=null where Esal between 5000 and 10000;

ALTER TABLE myemp
ADD comm integer(25);


insert into myemp values(108,'petta',10,11000,3,34),(109,'jessi',20,13000,4,32);




create table empcommnul like myemp;

insert into empcommnul select * from myemp where comm is null;
delete from myemp where comm is null;
select * from myemp;





create table ebill(cno integer(4)primary key, cname varchar(30)not null , nounits integer(4)not null, bamt float(8,2));



insert into ebill values(101,'Anu',10,null), (102,'Anbu',20,null),(103,'Subeesh',30,null),(104,'Mahez',40,null),(105,'Amal',50,null);






