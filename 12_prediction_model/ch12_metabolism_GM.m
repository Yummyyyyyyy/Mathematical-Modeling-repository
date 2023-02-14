function [result3]=ch12_metabolism_GM(x0,predict_n)
    result3=zeros(predict_n,1);
    for i=1:predict_n
        result3(i)=ch12_traditional_GM(x0,1);
        x0=[x0(2:end);result3(i)];
    end
end