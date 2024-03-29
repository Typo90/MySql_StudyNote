#！基础查询
/*
select 
	查询列表 
from 
	表名;
1.查询列表可以查询：表中的字段，常量，表达式，函数
2.查询的结果是虚拟的 表格

*/

#use myemployees;

#1.查询单个字段
-- select last_name from employees;

#2.查询表中的多个字段
-- select last_name,salary,email from employees;

#3.查询表中的所有字段
-- select * from employees;

-- select 
-- 	employee_id,first_name,last_name
-- from
-- 	employees;

#4.查询常量值
-- select 100;
-- select 'john';

#5.查询表达式
-- select 100*100;

#6.查询函数
-- select version();

#7.起别名
-- select 100%98 as 结果;
#方法一
-- select 
-- 	last_name as 姓,
-- 	first_name as 名 
-- from 
-- 	employees;
#方法二
-- select 
-- 	last_name 姓
-- from 
-- 	employees;
    
#8.去重
-- select distinct department_id from employees;

#9.+号的作用
/*
java +运算符
*/
-- select 
-- 	last_name + first_name as 姓名 
-- from  
-- 	employees;

-- select 
-- 	concat(last_name , first_name)as 姓名 
-- from  
-- 	employees;
    
#作业题出现null，出现null用0代替 
-- select 
-- 	ifnull(commission_pct,0) as 奖金率
-- from 
-- 	employees;
    
-- select 
-- 	concat(last_name ,',',first_name,ifnull(commission_pct,0))as out_put 
-- from  
-- 	employees;

#============================================================================
#============================================================================

#！条件查询
/*
语法：
    select
		列表  
	from 
		表名 
	where
		筛选条件;
特点：
	一，按条件表达式刷选 
		条件预算符：> < = != <>左边这个符号是"不等于" >= <=
    二，按逻辑表达式筛选
		逻辑运算符：&&  ||  ! 
					and or not
	三，模糊查询 
		like
        between and
        in 
        is null
*/

#1.按条件表达式筛选 
#案例一：查询工资>12000的员工信息
-- select 
-- 	*
-- from 
-- 	employees
-- where 
-- 	salary>12000;
    
#案例二：查询部门编号不等于90号的员工名和部门
-- select 
-- 	last_name,department_id
-- from 
-- 	employees
-- where 
-- 	department_id<>90;
    
#2.逻辑表达式查询 
#查询工资在10000到20000之间的员工名、工资以及奖金
-- select 
-- 	last_name,salary,commission_pct
-- from 
-- 	employees
-- where
-- 	salary >10000 and salary < 20000;

#3.模糊查询 
/* 
like
特点：一般和通配符一起使用
	通配符:
		%任意多个字符
        _任意单个字符
*/ 
# 案例一  查询员工名包含字符a的员工信息 
-- select 
-- 	*
-- from 
-- 	employees
-- where 
-- 	last_name like '%a%';

#案例二 查询第三个字符为n，第四个字符为o的员工名和工资
-- select 
-- 	last_name,salary
-- from 
-- 	employees
-- where 
-- 	last_name like '__no%';

#案例三 查询员工第二个字符为_的员工名
-- select
-- 	last_name
-- from
-- 	employees
-- where
-- 	 last_name like '_\_%';
#使用escape的转移符号
-- select
-- 	last_name
-- from
-- 	employees
-- where
-- 	 last_name like '_$_%' escape '$';

/*
between and 
特点
	包含边界值
	不要调换顺序
*/
#案例一：查询员工编号在100到120之间的员工信息
-- select 
-- 	*
-- from
-- 	employees
-- where
-- 	employee_id between 100 and 120;
    
/*
in
判断字段是否属于in列表中的某一项 
*/
#案例一：查询员工的工种编号IT_PROB AD_VP AD_PRES中的员工名和工种编号
-- select 
-- 	last_name,job_id
-- from 
-- 	employees
-- where
-- 	job_id in ('IT_PROT','AD_VP','AD_PRES');
    
/*
is null
*/
#查询没有奖金的员工名和奖金率
-- select
-- 	last_name,commission_pct
-- from
-- 	employees
-- where
-- 	commission_pct is not null ;
    
#安全等于 <=>
-- select
-- 	last_name,commission_pct
-- from
-- 	employees
-- where
-- 	commission_pct <=> null;
    
