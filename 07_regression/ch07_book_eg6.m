% 建立回归方程综合例6

clc,clear
load ch07_book_eg6_data.mat

x=data(:,1:3);
y=data(:,4);
k=0:0.01:0.1;
b1=ridge(y,x,k,0)
yhat=repmat(b1(1,:),[11,1])+x*b1(2:4,:);
% 残差平方和
Q=(dist(y',yhat)).^2;
% 画岭迹图
plot(k,b1(2:4,:)')
legend('x1','x2','x3')
% 发现0.04时是最佳的，故使用第四列参数