% 线性规划方程解法
% [x,fval]=linprog(c,A,b,Aeq,beq,lb,ub,x0)
% c目标系数，A小于号系数，b小于号右侧，Aeq等于号系数，beq等于号右侧，lb下界，ub上界，x0起始值
% 所求fval是最小值。最大值，加负号即可。

% eg1
c=[-5 -4 -6]'
A=[1 -1 1;3 2 4;3 2 0];
b=[20 42 30]';
lb=[0 0 0]';
[x fval]=linprog(c,A,b,[],[],lb)
% [0;15;3] fval=-78

% eg2
c=[0.04;0.15;0.1;0.125];
A=[-0.03 -0.3 0 -0.15;0.14 0 0 0.07];
b=[-32 42]';
Aeq=[0.05 0 0.2 0.1];
beq=[24];
lb=[0 0 0 0];
[x fval]=linprog(c,A,b,Aeq,beq,lb)
% [0;106.67;120;0] fval=28

% eg3
c=[2 3 -5]';
A=[-2 -5 1;1 3 1];
b=[-10 12]'
Aeq=[1 1 1];
beq=[7];
lb=[0 0 0];
[x fval]=linprog(c,A,b,Aeq,beq,lb)
fval=-fval
% [0.67;2.5;3.83] fval=10.33