#============================================================================
#============================================================================

#！排序查询
/*
语法： 
	select
		查询列表
	from 
		表
	order by 
		排序列表 asc|desc
特点
	可以放单个字段，多个字段，表达式，函数，别名 
    一般是放在查询语句最后（除去limit）
*/

#案例1查询员工信息，要求工资从高到低排序
-- select
-- 	*
-- from
-- 	employees
-- order by
-- 	salary desc;

#案例2按年薪高低显示员工信息     
-- select 
-- 	*, salary*12*(1+ifnull(commission_pct,0)) 年薪
-- from
-- 	employees
-- order by
-- 	年薪 desc;
    
#案例3按姓名长度排序显示员工的姓名和工资
-- select 
-- 	length(last_name) 字节长度,last_name,salary
-- from
-- 	employees
-- order by
-- 	字节长度;
    
#案例4 查询员工信息，先按工资升排序，再按员工编号降排序
-- select 
-- 	*
-- from 
-- 	employees
-- order by
-- 	salary asc,employee_id desc;

#练习题 
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

#！常见函数
/*
调用：select 函数名（事物列表） [from 表];
特点：
	函数名 
	函数功能 
分类
	单行函数
		concat length ifnull
	分组函数 
	功能：统计
		
*/

#1.字符函数 

# length 获取参数值的字节个数 
-- show variables like '%char%';

# concat 拼接字符
-- select 
-- 	concat(last_name,'_',first_name)
-- from 
-- 	employees;
    
# upper lower
#将姓变大写名变小写拼接 
-- select 
-- 	concat(upper(last_name),'_',lower(first_name))
-- from
-- 	employees;

# substr substring 索引从1开始 
#指定位子后所有字符
-- select substr('李莫愁爱上了陆展元',7) out_put;
#指定位子指定字符长度

-- select substr('李莫愁爱上了陆展元',1,3) out_put;

#例子 姓名中首字符大写，其他字符用下划线拼接 
-- select 
-- 	concat(upper(substr(last_name,1,1)),'_',lower(substr(last_name,2))) out_put
-- from 
-- 	employees;

# instr 返回字串第一次出现的索引，如果找不到返回0
-- select instr('张三阿四爱上了阿四','阿四') as out_put;

# trim 
-- select trim('          123      ') out_put;

-- select trim('a' from 'aaaaaaaaaaaaaaa123bbbbbbb1aaaaaaaa');

# lpad | rpad 左填充 右填充 
-- select lpad('helloworld',20,'*') out_put;
-- select rpad('helloworld',3,'*');

# replace 
-- select replace('小明是个好学生','小明','小红');

#2.数学函数 

# round 四舍五入
-- select round(1.65);
#小数点后保留两位 
-- select round(1.567,2);

# ceil 向上取整 返回>=改参数的最小整数 
-- select ceil(1.42);

 # floor 向下取整 返回<=该参数的最大整数  
 -- select floor(-9.99);
 
 # truncate 截断
 -- select truncate (1.65,1);
 
 # mod 取余 相当于%
 /*
 结果和被除数有关 
 mod(a,b) : a-a/b*b
 mod(-10,-3) : -10 - (-10)/(-3)*(-3) = -1
 */
 -- select mod(10,3);
 
 #3.日期函数 
 
 # now返回当前系统日期+时间 
--  select now();
 
 # curdate 返回系统当前日期 不包含时间 
--  select curdate();

# curtime 返回当前时间，不包含日期 
-- select curtime();

#可以获取指定部分 
-- select year(now());
-- select year('1998-1-1');
-- select year(hiredate) from employees;

-- select month(now());
-- select monthname(now());

# str_to_date 将字符通过指定格式转化为日期
-- select str_to_date('1998-3-2','%Y-%c-%d') as out_put;

#查询入职日期1992-4-3的员工信息 
-- select 
-- 	*
-- from 
-- 	employees
-- where
-- 	hiredate = '1992-4-3';
 
-- select 
-- 	*
-- from 
-- 	employees
-- where
-- 	hiredate = str_to_date('4-3 1992','%c-%d %Y');

# date_format将日期转换为字符 
-- select date_format(now(),'%y年%m月%d日') as out_put;

