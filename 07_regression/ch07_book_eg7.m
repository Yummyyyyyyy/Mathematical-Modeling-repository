% 主成分回归求解多元线性回归 例7

clc,clear;
load ch07_book_eg6_data.mat

x0=data(:,1:3); y0=data(:,4);
mu=mean(x0); sig=std(x0);
muy=mean(y0); sigy=std(y0);
x=zscore(x0); y=zscore(y0);
[c,s,t]=pca(x);
% 提取前两个主成分
m=2;
% 主成分回归方程系数
a=s(:,1:m)\y

ab=c(:,1:m)*a
% b即原是变量的回归方程的系数
b=[muy-sigy*(mu./sig)*ab,sigy*ab'./sig]