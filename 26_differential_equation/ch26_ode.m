% 求微分方程的数值解


% eg1 最简单的一阶微分方程
% 自变量x，范围[0,2]，初始值y(0)=3
% 1.1 用ode45（非刚性），ode15s（刚性）求解
[x1,y1]=ode45(@ch26_df1,[0,2],3);
[x2,y2]=ode15s(@ch26_df1,[0,2],3);
figure(1)
plot(x1,y1,'r*-',x2,y2,'g*-')
legend('ode45','ode15s')

% 1.2 对比 数值解
hold on
x=0:0.01:2;
y=exp(x)+2*x+2;
plot(x,y,'b-')
legend('typical')

% 1.3 设定相对误差和绝对误差
options=odeset('RelTol',1e-4,'AbsTol',1e-8);
[x3,y3]=ode45(@ch26_df1,[0,2],3,options);

% 1.4 指定要求解的位置
[x,y]=ode45(@ch26_df1,[0:0.001:2],3,options);


% eg2 一阶微分方程组
[x,y]=ode45(@ch26_df2,[0 4*pi],[0 1 1]);
plot(x,y(:,1),'o',x,y(:,2),'*',x,y(:,3),'+')
legend('y1','y2','y3')
axis([0,4*pi,-inf,+inf])


% eg3 没有解析解，ode45也解不出的微分方程
[x,y]=ode15s(@ch26_df3,[0,3000],[2,0]);
plot(x,y(:,1),'*');


function dy=ch26_df3(x,y)
    dy=zeros(2,1);
    dy(1)=y(2);
    dy(2)=1000*(1-y(1)^2)*y(2)-y(1);
end

function dy=ch26_df2(x,y)
    dy=zeros(3,1);
    dy(1)=y(2)*y(3);
    dy(2)=-y(1)*y(3);
    dy(3)=-0.51*y(1)*y(2);
end

function dy=ch26_df1(x,y)
    dy=y-2*x;
end