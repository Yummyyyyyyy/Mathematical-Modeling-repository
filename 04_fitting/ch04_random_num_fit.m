% 生成随机数，对随机数据进行模拟
% rand(row,column):0,1之间均匀的随机数，几行几列
% randi(max,row,column)max:区间/最大值，几行几列
% normrnd(mu,sigma,row,column) 正态分布随机数，0，1，几行几列
x=rand(30,1)*10;
% 加扰动数
y=3*exp(0.5*x)-5+normrnd(0,1,30,1);
cftool

% roundn 任意位置四舍五入
% roundn(4.5,0)=5