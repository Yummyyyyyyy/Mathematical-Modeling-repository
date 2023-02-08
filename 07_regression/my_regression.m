% ch07_book_eg8的函数，其中yhat的估计方法为题目给出。
function yhat=my_regression(beta,x);
yhat=(beta(4)*x(:,2)-x(:,3)/beta(5))./(1+beta(1)*x(:,1)+...
    beta(2)*x(:,2)+beta(3)*x(:,3));

