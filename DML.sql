#DML语言
/*
数据操作语言 
插入：insert
修改：update
删除：delete


*/

#一 插入语句
/*
语法：
	insert into 表名(列名,...)
    values(值1,...);
*/

#1.插入的值的类型要与我们列的类型一致或兼容 
insert into beauty(id,NAME,sex,bondate,phone,photo,boyfriend_id) 
values(13,'Infante','女','1999-10-6','18000000',null,2);