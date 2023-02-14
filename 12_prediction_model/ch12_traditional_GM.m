% 传统GM(1,1)细节展示
function [result1,x0_hat,relative_residuals,eta]=ch12_traditional_GM(x0,predict_n)
    n=length(x0);
    x1=cumsum(x0);
    z1=(x1(1:end-1)+x1(2:end))/2;
    y=x0(2:end);
    x=z1;
    k = ((n-1)*sum(x.*y)-sum(x)*sum(y))/((n-1)*sum(x.*x)-sum(x)*sum(x));
    b = (sum(x.*x)*sum(y)-sum(x)*sum(x.*y))/((n-1)*sum(x.*x)-sum(x)*sum(x));
    a=-k;
    
    disp('original data:')
    disp(mat2str(x0'))
    disp(strcat('development coefficient:',num2str(-a)));
    disp(strcat('greyaction quantity:',num2str(b)));

    for m=1:n-1
        x0_hat(m+1) = (1-exp(a))*(x0(1)-b/a)*exp(-a*m);
    end
    result1=zeros(predict_n,1);
    for i=1:predict_n
        result1(i) = (1-exp(a))*(x0(1)-b/a)*exp(-a*(n+i-1));
    end

    absolute_residuals=x0(2:end)-x0_hat(2:end);
    relative_residuals=abs(absolute_residuals./x0(2:end));
    class_ratio=x0(2:end)./x0(1:end-1);
    eta=abs(1-(1-0.5*a)/(1+0.5*a)*(1./class_ratio));
end