#查询有奖金的员工名和入职日期（xx月/xx日 xx年）
-- select 
-- 	last_name,date_format(hiredate,'%m月/%d日 %Y年') 入职时间
-- from 
-- 	employees
-- where
-- 	commission_pct is not null;

#4.其他函数 
-- select version();
-- select database();
-- select user();

#5.流程控制函数 

#if函数 if else效果
-- select if(10>5,'大','小');

-- select 
-- 	last_name,commission_pct,if(commission_pct is null,'no','yes')有无奖金
-- from 
-- 	employees
-- order by 
-- 	有无奖金;
    
# case函数 使用1 类似 switch case
/*
语法 
case 要判断的字段或表达式 
when 常量1 then 要显示的语句1
else要显示的值n或语句n;
end
*/

/*案例:查询员工的工资，要求 
部门号 = 30, 工资为1.1倍
部门号 = 40，工资为1.2倍
部门号 = 50，工资为1.3倍 
其他部门为原工资  
*/
 
-- select salary 原始工资, department_id,

-- case department_id
-- when 30 then salary*1.1
-- when 40 then salary*1.2
-- when 50 then salary*1.3
-- else salary
-- end as 新工资

-- from employees;

# case函数使用2
/*
case
when 条件1 then 要显示的值1或语句2;
when 条件2 then 要显示的值2或语句2;

else 要显示的值n或语句n
end
*/

/*查询员工的工资
 工资>20000 显示A
 工资>15000 显示B
 工资>10000 显示c
 否则显示D 
*/
-- select salary,
-- case
-- when salary > 20000 then 'A'
-- when salary > 15000 then 'B'
-- when salary > 10000 then 'C'
-- else 'D'
-- end 工资等级
-- from
-- 	employees;

#============================================================================
#============================================================================

#6.分组函数 
/*
sum求和
avg平均值
max最大值
min最小值
count计算个数

特点： 
	1.sum，avg一般用于数值处理 
	2.以上分组函数都忽略null
    3.可以和distinct搭配去重
    4.count单独使用技巧
    5，和分组函数一同查询的字段要求是group by后的字段
*/

#简单使用 
-- select sum(salary) from employees;
-- select avg(salary), count(salary) from employees;
-- select round(avg(salary)) from employees;

#参数支持哪些类型 
-- select sum(last_name) from employees;

#忽略null
-- select sum(commission_pct),avg(commission_pct) from employees;

#和distinct搭配
-- select sum(distinct salary),sum(salary) from employees;
-- select count(distinct salary ), count(salary) from employees;
 
#count函数详细介绍 
-- select count(salary) from employees;
-- select count(*) from employess;#统计行数
-- select count(1) from employess;#统计行数
  


#============================================================================
#============================================================================

#!分组查询
/*
select 分组函数，列
from 表
where 筛选条件
group by 分组的列表 
order by 子句 

特点：
	1.分组查询中的筛选条件可以分为两类 
		分组前筛选	原始表 		group by前面  where
        分组后筛选  筛选后的表  grouop by后面 having
	2.group by 支持单个字段，支持多个字段，中间用逗号隔开 
    3.排序添加在整个分组查询的最后面 
        
*/ 

#案例1；查询每个工种的最高工资 
-- select max(salary),job_id
-- from employees
-- group by job_id;

#案例2：查询每个位置的部门个数
-- select count(*),location_id
-- from departments
-- group by location_id;

#添加筛选条件 
#案例1：查询邮箱中包含a字符的每个部门的平均工资 
-- select 
-- 	avg(salary),department_id
-- from 
-- 	employees
-- where 
-- 	email like '%a%'
-- group by 
-- 	department_id;
    
#案例2：查询有奖金每个领导手下员工的最高工资 
-- select
-- 	max(salary),manager_id
-- from 
-- 	employees
-- where
-- 	commission_pct is not null
-- group by 
-- 	manager_id;

#添加筛选条件 
#案例1：哪个部门的员工个数大于2
-- select 
-- 	count(1),department_id
-- from
-- 	employees
-- group by
-- 	department_id
-- having count(*)>2;

#案例2：查询每个工种有奖金的员工工资>12000的工种编号和最高工资
-- select
-- 	max(salary),job_id
-- from
-- 	employees
-- where
-- 	commission_pct is not null
-- group by 
-- 	job_id
-- having
-- 	max(salary)>12000;

