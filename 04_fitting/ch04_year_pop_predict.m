% 使用函数拟合
[fitresult, gof] = ch04_year_population_fit_f(year, population)

% 利用拟合的数据，进行预测
t=2001:2030;
r=0.02735;
xm=342.4;
predictions=xm./(1+(xm./3.9-1).*exp(-r.*(t-1790)));
figure(2);
predictions
plot(year,population,'o',t,predictions,'.')