#DDL
/*
数据定义语言 
库和表的管理 

一：库的管理 
	创建 修改 删除 
二：表的管理
	创建 修改 删除 

创建：create
修改：alter
删除：drop
*/

#一：库的股那里
#1.库的创建 
/*
create database 库名 
*/

#案例：创建Book
create database if not exists books;

#2库的修改 
#不能用rename database boooks to book;

#更改库的字符集 
alter database books character set GBK;

#3.库的删除 
drop database if exists books;

#二 表的管理 
#1.表的创建！
/*
create table 表名 (
	列名 列的类型（长度 约束），
    列名 列的类型（长度 约束），
    列名 列的类型（长度 约束）
)
*/
#drop table if exists book;
#案例：创建Book表 
use books;
create table book(
	id int,#数的编号 
    bName varchar(20),#书名 
	price double,#价格
    authorId int,#作者编号 
    publishDate Datetime #出版日期	
);

create table author(
	id int,
    author_name varchar(20),
    nation varchar(10)
);

#2.表的修改 
/*
alter table 表名 add/drop/change/modify/rename to 列名 类型约束 
*/
#修改列名
alter table book change column publishDate pubDate datetime;

#修改列的类型或约束
alter table book modify column pubDate timestamp;
desc book; 

#添加新列
alter table book add column annual double;

#删除列 
alter table book drop column annual;

#修改表名
alter table author rename to  book_author; 
alter table book_author rename to  author; 


#3.表的删除 
drop table book_author;

#4.表的复制 
insert into author 
values
	(1,'村上春树','日本'),
	(2,'莫言','中国'),
    (3,'冯唐','中国'),
    (4,'金庸','中国');

#仅仅复制表的结构 
create table copy like author;
select * from author;

#复制结构+数据 
create table copy2 select * from author;
select * from copy2;

#只复制部门数据 
create table copy3
select *
from author
where nation = '中国';
select * from copy3;

#仅仅复制某些字段 
create table copy4
select id,author_name
from author
where false;
select * from copy4;

#常见约束 
/*
含义：一种限制，用于限制表中的数据，为了保证表中的数据的准确和可靠性

分类：六大约束
	not null： 
		非空 用于保证该字段的值不为空
		比如姓名，学号等
	default：
		默认约束 用于保证该字段有默认值
        比如性别
	primary key:
		主键，用于保证该字段的值具有唯一性，并且非空
		比如学号，员工编号
	unique：
		唯一，用于保证该字段的值具有唯一性，可以为空 
		比如 座位号
	check：
		检查约束【mysql中不支持】
		比如年龄 性别 
	foreign key：
		外键 用于限制两个表的关系 用于保证该字段的值必须来自于主表的关联列的值
*/
