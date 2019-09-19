#use myemployees;

#============================================================================
#============================================================================
#test_lesson03 排序数据 
#1.查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序 
-- select 
-- 	last_name,department_id,salary*12*(1+ifnull(commission_pct,0)) 年薪
-- from
-- 	employees
-- order by 
-- 	年薪 desc,last_name asc;
#2. 选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序
-- select
-- 	last_name,salary
-- from
-- 	employees
-- where
-- 	salary < 8000 or salary > 170000#not between 8000 and 17000
-- order by
-- 	salary desc;

#3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序 
-- select 
-- 	*
-- from 
-- 	employees
-- where
-- 	email like '%e%' 
-- order by
-- 	length(email) desc,department_id asc;
#============================================================================
#============================================================================


#test_lesson04 单行函数 
#1.显示系统时间(注：日期+时间) 
-- select now();

#2. 查询员工号，姓名，工资，以及工资提高百分之 20%后的结果（new salary）
-- select 
-- 	employee_id,last_name,salary,salary*1.2  'new salary'
-- from
-- 	employees;

#3. 将员工的姓名按首字母排序，并写出姓名的长度（length）
-- select 
-- 	last_name,length(last_name)
-- from 
-- 	employees
-- order by
-- 	substr(last_name,1);
    
#4. 做一个查询，产生下面的结果 
#<last_name> earns <salary> monthly but wants <salary*3> Dream Salary King earns 24000 monthly but wants 72000 
-- select 
-- 	concat(last_name,'earns',salary,'mothly but wants',salary*3) 'Dream Salary'
-- from 
-- 	employees;
    
#5. 使用 case-when，按照下面的条件： 
#job grade AD_PRES  A ST_MAN             B IT_PROG             C SA_REP              D ST_CLERK           E 产生下面的结果 Last_name Job_id Grade 
#king AD_PRES A 

-- select 
-- 	job_id as job,
-- 	case job_id
-- 		when 'AD_PRES' then 'A'
-- 		else 'C'
-- 		end  as grade
--  from 
-- 	employees;
#============================================================================
#============================================================================


#test_lesson05 分组函数
#1. 查询公司员工工资的最大值，最小值，平均值，总和 
-- select 
-- 	max(salary),min(salary),round(avg(salary),2),sum(salary)
-- from
-- 	employees;
#2. 查询员工表中的最大入职时间和最小入职时间的相差天数 （DIFFRENCE）
-- select 
-- 	datediff(max(hiredate),min(hiredate)) difference
-- from 
-- 	employees;

#3. 查询部门编号为 90 的员工个
-- select 
-- 	count(1)
-- from employees
-- where department_id =90;
#============================================================================
#============================================================================


#test_lesson06 分组查询
#1. 查询各 job_id 的员工工资的最大值，最小值，平均值，总和，并按 job_id 升序
-- select
-- 	max(salary),min(salary),avg(salary),sum(salary)
-- from 
-- 	employees
-- group by
-- 	job_id
-- order by
-- 	job_id asc;
    
#2. 查询员工最高工资和最低工资的差距（DIFFERENCE）
-- select
-- 	max(salary)-min(salary) DIFFERENCE
-- from
-- 	employees;

#3. 查询各个管理者手下员工的最低工资，其中最低工资不能低于 6000，没有管理者的员 工不计算在内
-- select
-- 	min(salary),manager_id
-- from
-- 	employees
-- where
-- 	manager_id is not null
-- group by
-- 	manager_id
-- having
-- 	min(salary) >6000;

#4. 查询所有部门的编号，员工数量和工资平均值,并按平均工资降序 
-- select
-- 	department_id,count(*),avg(salary)
-- from
-- 	employees
-- group by
-- 	department_id
-- order by
-- 	avg(salary) desc;
#5. 选择具有各个 job_id 的员工人数 
-- select
-- 	count(*),job_id
-- from 
-- 	employees
-- group by
-- 	job_id;
#============================================================================
#============================================================================


#test_lesson08 SQL92语法连接查询
#1. 显示所有员工的姓名，部门号和部门名称。 
-- select
-- 	last_name,e.department_id,department_name
-- from
-- 	employees e, departments d 
-- where
-- 	e.department_id = d.department_id;
    
