#DML语言
/*
数据操作语言 
插入：insert
修改：update
删除：delete


*/

#一 插入语句
#方式一：经典插入 
/*
语法：
	insert into 表名(列名,...)
    values(值1,...);
*/

#1.插入的值的类型要与我们列的类型一致或兼容 
insert into beauty(id,name,sex,borndate,phone,photo,boyfriend_id) 
values(13,'Infante','女','1999-10-6','18000000',null,2);
select * from beauty;

#2.不可以为null的列必须插入值，可以为null的插入 
insert into beauty(id,name,sex,borndate,phone,boyfriend_id) 
values(14,'Quite','女','1989-10-6','18000000',2);

#3.列的顺序可以调换 
insert into beauty(name,sex,id,phone)
values('XX','女',18,'911');

#4.可以省略列名，默认所有列 列的顺序和表中列的顺序一致 
insert into beauty
values(20,'小王','女',null,'918',null,null);

#方式二：
/*
语法：
insert into表名
set 列名=值 
*/
insert into beauty
set id=25,name='新垣结衣',phone = '396-456';

#两种方式pk
#1.方式一支持插入多行,方式二不支持   
insert into beauty
values(14,'Infante','女','1999-10-6','18000000',null,2),
(15,'Infante','女','1999-10-6','18000000',null,2);

#2.方式一支持子查询，方式二不支持
insert into beauty(id,name,phone)
select 26,'宋茜','189-165';
select * from beauty;

#----------------------------------------------------------
#二修改语句 
/*
1.修改单表中的记录
语法：
	update 表名 
    set 列=新值,列=新值 
    where 筛选条件; 
2.修改多表中的记录 
	92语法：
		update 表1，表2
		set 列=值
        where 连接条件 
        and 筛选条件；
	99语法：
		update 表1 
        inner/left/right/outer join 表2 
        on 连接条件 
		where 筛选条件 
        */

#1.修改单表
#案例一：修改beauty表中i开头女神电话为‘1387150’
update beauty set phone = '1387150'
where id = 26 ;
select * from beauty;

#案例2：修改boys表中id=2名称为张飞魅力值为10
update boys set boyName = '张飞' ,usercp = 10
where id = 2;
select * from boys;

SET SQL_SAFE_UPDATES = 0;
#2.修改多表的记录 
#案例1：修改张无忌的女朋友的手机号为144
update boys bo
inner join beauty b
on bo.id = b.boyfriend_id 
set b.phone = 114 
where bo.boyName = '张无忌';
select * from beauty;

#案例2：修改没有男朋友的女神的男朋友编号为2
update boys bo
right join beauty b on bo.id = b.boyfriend_id
set b.boyfriend_id = 2
where b.id is null; 

#----------------------------------------------------------
#三 删除语句 
/*
方式一：delete
语法：
	1.单表删除 
		delete from 表名 where 筛选条件 
	2.多表删除 
		92:
			delete 别名，别名2 
            from 表1，表2
            where 筛选条件 
            and 筛选条件；
		99：
			delete 表1，表2
            from 表1 
            inner/left/right join 表2 on 连接条件 
方式二：truncate
语法 truncate table 表明 
*/

#方式一：delete
#1.单表的删除 
#删除手机编号最后一位为9的
delete from beauty where phone like '%8';
select * from beauty; 

#2.多表的删除 
#案例：张飞女朋友的信息 
delete b
from beauty b
inner join boys bo on b.boyfriend_id = bo.id
where bo.boyName = '张飞';

#删除黄晓明的信息以及他的女朋友 
delete b,bo
from beauty b
inner join boys bo on b.boyfriend_id = bo.id
where bo.boyName = '黄晓明';

#方式二：truncate语句 
#案例：将魅力值>100的男神信息删除 X
truncate table boys ;

#delete 和 truncate区别 
/*
1.delete可以加where
2.truncate删除效率高
3.假如要删除的表中有自增长列，
	如果用delele删除后，再插入数据，自增长列的值从断点开始，
	而truncate删除后，再插入数据，自增长列的值从1开始
4.truncate删除没有返回值，delete删除有返回值
5.truncate删除不能回滚，delete可以回滚 
*/
# 
