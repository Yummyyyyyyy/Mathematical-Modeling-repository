% 整数规划问题
% [x,fval]=intlinprog(c,intcon,A,b,Aeq,beq,lb,ub)
% 无需指定初始值，加入intcon参数决定哪些变量是整数，若为[1,2]即前两个变量是整数

% eg1
c1=[-20,-10]';
intcon1=[1,2];
A1=[5 4;2 5];
b1=[24;13];
lb1=[0 0];
[x1,fval1]=intlinprog(c1,intcon1,A1,b1,[],[],lb1);
fval1=-fval1;
disp(x1);      %x=[4,1]
disp(fval1);   %90

% eg2
c2=[18 23 5]';
A2=[107 500 0;72 121 65;-107 -500 0;-72 -121 -65];
b2=[50000;2250;-500;-2000];
lb2=[0 0 0]
intcon2=[3];
[x2,fval2]=intlinprog(c2,intcon2,A2,b2,[],[],lb2)
disp(x2)       %x=[0,1,29]
disp(fval2)    %168

% eg3
c3=[-3 -2 -1]';
A3=[1 1 1];
b3=[7];
Aeq3=[4 2 1];
beq3=[12];
lb3=[0 0 0];
ub3=[+inf +inf 1];
intcon3=[3];
[x3,fval3]=intlinprog(c3,intcon3,A3,b3,Aeq3,beq3,lb3,ub3)
disp(x3);       %x=[0 5.5 1]
disp(fval3)     %-12