#案例3: 查询领导编号>102的每个领导手下的最低工资>5000的领导编号是个哪个，以及其最低工资
-- select 
-- 	manager_id,min(salary) 
-- from
-- 	employees
-- where
-- 	manager_id >102
-- group by
-- 	manager_id
-- having 
-- 	min(salary) > 5000;

#按表达式或函数分组

#案例：按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数>5的有哪些
-- select 
-- 	count(*) 
-- from
-- 	employees
-- group by
-- 	length(last_name)
-- having 
-- 	count(*)>5;

#按多个字段分组 

#案例：查询每个部门每个工种的员工的平均工资
-- select 
-- 	avg(salary),department_id,job_id
-- from
-- 	employees
-- group by
-- 	department_id,job_id;

#添加排序 
#案例：查询每个部门每个工种的员工的平均工资
-- select 
-- 	avg(salary),department_id,job_id
-- from
-- 	employees
-- where 
-- 	department_id is not null
-- group by
-- 	department_id,job_id
-- having
-- 	avg(salary)>10000
-- order by
-- 	avg(salary) desc; 


#============================================================================
#============================================================================
#use girls;
#!连接查询 
/*
含义：多表查询，当我们要查询的字段来自于多个表
笛卡尔乘积现象：表1有m行，表2有n行，结果m*n行  

分类： 
	按年代分
		SQL192
		SQL199：支持内连接+外连接（左外和右外）+交叉连接 
    按功能分 
		内连接：
			等值连接
            非等值连接 
			自连接 
		外连接 
			左外连接 
			右外连接 
            全外连接 
		交叉连接 
*/

#-------------
#一 !SQL92标准
/*
多表连接的结果为多表的交集部分 
n表连接，至少需要n-1个连接条件 

*/

#.一等值连接 
#案例1 查询女神对应的男神名
-- select 
-- 	NAME,boyName 
-- from 
-- 	boys,beauty
-- where 
-- 	beauty.boyfriend_id = boys.id; 
 
#案例2 ：查询员工名和对应的部门名 
-- select
-- 	last_name,department_name
-- from
-- 	employees,departments
-- where
-- 	employees.department_id = departments.department_id;

#2为表起别名 
/*
提高语句简介度 
注意：查询的字段是别名 
*/
#查询员工名，工种号，工种名 
-- select
-- 	last_name,e.job_id,job_title
-- from
-- 	employees as e,jobs j 
-- where
-- 	e.job_id = j.job_id;

#3.两个表的顺序可以调换 

#4.可以加筛选 
#案例：查询有奖金的员工名部门名
-- select
-- 	last_name,department_name
-- from
-- 	employees e,departments d
-- where
-- 	e.department_id = d.department_id
-- and
-- 	e.commission_pct is not null;

#案例2：查询我们的城市中第二个字符为‘o’的部门名和城市名 
-- select
-- 	department_name,city
-- from
-- 	departments d,locations l
-- where
-- 	d.location_id = l.location_id
-- and
-- 	city like '_o%';

#5.可以加分组 
#案例1：查询每个城市的部门个数 
-- select
-- 	count(*),city
-- from
-- 	departments d,locations l 
-- where
-- 	d.location_id = l.location_id
-- group by
-- 	city;

#案例2：查询出有奖金每个部门的部门名和部门的领导编号和该部门的最低工资 
-- select
-- 	department_name,d.manager_id,min(salary)
-- from
-- 	departments d,employees e
-- where
-- 	d.department_id = e.department_id
-- and 
-- 	commission_pct is not null
-- group by
-- 	department_name,d.manager_id;

#6.可以加排序 
#案例：查询每个工种的工种名和员工的个数，并按员工的个数降序 
-- select
-- 	job_title,count(*)
-- from
-- 	employees e,jobs j
-- where
-- 	e.job_id = j.job_id
-- group by
-- 	job_title
-- order by
-- 	count(*) desc;

#7.可以三表连接
#案例：查询员工名部门名和所在的城市
-- select
-- 	last_name,department_name,city
-- from
-- 	employees e,departments d,locations l 
-- where
-- 	e.department_id = d.department_id 
-- and
-- 	d.location_id = l.location_id
-- and 
-- 	city like '%s%'
-- order by
-- 	department_name desc;

