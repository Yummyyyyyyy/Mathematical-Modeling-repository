load ch05_eg_data.mat

% 1.统计描述
Min_=min(Test);
Max_=max(Test);
Average_=mean(Test);
Median_=median(Test);
Skewness_=skewness(Test);
Kurtosis_=kurtosis(Test);
Std_=std(Test);

% 2.0 做散点图判断是否线性
scatter(Test(:,1),Test(:,2))

% 2.相关系数
corelation_coefficient=corrcoef(Test);

% 3.假设检验
% 使用t分布
x=-4:0.1:4;
y=tpdf(x,28);
figure(2)
plot(x,y,'-');
grid on
hold on
% 
tinv(0.975,28)