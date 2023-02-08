% 多元非线性拟合 例8
clc,clear;
load ch07_book_eg8_data.mat

x=data(:,3:5);
y=data(:,2);
% 1.回归系数的初值，人工设置
beta=[0.1,0.05,0.02,1,2]'

% 2.使用非线性拟合
[betahat,r,j]=nlinfit(x,y,@my_regression,beta);
betaci=nlparci(betahat,r,'jacobian',j);
% 回归系数及其置信区间
betaa=[betahat,betaci];
% y的预测值，置信区间半径
[yhat,delta]=nlpredci(@my_regression,x,betahat,r,'jacobian',j)

% 3.用工具画图，导出可传出统计参数
nlintool(x,y,'my_regression',beta)