#二 非等值连接 
#案例1：查询员工的工资和工资级别 
#添加新表 
-- CREATE TABLE job_grades
-- (grade_level VARCHAR(3),
--  lowest_sal  int,
--  highest_sal int);

-- INSERT INTO job_grades
-- VALUES ('A', 1000, 2999);

-- INSERT INTO job_grades
-- VALUES ('B', 3000, 5999);

-- INSERT INTO job_grades
-- VALUES('C', 6000, 9999);

-- INSERT INTO job_grades
-- VALUES('D', 10000, 14999);

-- INSERT INTO job_grades
-- VALUES('E', 15000, 24999);

-- INSERT INTO job_grades
-- VALUES('F', 25000, 40000);

-- select 
-- 	salary,grade_level
-- from
-- 	employees e,job_grades j
-- where
-- 	e.salary between j.lowest_sal and j.highest_sal
-- and 
-- 	j.grade_level='A';

#三 自连接 
#案例：查询员工名和上级的名字 
-- select
-- 	e.employee_id,e.last_name,e.manager_id,m.employee_id,m.last_name
-- from
-- 	employees e,employees m
-- where
-- 	e.manager_id = m.employee_id;

#-------------
#二 !SQL99标准 
/*
语法 
	select 查询列表 
    from 表1 别名 【连接类型】
    join 表2 别名 on 连接条件
    where 筛选条件 

内连接（）inner 
外连接
	左外 left [outer]
    右外 right [outer]
    全外 full [outer]
交叉连接
	cross
*/
	
#(1)内连接 
/*
select 查询列表 
from 表1 别名 
inner join 表2 别名
on 连接条件 

特点：
	可以添加排序 分组 筛选
    inner 可以省略
    筛选条件在where 连接条件在on
    inner join 连接和SQL92语法中等值连接效果一样
*/
#案例1：查询员工名 部门名 （调换位子） 
-- select
-- 	last_name ,department_name
-- from
-- 	employees e
-- inner join 
-- 	departments d
-- on
-- 	e.department_id = d.department_id;

#案例2：查询名字中包含e的员工名和工种名 
-- select
-- 	last_name,job_title
-- from
-- 	employees e
-- inner join 
-- 	jobs j
-- where
-- 	last_name like '%e%';
    
#案例3：查询部门个数>3的城市名和部门个数，（分组+筛选） 
-- select 
-- 	count(*),city
-- from
-- 	locations l
-- inner join
-- 	departments d 
-- on
-- 	l.location_id = d.location_id
-- group by
-- 	city
-- having
-- 	count(*)>3;

#案例4：查询每个部门的员工个数>3部门名和员工个数，并按个数排序 
-- select
-- 	count(*),department_name
-- from
-- 	employees e
-- inner join
-- 	departments d
-- on
-- 	e.department_id = d.department_id
-- group by
-- 	department_name
-- having
-- 	count(*)>3
-- order by
-- 	count(*);

#案例5：查询员工名 部门名 工种名 并按部门名降序 
-- select
-- 	last_name,department_name,job_title
-- from
-- 	employees e
-- inner join
-- 	departments d on e.department_id = d.department_id
-- join
-- 	jobs j on e.job_id = j.job_id
-- order by
-- 	department_name desc;

#2.非等值连接 
#查询员工的工资级别 
-- select 
-- 	salary,grade_level
-- from
-- 	employees
-- inner join
-- 	job_grades g
-- on 
-- 	salary between g.lowest_sal and highest_sal; 
    
#查询每个工资级别的个数并且按工资级别降序 
-- select 
-- 	count(*),grade_level
-- from
-- 	employees
-- inner join
-- 	job_grades g
-- on 
-- 	salary between g.lowest_sal and highest_sal
-- group by
-- 	grade_level
-- order by
-- 	grade_level;

#3.自连接 
#查询姓名中包含k员工的名字上级的名字 
-- select
-- 	e.last_name,m.last_name
-- from
-- 	employees e
-- inner join
-- 	employees m 
-- on 
-- 	e.manager_id = m.employee_id
-- where
--     e.last_name like '%k%';

