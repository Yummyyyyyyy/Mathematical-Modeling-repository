function [result2]=ch12_new_GM(x0,predict_n)
    result2=zeros(predict_n,1);
    for i=1:predict_n
        result2(i)=ch12_traditional_GM(x0,1);
        x0=[x0;result2(i)];
    end
end