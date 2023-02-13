% 非线性规划方程解法
% [x,fval]=fmincon(@fun,x0,A,b,Aqe,bqe,lb,ub,@nonlfun,option)
% x0初始值必填，@fun目标函数的表示，@nonlfun非线性约束的函数。函数表示
% 其中c是c(x)<=0,ceq是ceq(x)=0

% % eg1
% x0=[0 0];
% A1=[-2 3];
% b1=[6];
% [x,fval1]=fmincon(@NP_fun1,x0,A1,b1,[],[],[],[],@NP_nonlfun1)
% fval1=-fval1;
% % x=[1 0],fval1=1


% eg2
% 1.用蒙特卡罗方法找初始值
n=1000000;
x1=unifrnd(0,2,n,1);
x2=sqrt(2-x1);
x3=sqrt((3-x2)/2);
fmin=+inf;
for i=1:n
    x=[x1(i),x2(i),x3(i)];
    if (x(1)^2-x(2)+x(3)^2>=0) & (x(1)+x(2)^2+x(3)<=20)
        result=x(1)^2+x(2)^2+x(3)^2+8;
        if result<fmin
            fmin=result;
            xfirst=x;
        end
    end
end
disp('simulation x0:');
disp(xfirst)
% 2.使用fmincon求解非线性规划方程
lb=[0 0 0];
[x,fval2]=fmincon(@NP_fun2,xfirst,[],[],[],[],lb,[],@NP_nonlfun2)
% x=[0.3455 0.8090 1.0467], fval2=0.8694

% 3.编写非线形部分函数
function f=NP_fun2(x)
    f=x(1)^2+x(2)^2+x(3)^2+8
end
function [c,ceq]=NP_nonlfun2(x)
    c=[-x(1)^2+x(2)-x(3)^2;
        x(1)+x(2)^2+x(3)-20];
    ceq=[-x(1)-x(2)^2+1;
        x(2)+2*x(3)^2-3]
end

function f=NP_fun1(x)
    f=-x(1)^2-x(2)^2+x(1)*x(2)+2*x(1)+5*x(2);
end
function [c,ceq]=NP_nonlfun1(x)
    c=[x(1)^2-2*x(1)+1-x(2)]
    ceq=[]
end





