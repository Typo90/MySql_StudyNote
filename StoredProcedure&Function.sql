#村粗过程和函数 
/*
存储过程和函数:类似java中的方法
好处:
	提高代码的重用性 
	简化操作 
*/
#存储过程
/*
含义:
	一组预先编译好的SQL语句的集合,理解成批处理语句
好处:
	提高代码的重用性 
	简化操作
    减少编译次数和服务器连接次数,提高了效率
*/

#一 创建语法 
/*
create procedure 存储过程名(参数列表)
begin
	春促过程体(一组合法有效的SQL语句)
end

1.参数列表包含三部分
    参数模式 参数名 参数类型
举例:
	in stuname varchar(20)
参数模式:
	in:
		该参数可以作为输入,也就是该参数需要调用方法传入值 
    out:
		该参数可以作为输出,也就是该参数可以作为返回值 
    inout:
		该参数既可以作为输入又可以作为输出,也就是该参数既需要传入值又可以返回值

2.如果储存过程体仅仅只有一句话,begin end可以省略 

3.存储过程体的结尾可以使用 delimiter 重新设置 
	delimiter 结束标记 
    
*/

#二 调用方法
/*
call 存储过程名(实参列表);
*/ 

#1.空参列表 
use girls;
#案例:插入到admin表中五条记录
select * from admin;

delimiter $
create procedure myp1()
begin
	insert into admin(username,password) values
    ('john1','00000'),
    ('john1','00000'),
    ('jac','00000'),
    ('rose','00000'),
    ('tom','00000');
end $

call myp1()$



#2.创建带in模式参数的存储过程
#案例1:根据女神名,查询对应的男神信息 

create procedure myp2(in beautyName varchar(20))
begin
	select bo.*
    from boys bo
    right join beauty b 
    on bo.id = b.boyfriend_id
    where b.name = beautyName;
end$

call myp2('小昭')$
select * from beauty$

#案例2:创建存储过程实现,用户是否登录成功 

create procedure myp3(in username varchar(20),in password varchar(30))
begin
	declare result varchar(20) default '';#声明并初始化 
    
    select count(*) into result #赋值
    from admin
    where username = admin.username
    and password = admin.password;
    
    select result;
end $
select * from admin$
call myp3('john','8888')$

#delimiter ; ;
create procedure myp4(in username varchar(20),in password varchar(30))
begin
	declare result int default 0 ;#声明并初始化 
    
    select count(*) into result #赋值
    from admin
    where username = admin.username
    and password = admin.password;
    
    select if(result>0,'成功','失败' ) 结果;
end $
drop procedure myp4$
call myp4('john',8888)$

#3.创建带out模式的存储过程
#案例1:根据女神名返回对应的男神名 
create procedure myp5(in beautyName varchar(20),out boyName varchar(20))
begin
	select bo.boyName into boyName
    from boys bo
    inner join beauty b 
    on bo.id = b.boyfriend_id 
    where b.name = beautyName;
end $

#调用 
call myp5('小昭',@bName)$
select @bName $

#案例2:根据女神名,返回对应的男神名和魅力值
create procedure myp6(in beautyName varchar(20),out boyName varchar(20),out userCP int)
begin
	select bo.boyName ,bo.userCP into boyName,userCP
    from boys bo
    inner join beauty b 
    on bo.id = b.boyfriend_id 
    where b.name = beautyName;
end $

call myp6('小昭',@bName,@usercp)$
select @bName,@usercp $