% 模拟三门问题
clear,clc;

% 1.只考虑换不换
n=10000;
a=0;
b=0;
for i=1:n
    x=randi([1,3])
    y=randi([1,3])
    if x==y
        a=a+1;
        b=b+0;
    else
        a=a+0;
        b=b+1;
    end
end
disp(['不改变主意时的获奖概率:',num2str(a/n)])   %0.3307
disp(['改变主意时的获奖概率：',num2str(b/n)])    %0.6693

% 2.考虑没有获奖的情况
n = 100000;  
a = 0;  % a表示不改变主意时能赢得汽车的次数
b = 0;  % b表示改变主意时能赢得汽车的次数
c = 0;  % c表示没有获奖的次数
for i= 1 : n  
    x = randi([1,3]);  
    y = randi([1,3]);  
    change = randi([0, 1]); 
    if x == y   
        if change == 0  
        	a = a + 1; 
        else  
            c= c+1;
        end
    else  
         if change == 0  % 不改变主意
        	c = c + 1; 
        else  % 改变了主意
            b= b + 1;
         end
    end
end
disp(['蒙特卡罗方法得到的不改变主意时的获奖概率为：', num2str(a/n)]);  %0.16619
disp(['蒙特卡罗方法得到的改变主意时的获奖概率为：', num2str(b/n)]);   %0.33341
disp(['蒙特卡罗方法得到的没有获奖的概率为：', num2str(c/n)]);        %0.5004
