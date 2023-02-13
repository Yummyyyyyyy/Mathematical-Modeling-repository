% 最大最小化模型
% [x,fval]=fminimax(@Fun,x0,A,b,Aeg,beg,lb,ub,@nonlfun,ooption)
% max(fval)再求出最大
% Fun目标函数用一个函数向量表示,x0要给出

% eg1
x0=[6,6]; 
lb=[3,4];
ub=[8,10];
[x,feval]=fminimax(@Fun,x0,[],[],[],[],lb,ub);
max(feval)  % 13.5
disp(x)     % x=[8,8.5]

function f=Fun(x)
    a=[1 4 3 5 9 12 6 20 17 8];
    b=[2 10 8 18 1 4 5 10 8 9];
    f=zeros(10,1);  %设置10个函数，分别写入
    for i=1:10
        f(i)= abs(x(1)-a(i)) + abs(x(2)-b(i));
    end
end

