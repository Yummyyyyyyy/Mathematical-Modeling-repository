% 导入数据
% load Homework/ch2_eg_data.mat

[n,m]=size(X);

% 1.判断是否有权重
% disp('With weight or not?(Y/N)');
% with_weight=input('');

% 2.正向化
% 2.1 正向化条件
pos=input('please enter the columns which need operations:');
disp('1:极小型，2:中间型，3:区间型')
type=input('please enter the type of original data:')
% 2.2 正向化操作
for i=1:size(pos,2)
    X(:,pos(i))=Positivization(X(:,pos(i)),type(i),pos(i));
end
% 2.3 正向化完成
disp('After positivization:');
disp(X);

size(X)
% 3.标准化
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
disp('标准化矩阵 Z = ')
disp(Z)

% 4.计算距离、分值
D_plus=sum([(Z-repmat(max(Z),n,1)).^2],2).^0.5;
D_minus=sum([(Z-repmat(min(Z),n,1)).^2],2).^0.5;
score=D_minus./(D_plus+D_minus);
disp('Score:');
standard_score=score/sum(score);
[sorted_socre,index]=sort(standard_score,'descend')



