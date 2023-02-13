% 多目标规划问题
% 给不同指标，定义权重，算出综合的目标函数，再用线性规划求解
% 记得还愿目标函数

% 1.计算规划问题
w1=0.4; w2=0.6;    %x=[5,2] f1=20  f2=2.6
%w1=0.5; w2=0.5;
%w1=0.3; w2=0.7;
c=[w1/30*2+w2/2*0.4 ;w1/30*5+w2/2*0.3];
A=[-1 -1];
b=[-7];
lb=[0 0]';
ub=[5 6]';
[x,fval] = linprog(c,A,b,[],[],lb,ub)
f1=2*x(1)+5*x(2);
f2=0.4*x(1)+0.3*x(2)

% 2.灵敏性分析
W1=0.1:0.001:0.5;
W2=1-W1;
n=length(W1);
F1=zeros(n,1); F2=zeros(n,1);
X1=zeros(n,1); X2=zeros(n,1);
FVAL=zeros(n,1);
A=[-1 -1];  b=[-7];
lb=[0 0];  ub=[5 6];
for i=1:n
    w1=W1(i); w2=W2(i);
    c=[w1/30*2+w2/2*0.4 ;w1/30*5+w2/2*0.3];
    [x,fval] = linprog(c,A,b,[],[],lb,ub)
    F1(i)=2*x(1)+5*x(2);
    F(2)=0.4*x(1)+0.3*x(2)
    X1(i)=x(1);
    X2(i)=x(2);
    FVAL(i)=fval;
end

% 3.灵敏性做图
figure(1)
plot(W1,F1,W1,F2)
xlabel('f1_weight')
ylabel('f1,f2')
legend('f1','f2')

figure(2)
plot(W1,X1,W1,X2)
xlabel('f1_weight')
ylabel('x1,x2')
legend('x1','x2')

figure(3)
plot(W1,FVAL)
xlabel('f1_weight')
ylabel('overall')
legend('overall')