#2. 查询 90 号部门员工的 job_id 和 90 号部门的 location_id 
-- select 
-- 	job_id ,location_id
-- from
-- 	employees e, departments d  
-- where
-- 	e.department_id = d.department_id
-- and
-- 	e.department_id = 90;

#3. 选择所有有奖金的员工的 last_name , department_name , location_id , city \
-- select 
-- 	last_name,department_name,l.location_id,city
-- from
-- 	employees e, departments d,locations l 
-- where
-- 	e.department_id = d.department_id
-- and
-- 	d.location_id = l.location_id
-- and
-- 	e.commission_pct is not null;

#4. 选择city在Toronto工作的员工的 last_name , job_id , department_id , department_name 
-- select
-- 	last_name,job_id,d.department_id,d.department_name
-- from
-- 	employees e,departments d,locations l  
-- where
-- 	e.department_id = d.department_id
-- and
-- 	d.location_id = l.location_id
-- and
--     l.city = 'Toronto'
#5.查询每个工种、每个部门的部门名、工种名和最低工资
-- select
-- 	job_title,department_name,min(salary)
-- from
-- 	employees e,departments d,jobs j
-- where
-- 	e.department_id = d.department_id
-- and
-- 	e.job_id = j.job_id
-- group by
-- 	department_name,job_title;
 
#6.查询每个国家下的部门个数大于 2 的国家编号 
-- select
-- 	country_id,count(*)
-- from
-- 	locations l,departments d
-- where
-- 	d.location_id = l.location_id
--  group by
-- 	country_id
-- having
-- 	count(*) > 2;
	
#7、选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格 式 
#employees Emp# manager Mgr# kochhar   101 king    100 
-- select
-- 	e.last_name employees,e.employee_id "Emp#",m.last_name manager,m.employee_id "Mgr#"
-- from
-- 	employees e, employees m
-- where 
-- 	e.manager_id = m.employee_id
-- and
-- 	e.last_name = 'kochhar'
#============================================================================
#============================================================================


#test_lesson07 SQL99语法连接查询
#一、查询编号>3 的女神的男朋友信息，如果有则列出详细，如果没有，用 null 填充
-- select
-- 	b.name,bo.*
-- from
-- 	beauty b
-- left outer join
-- 	boys bo
-- on
-- 	b.boyfriend_id = bo.id
-- where
-- 	b.id>3;
#右外    
-- select
-- 	b.name,bo.*
-- from
-- 	boys bo
-- right outer join
-- 	beauty b
-- on
-- 	b.boyfriend_id = bo.id
-- where
-- 	b.id>3;
	
 #二、查询哪个城市没有部门 
--  use myemployees;
--  select
-- 	l.city,d.*
-- from
-- 	locations l
-- left outer join 
-- 	departments d
-- on 
-- 	l.location_id = d.location_id
-- where
-- 	d.department_id is null;

 #三、查询部门名为 SAL 或 IT 的员工信息 
--  select
-- 	e.*,d.department_name
-- from
-- 	departments d
-- left outer join 
-- 	employees e 
-- on e.department_id = d.department_id
-- where
-- 	d.department_name in ('SAL','IT');

#============================================================================
#============================================================================


#test_lesson09 子查询
#1. 查询和 Zlotkey 相同部门的员工姓名和工资
-- select last_name,salary
-- from employees
-- where department_id = (
-- 	select department_id
--     from employees
--     where last_name = 'Zlotkey'
-- ) ;

#2. 查询工资比公司平均工资高的员工的员工号，姓名和工资。
-- select
-- 	employee_id ,last_name ,salary
-- from 
-- 	employees e
-- where
-- 	salary > (
-- 		select
-- 			avg(salary)
-- 		from
-- 			employees
--     );
    
#3. 查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资
-- select employee_id , last_name , salary , e.department_id
-- from employees e
-- inner join 	(
-- 	select avg(salary) as ag,department_id
--     from employees
--     group by department_id) ag_dep
-- on e.department_id = ag_dep.department_id
-- where e.salary > ag_dep.ag; 

#4. 查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名 
-- select last_name,employee_id
-- from employees
-- where department_id in (
-- 	select distinct department_id
--     from employees
--     where last_name like '%u%'
-- );

#5.  查询在部门的 location_id 为 1700 的部门工作的员工的员工号
-- select employee_id
-- from employees e
-- where department_id in (
-- 	select department_id
-- 	from departments
-- 	where location_id = 1700);

