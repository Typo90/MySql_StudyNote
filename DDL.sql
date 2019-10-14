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

#--------------------------------------------------------------------
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
		在从表中添加外键约束用于限制主表中某列的值
        比如 学生表专业编号，员工表的工种编号
        
	添加约束的时机：
		1.创建表时
        2.修改表时
	约束的添加分类：
		列级约束：
			6大约束都可以写 语法上都支持，但外键约束没有效果
        表级约束：
			除了非空和默认 其他的都支持 
            
主键和唯一对比:
			保证唯一性	是否允许为空 		是否允许组合  			 
	主键 	√			×(至多一个为空)		√（不推荐）
    唯一	√			√(可以有多个)		√（不推荐）

外键：
	1.要求在从表设置外键关系
    2.从表外键列的类型和主表列的类型一致或兼容，名称无要求
    3.主表的关键列必需是一个key（主键或唯一）
    4.插入数据时，先插主表，再插从表 
	删除数据时，先删除从表，再删除主表
    5.可以有多个约束条件 
*/

#一 创建表时添加约束 
#1.添加列级约束 
/*
语法：
	直接在字段名和类型后面追加 约束类型
	只支持：默认 非空 主键 唯一 
*/
create database students;
use students;
create table stuinfo(
	id int primary key,#主键
    stuName varchar(20) not null,#非空 
    gender char(1) check(gender = '男' or gender = '女 '),#（不支持） 
    seat int unique,#唯一 
    age int default 20 ,#默认 
    majorId int references major(id)#外键（不支持）
);
desc stuinfo;
show index from stuinfo;
#drop table major;
create table major(
	id int primary key,
    majorName varchar(20)
);

#2.添加表级约束
/*
语法：
	在各个字段最下面 
    【constraint 约束名】 约束类型（字段名）
*/ 
drop table if exists stuinfo;
create table stuinfo(
	id int,
    stuname varchar(20),
    gender char(1),
    seat int, 
    age int,
    majorid int,
    
    /*constraint pk*/ primary key(id),#主键 
    constraint uq unique(seat),#唯一键 
    constraint ck check(gender in ('男','女')),#check
    /*constraint fk_stuinfo_major*/ foreign key(majorid) references major(id),#外键
    #组合主键 
    constraint z primary key(id,stuname)
);
show index from stuinfo;

#通用写法
create table if not exists stuinfo(
	id int primary key,
    stuname varchar(20) not null,
    gender char(1),
    seat int unique, 
    age int default 20,
    majorid int,
    constraint fk_stuinfo_major foreign key(mayjorid)references major(id)
);

#二 修改表时添加约束
/*
1.添加列级约束 
alter table 表名 modify column 字段名 字段类型 新约束;

2.添加表级约束 
alter table 表名 add 【constraint 约束名】 约束类型(字段名)【外键的引用】


*/
drop table if exists stuinfo;
create table stuinfo(
	id int,
    stuname varchar(20),
    gender char(1),
    seat int, 
    age int,
    majorid int
    
);
desc stuinfo;
#1.添加非空约束 
alter table stuinfo modify column stuname varchar(20) not null;
#2.添加默认约束 
alter table stuinfo modify column age int default 20;
#3.添加主键 
alter table stuinfo modify column id int primary key;
alter table stuinfo add primary key(id);
#4.添加唯一键 
alter table stuinfo modify column seat int unique;
alter table stuinfo add constraint uq unique(seat);
#5.添加外键 
alter table stuinfo add foreign key(majorid) references major(id);

#三 修改表时删除约束
#1.删除非空约束
alter table stuinfo modify column sdtuname varchar(20) null;
#2.删除默认的约束 
alter table stuinfo modify age int;
#3.删除主键
alter table stuinfo modify column id int;#不行 
alter table stuinfo drop primary key;
#4.删除唯一键 
alter table stuinfo drop index seat;
#5.删除外键
alter table stuinfo drop foreign key XXX;


#--------------------------------------------------------------------
#标识列
/*
又称为自增长列
含义:可以不用手动的插入值,系统提供默认的序列 
特点:
	1.不一定非要和主键搭配,但一定要和key搭配
	2.一个表中只能有一个标识列 
    3.标识列的类型只能是int/float/double
    4.标识列可以通过 set auto_increment_increment = 3步长 
*/

#一 创建表时设置标识列 
create table tab_identity(
	id int primary key auto_increment,
    name varchar(20)
);
insert into tab_identity values(null,'john');
insert into tab_identity(name) values('lucy');
select * from tab_identity;

set auto_increment_increment = 3;

#二 修改表时修改标识列 
alter table tab_identity modify column id int primary key auto_increment;

#三 修改表时删除标识列 
alter table tab_identity modify column id int;

 