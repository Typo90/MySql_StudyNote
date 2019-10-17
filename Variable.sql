#变量 
/*
系统变量:
	全局变量
    会话变量

自定义变量:
	用户变量
    局部变量
*/

#一 系统变量
/*
说明:
	变量是由系统提供,属于服务器层面
使用语法:
	1.查看所有的系统变量
		show global variables;
		show session variables;
	2.查看满足条件的部门系统变量 
		show global variables like '%char%';
	3.查看指定的某个系统变量的值 
		select @@[global||session].系统变量名
	4.为某个系统变量赋值 
		set [global|session]系统变量名 = 值;
        set @@[global||session]系统变量名 = 值;
	注意:
		如果是全局加global,如果是会话则需要加session
        不写默认session
*/

#1.全局变量
/*
作用域:
	服务器每次启动将为所有的全局变量赋初始值,针对所有连接有效,但不能跨重启 
*/
#查看所有的全局变量 
show global variables;
#查看部门全局变量;
show global variables like '%char%';
#查看指定的全局变量的值
select @@global.autocommit;
select @@transaction_isolation;
select @@global.transaction_isolation;
#为某个指定的全局变量赋值
set @@global.autocommit = 1;

#2.会话变量 
/*
作用域:
	仅仅针对当前会话(连接)有效 
*/

#查看所有的会话变量 
show session variables; 
show variables;
#查看部分的会话变量  
show variables like '%char%';
#查看指定的某会话变量 
select @@transaction_isolation;
select @@session.transaction_isolation;
#为某会话变量赋值 
set @@session.transaction_isolation = 'read-uncommitted';
set session transaction_isolation = 'read-uncommitted';

#二 自定义变量
/*
说明:
	变量是用户自定义,不是由系统
使用步骤:
	声明
	赋值
    使用(查看 比较 运算)
    
*/

#1.用户变量
/*
作用域:
	针对当前会话有效,等同于会话变量的作用域
    放在begin end里面 

赋值的操作符: =或:=
#声明并初始化 
	set @用户变量名 = 值;
	set @用户变量名:= 值;
	select @用户变量名:=值;
#赋值
	方法一:
    set @用户变量名 = 值;
	set @用户变量名:= 值;
	select @用户变量名:=值;
	方法二:
    select 字段 into 变量名 from 表; 
    
#使用(查看用户变量的值) 
	select @变量名;
*/
set @name = 'john';
set @name = 100;

use Myemployees;
select count(*) into @count
from employees;
select @count;

#2.局部变量
/*
作用域:
	仅仅在他的begin end中有效 
#声明
	declare 变量名 类型;
    declare 变量名 类型 default 值;
*/
