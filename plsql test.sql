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

select * from ebill;

desc ebill;

DELIMITER //
create procedure cal_bamt(in x varchar(10), out o decimal(8,2))
begin
declare done boolean default 0;
declare uits int(4);
declare amt_cur cursor for
select nounits from ebill where cno=x;
open amt_cur;
fetch amt_cur into uits;
if uits>200 then
set o=(uits-200)*1.5+150;
elseif uits>100 and uits<200 then
set o=(uits-100)*1.5+50;
else
set o=uits*0.5;
end if;
close amt_cur;
update ebill set bamt=o where cno=x;
select * from ebill where cno=x;
end //


DELIMITER //
create trigger day_trig1 before insert on myemp for each row 
begin
declare val1 varchar(20);
declare val2 varchar(20);
declare val3 varchar(20);
set val1='Saturday';
set val2='Sunday';
set val3=current_date();
if strcmp(val1,dayname(val3))=0 || strcmp(val2,dayname(val3))=0 then
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Cannot insert on week end days';
end if;
end //

insert into myemp values(10,'jacksparrow',2157,23000,3,100,5);







create table ebill(cno integer(4)primary key, cname varchar(30)not null , nounits integer(4)not null, bamt float(8,2));



insert into ebill values(101,'Anu',10,null), (102,'Anbu',20,null),(103,'Subeesh',30,null),(104,'Mahez',40,null),(105,'Amal',50,null);






