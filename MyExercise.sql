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

#!子查询 
/*
含义： 
	出现再其他语句中的select语句就是子查询，又称为内查询 
外部的查询语句：
	主查询或外查询 
    
*/
 
	

 
