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
	
#1.内连接 
/*
select 查询列表 
from 表1 别名 
inner join 表2 别名
on 连接条件 
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

    

    
