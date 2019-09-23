#常见的数据类型 
/*
数值型：
	整型
	小数： 
		定点数
        浮点数
字符型：
	较短的文本：char varchar
    较长的文本：text blob（较长的二进制数据）
日期型：
	

*/

#一 整型
/*
分类:
	tinyint 1 
	smallint 2
	mediumint 3
	int/interger 4
	bigint 8
特点：
	如果不设置有无符号默认为有符号 
    如果超出了类型最大值，out of range异常 并且插入临界值
    如果不设置长度，会有默认长度
    长度代表显示的最大宽度，搭配zerofill使用会有0左填充 
*/
#1.如何设置无符号和有符号 
drop table if exists tab_int; 
create table tab_int(
	t1 int(7) zerofill,
    t2 int unsigned 
);
insert into tab_int values(
	123,234
);
select * from tab_int;

#二 小数 
/*
1.浮点型： 
	float(M,D)
	double(M,D)
2.定长型 
	dec(M,D)
    decimal(M,D)
特点
	M和D： 
		M整数部分和小数部分一共几位，超过范围就插入临界值 
		D代表小数部分保留几位 
	M和D都可以省略 
		如果是Decimal 则M默认10 D默认0 
        如果是float double 则会根据插入数值精度
	定点型精确度较高，如果插入数值精度较高如货币运算等则考虑使用 
*/
create table tab_float(
	f1 float(5,2),
    f2 double(5,2),
    f3 decimal(5,2)
);

insert into tab_float values(123.45,123.45,123.45);
insert into tab_float values(123.4,123.4,123.4);
insert into tab_float values(123.4,123.4,123.4);

#原则：
/*
所选的类型越简单越好，能保存的数值类型越小越好  
*/

#三 字符型
/*
较短的文本：
	char
	varchar
其他：
	binary varbinary
    enum保存枚举 
    set保存集合 
较长的文本 
	text	
	blob（保存较大的二进制） 

特点：
	char    char(M)    固定长度的字符 比较耗费空间  效率高  
    varchar varchar(M) 可变长的字符   比较节省 		效率低 
    
*/

create table tab_char(
	c1 enum('a','b','c')
);
insert into tab_char values('a');
insert into tab_char values('b');
insert into tab_char values('m');#不行
insert into tab_char values('A');
select * from tab_char;

create table tab_set(
	s1 set('a','b','c')
);
insert into tab_set values('a');
insert into tab_set values('a,b');
insert into tab_set values('a,m');#不行 
select * from tab_set;

#四：日期型
/*
分类：
	date只保存日期
    time 只保存时间
    year 只保存年 
    
    datetime 日期+时间
    timestamp 日期+时间 
    
特点：
				字节	范围  
    datetime	8		1
    timestamp	4
*/
create table tab_date(
	t1 datetime,
    t2 timestamp
);

insert into tab_date values(now(),now());
select * from tab_date;

show variables like 'time_zone';
set time_zone = '+9:00';
set time_zone = 'System';