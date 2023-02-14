% 求微分方程的解析解

% eg1
syms y(x)
eqn=(y-diff(y,x)==2*x);
dsolve(eqn)

% eg2
syms y(x)
eqn=(y-diff(y,x)==2*x);
cond=(y(0)==3);
dsolve(eqn,cond)

% eg3
syms y(x)
eqn=(diff(y,x,2)+4*diff(y,x)+29*y==0);
Dy=diff(y,x)
cond=[(y(0)==0),(Dy(0)==15)];
dsolve(eqn,cond)

% eg4
syms y(x) y(t) z(t)
eqn1=(diff(x,t)==2*x-3*y+3*z+t);
eqn2=(diff(y,t)==4*x-5*y+3*z+t);
eqn3=(diff(z,t)==4*x-4*y+2*z+t);
eqns=[eqn1,eqn2,eqn3];
[x,y,z]=dsolve(eqns);
mupad
simplify(y)