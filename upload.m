[n,m]=size(X);

% 1.Forward matrix transformation
pos=input('please enter the columns which need operations:');
disp('1:minimum，2:medium，3:range')
type=input('please enter the type of original data:')
for i=1:size(pos,2)
    X(:,pos(i))=Positivization(X(:,pos(i)),type(i),pos(i));
end

% 2.Standarization
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);

% 3.Score calculation
D_plus=sum([(Z-repmat(max(Z),n,1)).^2],2).^0.5;
D_minus=sum([(Z-repmat(min(Z),n,1)).^2],2).^0.5;
score=D_minus./(D_plus+D_minus);
disp('Score:');
standard_score=score/sum(score);
[sorted_socre,index]=sort(standard_score,'descend')