#(2)外连接
/*
查询一个表中有另一个表中没有的

特点：
	外连接的查询结果为主表中的所有记录
    如果主表中有匹配的则显示匹配的值
    如果主表中没有相匹配的，则显示null
    外连接查询结果=内连接
    
    左外连接 left join左边的是主表 
    右外连接 right join右边的是主表
    
    左外和右外交换两个表的顺序可以实现同样的效果
    
    全外连接相当于内连接中表1有表2没有+表1没有表2有
*/
#引入：没有男朋友的女神名
#左外连接   
-- select b.name,bo.*
-- from beauty b
-- left outer join boys bo
-- on b.boyfriend_id = bo.id
-- where bo.id is null;
#右外连接 
-- select b.name,bo.*
-- from boys bo
-- right outer join beauty b
-- on b.boyfriend_id = bo.id
-- where bo.id is null;

#案例1：查询哪个部门没有员工 
-- select
-- 	d.department_name
-- from
-- 	departments d
-- left outer join 
-- 	employees e
-- on d.department_id = e.department_id
-- where e.employee_id is null;

#（3）全外连接 MySql不支持 
#full outer join 

#（4）交叉连接 =92的直接连 
-- select b.*,bo.*
-- from
-- 	beauty b
-- cross join
-- 	boys bo

#============================================================================
#============================================================================
#!子查询 
/*
含义： 
	出现再其他语句中的select语句就是子查询，又称为内查询 
外部的查询语句：
	主查询或外查询
分类： 
	出现的位子：
		select 后面
			仅仅支持标量子查询 
		from 后面 
			支持表子查询 
        where 或 having 后面（※）
			标量子查询 
            列子查询 
            行子查询 
        exists后面（相关子查询）
			表子查询 
	按功能：
		标量子查询（结果集只有一行一列）
        列子查询（结果只有一列多行)
        行子查询 (结果可以有多行多列)
        表子查询（结果集任意 一般为多行多列） 
        
特点：
	子查询都放在小括号内
    子查询一般放在条件的右侧 
    标量子查询，一般搭配单行操作符使用  > < >= <= = <>
    
    列子查询一般搭配这多行操作符使用 
    in any/some all
    
    子查询的执行优先于主查询 
*/

#一 where或having后面

#-------------------------
#1.标量子查询（单行子查询）
#案例1：谁的工资比Able高？
#查询Abel的工资 
-- select 
-- 	salary
-- from 
-- 	emoployees
-- where
-- 	last_name = 'Abel';

-- select *
-- from employees
-- where salary > (
-- 	select 
-- 		salary
-- 	from 
-- 		employees
-- 	where
-- 		last_name = 'Abel'
-- 	);

#案例2：查询job_id与141号员工相同 salary比143号员工多的员工 姓名，job_id和工资
-- select
-- 	last_name,job_id,salary
-- from
-- 	employees
-- where
-- 	salary > (
-- 		select
-- 			salary 
-- 		from
-- 			employees
-- 		where
-- 			employee_id = 143
--     )
-- and
-- 	job_id = (
-- 		select job_id
--         from employees
--         where employee_id = 141
--     )

#案例3：返回公司工资最少的员工姓名，工种名，薪水
-- select 
-- 	last_name,job_id,salary
-- from
-- 	employees
-- where
-- 	salary = (
-- 		select 
-- 			min(salary)
-- 		from
-- 			employees
--     );

#案例4：查询最低工资大于50号部门最低工资的部门ID和最低工资 
-- select
-- 	min(salary),department_id
-- from
-- 	employees
-- group by
-- 	department_id 
-- having
-- 	min(salary)>(
-- 		select min(salary)
--         from employees
--         where department_id = 50
--     );

#2.列子查询（多行子查询） 
#案例1：返回location_id是1400或1700部门中的所有员工姓名 
-- select last_name 
-- from employees
-- where department_id in (
-- 	select distinct 
-- 		department_id
-- 	from
-- 		departments
-- 	where
-- 		location_id in (1400 , 1700)
-- 	);

#案例2：返回其他部门中比job_id为‘IT_PROG’部门任一工资低的员工的：工号，姓名，job_id以及salary
-- select 
-- 	last_name, job_id,salary
-- from
-- 	employees
-- where
-- 	salary < any( 
-- 		select
-- 			salary
-- 		from
-- 			employees
-- 		where
-- 			job_id = 'IT_PROG'
--     )
-- and job_id <> 'IT_PROG';
	
