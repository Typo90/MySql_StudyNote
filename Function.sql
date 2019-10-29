#函数
/*
含义:
	一组预先编译好的SQL语句的集合,理解成批处理语句
好处:
	提高代码的重用性 
	简化操作
    减少编译次数和服务器连接次数,提高了效率
区别:
	存储过程:可以有0个返回,也可以有多个返回
		适合批量插入,批量更新 
	函数:有且仅有1个返回 
		适合处理数据后返回一个结果 
*/

#一 创建语法
/*
create function 函数名(参数列表) returns 返回类型
begin
	函数体
end

1.参数列表:
	参数名 参数类型 
2.函数体:
	肯定有return语句 如果没有会报错 
    如果return没有放在函数体的最后也不报错,但不建议
    return 值;
3.当函数体中只有一句话可以省略begin end
4.使用delimiter 语句设置结束标记  
*/

#二 调用 
/*
select 函数名(参数列表)
*/

#案例
#1.无参有返回 
#返回公司的员工个数 
set global log_bin_trust_function_creators=1;
use myemployees;
delimiter $
create function myf1() returns int 
begin

	declare c int default 0;
    select count(*) into c from employees;
    return c;
end $

select myf1()$

#2.有参有返回
#案例1:根据员工名返回他的工资
create function myf2(empName varchar(20)) returns double
begin
	set @sal = 0;
    select salary into @sal
		from employees
        where last_name = empName;
	return @sal;
end $
select myf2('Kochhar')$

#案例2:根据部门名,返回该部门的平均工资  
create function myf3(depName varchar(20)) returns double
begin
	declare avg_sal double default 0;
    select avg(salary) into avg_sal
		from employees e
        join departments d on e.department_id = d.department_id
        where d.department_name = depName;
        return avg_sal;
end$
select myf3('it')$
select myf3('Adm')$

#三 查看函数 
show create function myf3$

#四 删除函数 
drop function myf3;

