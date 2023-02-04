% AHP
% 1.接收判断矩阵
A=input('please enter matrix:');
[n,n]=size(A);
% 2.计算权重
% 2.1 算数平均
Sum_A=sum(A);
Sum_A=repmat(Sum_A,n,1);
Sum_A_ave=A./Sum_A;
Sum_A_weight=sum(Sum_A_ave,2)./n

% 2.2 几何平均
Product_A=prod(A,2)
Product_A_ave=Product_A.^(1/n)
Product_A_weight=Product_A_ave./sum(Product_A_ave)

% 2.3 特征值
[V,D]=eig(A);
max_eig=max(max(D));
[row,col]=find(D==max_eig,1);
Eigen_weight=V(:,col)./sum(V(:,col))

% 3.一致性检验
% 3.1 CI
CI=(max_eig-n)/(n-1);
% 3.2 RI
RI=[0 0.0001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
% 3.3 CR
CR=CI/RI(n);
% 3.4 判断CR
if CR<0.1
    disp('Successful.');
else
    disp('Unsuccessful, please edit Matrix A.');
end

