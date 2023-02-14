% 蒙特卡罗模拟有约束条件的非线性规划
clear,clc
tic

n=10000000;
% unifrnd,生成20，30之间均匀分布的随机数组，n行1列
x1=unifrnd(20,30,n,1);
x2=x1-10;
x3=unifrnd(-10,16,n,1);
fmax=-inf;
for i=1:n
    x=[x1(i),x2(i),x3(i)];
    if (-x(1)+2*x(2)+2*x(3)>=0)&(x(1)+2*x(2)+2*x(3)<=72)
        result=x(1)*x(2)*x(3);
        if result>fmax
            fmax=result;
            X=x;
        end
    end
end
disp(strcat('Maximum:',num2str(fmax))) %3445.4538
disp('X:')     %   22.5841   12.5841   12.1233
disp(X)
toc

%后续可以根据答案，缩小x1，x3的范围，得到更准确的答案