#6.  查询管理者是 King 的员工姓名和工资
-- select last_name,salary
-- from employees
-- where manager_id in (
-- 	select employee_id
--     from employees
--     where last_name = 'K_ing'
-- ) ;


#7.  查询工资最高的员工的姓名，要求 first_name 和 last_name 显示为一列，列名为 姓.名  
-- select concat(last_name , first_name)
-- from employees
-- where salary = (
-- 	select max(salary)
--     from employees
-- ); 	

#============================================================================
#============================================================================


#test_lesson10 数据处理
#1. 运行以下脚本创建表 my_employees Create table my_employees(  Id int(10),  First_name varchar(10),  Last_name varchar(10),  Userid varchar(10),  Salary double(10,2) ) create table users(  id int,  userid varchar(10),  department_id int ) 
Create table my_employees( 
	Id int(10),  
    First_name varchar(10),  
    Last_name varchar(10),  
    Userid varchar(10),  
    Salary double(10,2) 
); 
create table users(  
	id int,  
    userid varchar(10),  
    department_id int 
) ;
 
#2. 显示表 my_employees 的结构 
desc my_employees;
#3. 向 my_employees 表中插入下列数据 
#ID FIRST_NAME LAST_NAME USERID SALARY 1 patel Ralph Rpatel 895 2 Dancs Betty Bdancs 860 3 Biri Ben Bbiri 1100 4 Newman Chad Cnewman 750 5 Ropeburn Audrey Aropebur 1550  
#方式一：
insert into my_employees(ID,FIRST_NAME,LAST_NAME,USERID,SALARY)
values 
	(1,'patel' , 'Ralph' ,'Rpatel', 895),
	(2,'Dancs' , 'Betty' ,'Bdancs', 860),
    (3,'Biri', 'Ben' ,'Bbiri',1100),
    (4,'Newman', 'Chad','Cnewman',750), 
    (5,'Ropeburn', 'Audrey',' Aropebur', 1550);  
    
#方式二： 
insert into my_employees
select 1,'patel' , 'Ralph' ,'Rpatel', 895 union
select 2,'Dancs' , 'Betty' ,'Bdancs', 860;
    
#4.  向 users 表中插入数据
#1 Rpatel 10 2 Bdancs 10 3 Bbiri 20 4 Cnewman 30    5 Aropebur 40 
 insert into users
 set id = 1,userid = 'Rpatel',department_id=10;
 
#5. 将 3 号员工的 last_name 修改为“drelxer” 
update my_employeesset 
set last_name = 'drelxer'
where id = 3;

#6. 将所有工资少于 900 的员工的工资修改为 1000 
SET SQL_SAFE_UPDATES = 0;
update my_employees 
set salary = 1000
where salary<900;

#7. 将 userid 为 Bbiri 的 user 表和 my_employees 表的记录全部删除
delete u,m  
from my_employees m 
right  join  users u
on m.userid = u.userid
where u.userid = 'Bbiri';
#8. 删除所有数据 

#9. 检查所作的修正 
select * from my_employees;
select * from users;
#10. 清空表 my_employees 
 
#============================================================================
#============================================================================


#test_lesson11 创建和管理表
#1. 创建表 dept1 name Null? type id  int(7) name  varchar(25) 
create table dept1(
    id int(7),
    name varchar(25)
);
#2. 将表 departments 中的数据插入新表 dept2 中 
create table dept2 
select * from myemployees.departments;

#3. 创建表 emp5 name Null? type id  int(7) First_name  Varchar (25) Last_name  Varchar(25) Dept_id  int(7) 
create table emp5(
	id int(7),
    First_name varchar(25),
    Last_name varchar(25),
    Dept_id int(7)
);

#4. 将列 Last_name 的长度增加到 50
alter table emp5 change column Last_name Last_name varchar(50); 

#5. 根据表 employees 创建 employees2 
create table employees2 like myemployees.employees;
select * from employees2;

#6. 删除表 emp5 
drop table if exists emp5; 

#7. 将表 employees2 重命名为 emp5 
alter table employees2 rename to emp5; 

#8 在表 dept 和 emp5 中添加新列 test_column，并检查所作的操作 
alter table emp5  add column test_column int;

#9.直接删除表 emp5 中的列 dept_id 
alter table emp5 drop column test_column;
select * from emp5;
 
 