% 最小二乘法拟合数据
load ch4_eg_data1
plot(x,y,'o');
xlabel('x');
ylabel('y');
n=size(x,1);  %求样本个数
k=(n*sum(x.*y)-sum(y)*sum(x))/(n*sum(x.*x)-sum(x)*sum(x))
b=((sum(x.*x)*sum(y))-(sum(x)*sum(x.*y)))/(n*sum(x.*x)-sum(x)*sum(x))
hold on
grid on

%匿名函数：声明自变量x,用计算出的k、b画函数图像
f=@(x)k*x+b;
fplot(f,[2.5,7]);

% 计算R^2
y_hat=k*x+b;
SSR=sum((y_hat-mean(y)).^2);
SSE=sum((y-y_hat).^2)
SST=sum((y-mean(y)).^2);
SST-SSE-SSR  %约等于0
R_2=SSR/SST  %越接近1越准确

[fitresult, gof] = ch4_createFit(x, y)