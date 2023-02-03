% PCHIP 分段三次埃尔米特插值法
x=-pi:pi;
y=sin(x);
new_x=-pi:0.1:pi;
p_pchip=pchip(x,y,new_x);
figure(1);
plot(x,y,'o',new_x,p_pchip);

% spline 三次样条插值法
p_spline=spline(x,y,new_x);
figure(2);
plot(x,y,'o',new_x,p_spline,new_x,p_pchip);
legend('样本点','三次样条插值法','三次埃尔米特插值法','Location','southeast');

% interpn n维数据的插值
% 此处可以为多个x，对应一个y，即多维
p_interpn=interpn(x,y,new_x,'spline');
figure(3);
plot(x,y,'o',new_x,p_interpn);

% 插值法作为预测方式
population=[133126,133770,134413,135069,135738,136427,137122,137866,138639, 139538];
year = 2009:2018;
guess_year=2019:2021;
p1=pchip(year,population,guess_year);
p2=spline(year,population,guess_year);
figure(4);
plot(year,population,'o',guess_year,p1,'b*-',guess_year,p2,'r*-')




