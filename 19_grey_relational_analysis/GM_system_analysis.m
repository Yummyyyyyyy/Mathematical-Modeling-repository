clear,clc
load Homework/ch19_eg_data1.mat

% 1.数据预处理
Mean=mean(gdp);
gdp=gdp./repmat(Mean,size(gdp,1),1)

% 2.找到子序列、母序列
y=gdp(:,1);
X=gdp(:,2:end);

% 3.计算相关系数
absX0Xi=abs(X-repmat(y,1,size(X,2)))
a=min(min(absX0Xi))
b=max(max(absX0Xi))
r=0.5

% 4.求灰色关联度
relation=(a+r*b)./(absX0Xi+r*b)
disp('gery relation socre:')
disp(mean(relation))