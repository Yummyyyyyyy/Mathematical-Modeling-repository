% 正向化函数
function [pos_x]=Positivization(x,type,i)
    % 1.极小型->极大型
    if type==1
        pos_x=max(x)-x;
    % 2.中间型->极大型
    elseif type==2
        mid=input('please enter middle:');
        temp=max(abs(x-mid));
        pos_x=1-abs(x-mid)/temp;
    % 3.区间型->极大型
    elseif type==3
        low_bound=input('please enter low bound:')
        high_bound=input('please enter high bound:')
        row=size(x,1);
        temp=max([low_bound-min(x),max(x)-high_bound]);
        pos_x=zeros(row,1);
        for i=1:row
            if x(i)<low_bound
                pos_x(i)=1-(low_bound-x(i))/temp;
            elseif x(i)>high_bound
                pos_x(i)=1-(x(i)-high_bound)/temp;
            else
                pos_x(i)=1;
            end
        end
    else
        disp('error!')
    end
end
        