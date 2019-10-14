#TCL
/*
Transaction Control Language

事物: 
	一个或一组SQL语句组成一个执行单元,这个执行单元要么全部执行,要么全部不执行 
案例:
	转账
    张三丰  1000
    郭襄  	1000
    
    update 表 set 张三丰 余额=500 where name = '张三丰'
    意外X 
    update 表 set 张三丰 余额=500 where name = '郭襄'
    这条却执行了
事务的ACID 性质 
	1.原子性
		事务是一个不可分割的工作单位,要么都执行要么都不执行  
    2.一致性
		事务会使使数据库从一个一致性状态变换到另一个一致性状态 
    3.隔离性
		一个事务不能被另一个事务干扰 
	4.持久性
		一个事务一旦被提交,他对数据库中数据的改变就是永久性的
        
事务的创建 
	隐式事务:
		事务没有明显的开启和结束的标记 
		比如 insert update delete语句
	显式事务:
		必须设置自动提交功能为禁用
        set autocommit = 0;
		
步骤1:
	开启事务 
    set autocommit =0;
    start transaction;可选
步骤2:
	编写sql语言
步骤3:
	结束事务 
    commit;
    rollback;
    savepoint 节点名;

事务的隔离级别:
							脏读		幻读		不可重复读 
	read uncommitted:		√			√			√
    reda committed:    		×			√			√
    repeatable read 		×			×			√
    serializable			×			× 			× 
    
	mysql中默认第三个隔离级别 
    oracle 默认第二个隔离级别 
    
    
*/
select @@transaction_isolation;
show variables like '%isolation%';
show engines;
show Variables like 'auto%';
set autocommit = 0;

#演示 
	set autocommit =0;
    start transaction;
    #update 
    commit;
    
drop table if exists account;
create table account(
	id int,
    username char(10),
    balance int 
);
desc account;
insert into account set id =25,username = '小王', balance = 1000;
insert into account set id =28,username = '小红', balance = 1000;
select * from account;

#savepoint的使用 
set SQL_SAFE_UPDATES = 0;

set autocommit =0;
start transaction;
delete from account where id = 25;
savepoint a;#设置保存点a 
delete from account where id = 28;
rollback to a;
select * from account;

#视图
/*
含义:
	虚拟表 和普通表一样使用 
    mysql 5.1版本出现的新特性 是通过表动态生成的数据 
比如:
	舞蹈班和普通班级的对比 
	
*/

 
use myemployees;
#一 创建视图
/*
语法 
create view 视图名  
as
*/  
#1.查询邮箱中包含a字符的员工名 部门名 和工种信息 
create view myv1 
as
select last_name,department_name,job_title
from employees e
join departments d on e.department_id = d.department_id 
join jobs j on j.job_id = e.job_id;

select * from myv1 where last_name like '%a%';

#2.查询各部门平均工资级别
create view myv2
as
select avg(salary) ag,department_id 
from employees
group by department_id;

select myv2.ag,g.grade_level
from myv2
join job_grades g
on myv2.ag between g.lowest_sal and g.highest_sal;
