clear,clc
load ch2_eg_data.mat

% 1.正向化
pos=input('please enter the columns which need operations:');
disp('1:极小型，2:中间型，3:区间型')
type=input('please enter the type of original data:')
for i=1:size(pos,2)
    X(:,pos(i))=Positivization(X(:,pos(i)),type(i),pos(i));
end
disp('After positivization:');
disp(X);

% 2.数据预处理
Mean=mean(X);
Z=X./repmat(Mean,size(X,1),1);

% 3.构造母序列、子序列
y=max(Z,[],2);
X=Z;

% 4.灰色关联度
absX0Xi=abs(X-repmat(y,1,size(X,2)))
a=min(min(absX0Xi))
b=max(max(absX0Xi))
r=0.5
relation=(a+r*b)./(absX0Xi+r*b)

% 5.求权重
weight=mean(relation)/sum(mean(relation));

% 6.计算得分、归一化、排序
score=sum(X.*repmat(weight,size(X,1),1),2);
score_std=score/sum(score);
[socre_std,index]=sort(score_std,'descend');
score_std