#流程控制结构
/*
顺序结构:程序从从上往下依次执行 
分支结构:程序从两条或多条路径中选择一条去执行
循环结构:程序再满足一定条件的基础上,重复执行一段代码

*/

#一 分支结构 
#1.if函数 
/*
功能:
	实现简单的双分支
语法:
	select if(表达式1,表达式2,表达式3)
执行顺序:
	如果表达式1成立,则if函数返回表达式2的值,否则返回表达式3的值 

应用:任何地方
*/  

#2.case结构
/*
情况1.类似java中的switch语句,一般用于实现等值判断
语法:
	case 变量|表达式|字段 
    when 要判断的值 then 返回的值1或语句1;
    when 要判断的值 then 返回的值2或语句2;
    ```
    else 要返回的值n或语句n;
    end case;
    
情况2:类似java中的多重if语句,一般用于实现区间判断
语法:
	case 变量|表达式|字段 
    when 要判断的值 then 返回的值1或语句1;
    when 要判断的值 then 返回的值2或语句2;
    ```
    else 要返回的值n或语句n;
    end case;
    
特点: 
	既可以作为表达式,嵌套在其他语句中使用,可以放在任何地方,begin end中或begin end外 
    作为独立语句使用,只能放在begin end中
    如果要when中的值满足或条件成立,则执行对应then后面的语句,并结束case,如果都不满足则执行else中的语句或值
    
*/

#创建存储过程,根据传入的成绩,显示等级,比如传入的成绩在90-100,显示A
delimiter $
drop procedure test_case;
create procedure test_case(in score int)
begin
	case 
		when score >=90 and score <=100 then select 'A';
		when score >=80 and score <=90  then select 'B';
        else select 'C';
	end case;
end $
call test_case(85)$

#3.if结构 
/*
功能:
	实现多重分支 
语法:
	if 	   条件1 then 语句1;
    elseif 条件2 then 语句2;
    ```
    else 语句n
    endif;
特点:
	只能放在begin end中 
*/

#案例1:创建存储过程,根据传入的成绩,显示等级,比如传入的成绩在90-100,返回级别 
set global log_bin_trust_function_creators=1$
create function test_if(score int)returns char(1)
begin
	if score >= 90 and score <=100 then return 'A';
    elseif score >=80 then return 'B';
    end if;
end $
select test_if(86)$

#二 循环结构
/*
分类:
	while loop repeat
循环控制:
	iterate类似于continue 结束本次循环继续下一次 
    leave 类似于 break 结束当前所在的循环 
*/

#1.while
/*
语法:
	[标签]:
		while 循环条件 do 
			循环体;
		end while 
    [标签];
*/

#2.loop
/*
语法:
	[标签]:
		loop  
			循环体;
		end loop
    [标签];
*/

#3.repeat
/*
语法:
	[标签]:
		repeat  
			循环体;
		until 结束循环的条件
        end repeat
    [标签];	
*/