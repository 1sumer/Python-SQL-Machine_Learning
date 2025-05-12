-- Active: 1685713185905@@localhost@3306@you

select if(234>300, 'yes', 'no');

SELECT if (251=251 ,'Correct','wrong');

select if(STRCMP('sameer', 'sameer')=0, 'Correct','wrong');

CREATE Table student(stdid int, fname VARCHAR(20), lname VARCHAR(20), class int, age int);

insert into student value(1, "sameer", "pasha", 12, 24);
insert into student value(2, "vikas","gowda", 6, 25);
insert into student value(3, "bhavya","sharma", 5, 26);
insert into student value(4, "Ayesha","afreen", 7, 35);
insert into student value(5, "Md","fazil", 3, 20);
insert into student value(6, "Md","thair", 3, 19);

select * from student;

select lname,
if(age>20,"M","I")
as result
from student;

select ifnull("hello", "sameer");

select ifnull(null,5);

select case 1 
    WHEN 1 then 'one' 
    when 2 then 'two' 
    else 'more' 
    end nom;

select case 2 
    WHEN 1 then 'one' 
    when 2 then 'two' 
    else 'more' 
    end nom;

select case 3 
    WHEN 1 then 'one' 
    when 2 then 'two' 
    else 'more' 
    end nom;

select stdid, fname,
case stdid
		when 1 then age+10
		when 2 then age+10
		when 3 then age+10
		when 4 then age+10
		when 5 then age+10
		else age+100
		end as revised_age
		from student;

SELECT
  product_name,
  quantity,
  CASE
    WHEN quantity > 10 THEN 'High'
    WHEN quantity > 5 THEN 'Medium'
    ELSE 'Low'
  END AS quantity_category
FROM
  orders;
