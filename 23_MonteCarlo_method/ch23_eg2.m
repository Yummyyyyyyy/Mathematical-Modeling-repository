% 蒙特卡罗模拟排队问题

clear
tic
i=1
wait_total=0
end0=0;
customer0=0;
x(1)=exprnd(10);             %x(i)间隔时间
customer(1)=customer0+x(1);  %customer(i)到达时间
begin(1)=customer(1);        %begin(i)业务开始时间

while begin(i)<=480
    y(i)=normrnd(10,2);
    if y(i)<1
        y(i)=1;              %y(i)持续时间
    end
    endtime(i)=begin(i)+y(i);          %endtime(i)结束时间
    wait(i)=begin(i)-customer(i);      %wait(i)等待时间
    wait_total=wait_total+wait(i);
    i=i+1;
    x(i)=exprnd(10);
    customer(i)=customer(i-1)+x(i);
    begin(i)=max(customer(i),endtime(i-1));
end
n=i-1;
average_time=wait_total/n;
disp(['total client number:',num2str(n)])  %50
disp(['average wait time:',num2str(average_time)])  %78
toc