#案例3：返回其他部门中比job_id为‘IT_PROG’部门所有工资低的员工的：工号，姓名，job_id以及salary
-- select 
-- 	last_name, job_id,salary
-- from
-- 	employees
-- where
-- 	salary < all( 
-- 		select
-- 			salary
-- 		from
-- 			employees
-- 		where
-- 			job_id = 'IT_PROG'
--     )
-- and job_id <> 'IT_PROG';

#3.行子查询（一行多列或者多列多行）
#案例1：查询员工编号最小并且工资最高的员工信息 
-- select *
-- from employees
-- where employee_id = (
-- 	select min(employee_id)
-- 	from employees
-- )
-- and salary = (
-- 	select max(salary)
-- 	from employees
-- );
#行子查询 
-- select *
-- from employees
-- where (employee_id , salary) = (
-- 	select min(employee_id), max(salary)
--     from employees
-- ) 

#二 放在select后面
#案例查询每个部门的员工个数 
-- select
-- 	d.*, (
-- 		select count(*) 
--         from employees e
--         where  e.department_id = d.department_id)
-- from
-- 	departments d;

#案例2：查询员工号=102部门名
-- select
-- 	(select department_name 
--     from departments d
--     inner join employees e
--     on d.department_id = e.department_id
--     where e.employee_id = 102);

#三 from后面
/*
将子查询结果充当一张表，必须起别名
*/ 
#案例：查询每个部门的平均工资的工资等级 
-- select
-- 	avg(salary),department_id 
-- from
-- 	employees
-- group by
-- 	department_id;

-- select
-- 	ag_dep.* , g.grade_level
-- from (
-- 	select
-- 		avg(salary) as ag,department_id 
-- 	from
-- 		employees
-- 	group by
-- 		department_id
-- ) ag_dep
-- inner join 
-- 	job_grades g
-- on 
-- 	ag_dep.ag between lowest_sal and highest_sal;

#四 exists后面（相关子查询）
/*
exists(完整的查询语句）
结果：
1或0
*/
-- select exists(select employee_id from employees);#返回boolean型 

#案例1：查询有员工的 部门名 

-- select department_name
-- from departments d 
-- where d.department_id in(
-- 	select department_id
--     from employees e
-- );

-- select department_name
-- from departments d
-- where exists(
-- 	select *
--     from employees e
--     where d.department_id = e.department_id
-- );

#案例2：查询没女朋友的男神信息
-- select 
-- 	bo.*
-- from 
-- 	boys bo 
-- where bo.id  not in (
-- 	select boyfriend_id
--     from beauty
-- );

-- select
-- 	bo.*
-- from
-- 	boys bo 
-- where not exists(
-- 	select boyfriend_id
--     from beauty b
--     where bo.id = b.boyfriend_id
-- )

#============================================================================
#============================================================================
#！分页查询 
/*
应用场景：当要显示的数据一页显示不全，需要分页提交sql请求 
语法：
	select 查询列表 
    from 表 
    [join type]
	on 连接条件 
    where 筛选条件 
    group by 分组字段 
    having 分组后的筛选 
    order by 排序的字段 
    limit offset，size；
    
    offset要显示条目的启示索引（起始索引从0开始）
    
    size 要显示的条目个数  
    
特点：
	limit放在语句最后面
	select 查询列表 
    from 表 
    limit (page-1)*size , size;
    size = 10 
    page 
	1 0
    2 10
    3 20
	

*/
#案例1：擦洗前五条的员工信息 
-- select * from employees limit 5;

#案例2：查询11条到第25条 
-- select * from employees limit 10,15;

#案例3：有奖金的员工的员工信息，并且工资较高的前10
-- select * 
-- from employees
-- where commission_pct is not null
-- order by salary desc
-- limit 10; 

#============================================================================
#============================================================================

#!联合查询
/*
union 联合 合并：将多条查询语句的结果合并成一个结果 
语法：
	查询语句1
    union
    查询与君2
    union
    ····
    
特点：
    查询的结果来自于多个表，多个表没直接联系的关系 
	多条查询语句的查询列数是一致的 
    要求多条查询语句查询的每一列的类型和顺序一致 
    union关键字默认去重，如果使用union all可以包含重复项 
    
*/

#案例：查询部门编号>90或者邮箱中包含A的员工信息 
-- select *
-- from employees
-- where email like '%a%'
-- union
-- select *
-- from employees
-- where department_id >90

