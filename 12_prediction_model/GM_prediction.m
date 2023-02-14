% 灰色预测

% 0.数据应均非负，组数应在[4,10]之间
% 1.画时间序列图
 year=[1995:1:2004];
 x0 = [174,179,183,189,207,234,220.5,256,270,285]';  
% year = [2014:2017]';
% x0 = [2.874,3.278,3.337,3.390]';

n=length(x0);
figure(1);
plot(year,x0,'o-');
grid on;
xlabel('year');ylabel('pollution')

% 2.准指数规律检验
% 2.1 一次累加数列x1、光滑度ro
x1=cumsum(x0);
ro=x0(2:end)./x1(1:end-1);
% 2.2 画出光滑度曲线
figure(2);
plot(year(2:end),ro,'o-',[year(2),year(end)],[0.5,0.5],'-');
grid on;
xlabel('year');
ylabel('smoothness');
% 2.3 光滑度<0.5比例展示
disp(strcat('a:smoothness<0.5 accounts for:',num2str(100*sum(ro<0.5)/(n-1)),'%'))
disp(strcat('b:smoothness<0.5,except first two,accounts for:',num2str(100*sum(ro(3:end)<0.5)/(n-3)),'%'))
2.4 判断是否继续
flag=input('whether to go on? (1/0)')

% 3.GM(1,1)模型
if flag==1
% 3.1 组数等于4
    if n==4
        % 3.1.1 接收预测数量
        predict_n=input('please enter prediction counts:');

        % 3.1.2 三种预测
        disp('traditional GM(1,1):')
        [result1,x0_hat,relative_residuals,eta]=ch12_traditional_GM(x0,predict_n);
        disp('new GM(1,1):')
        result2=ch12_new_GM(x0,predict_n);
        disp('metabolism GM(1,1):')
        result3=ch12_metabolism_GM(x0,predict_n);
        result_final=(result1+result2+result3)/3; %最终预测结果

        % 3.1.3 展示拟合结果
        for i=1:n
            disp(strcat(num2str(year(i)),':',num2str(x0_hat(i))))
        end

        % 3.1.4 展示预测结果
        disp('traditional GM(1,1) predictions:')
        for i=1:predict_n
            disp(strcat(num2str(year(end)+i),':',num2str(result1(i))))
        end
        disp('new info GM(1,1) predictions:')
        for i=1:predict_n
            disp(strcat(num2str(year(end)+i),':',num2str(result2(i))))
        end
        disp('metabolism GM(1,1) predictions:')
        for i=1:predict_n
            disp(strcat(num2str(year(end)+i),':',num2str(result3(i))))
        end
        disp('average predictions:') %最终预测结果
        for i=1:predict_n
            disp(strcat(num2str(year(end)+i),':',num2str(result_final(i))))
        end
    else

% 3.2 组数大于4
        % 3.2.1 分割训练集、测试集
        if n>7
            test_n=3;
        else
            test_n=2;
        end
        train_x0=x0(1:end-test_n);
        test_x0=x0(end-test_n+1:end);
        test_year=year(end-test_n+1:end);

        % 3.2.2 三种预测
        disp('traditional GM(1,1):')
        result1=ch12_traditional_GM(train_x0,test_n);
        disp('new GM(1,1):')
        result2=ch12_new_GM(train_x0,test_n);
        disp('metabolism GM(1,1):')
        result3=ch12_metabolism_GM(train_x0,test_n);

        % 3.2.3 可视化预测结果
        figure(3)
        plot(test_year,test_x0,'o-',test_year,result1,'-',test_year,result2,'-',test_year,result3,'-');
        grid on;
        legend('true value','traditional GM','new info GM','metabolism GM');
        xlabel('year');
        ylabel('pollution');

        % 3.2.4 计算SSE、选择方案
        SSE1=sum((test_x0-result1).^2);
        SSE2=sum((test_x0-result2).^2);
        SSE3=sum((test_x0-result3).^2);
        disp(strcat('SSE of traditional GM:',num2str(SSE1)))
        disp(strcat('SSE of new info GM:',num2str(SSE2)))
        disp(strcat('SSE of metabolism GM:',num2str(SSE3)))
        if SSE1<SSE2
            if SSE1<SSE3
                choose=1;
            else
                choose=3;
            end
        elseif SSE2<SSE3
            choose=2;
        else
            choose=3;
        end
        disp(strcat('our choice:',num2str(choose)))

        % 3.2.5 使用选择模型预测
        predict_n=input('please enter predict numbers:');
        [result,x0_hat,relative_residuals,eta]=ch12_traditional_GM(x0,predict_n);
        if choose==2
            result=ch12_new_GM(x0,predict_n);
        end
        if choose==3
            result=ch12_metabolism_GM(x0,predict_n);
        end

        % 3.2.6 展示预测结果
        disp('final prediction:') %最终预测结果
        for i=1:predict_n
            disp(strcat(num2str(year(end)+i),':',num2str(result(i))))
        end
    end

    % 4.绘制相对残差、级比偏差图
    figure(4)
    subplot(1,2,1)
    plot(year(2:end),relative_residuals,'*-');
    grid on;
    legend('relative_residuals');
    xlabel('year');
    subplot(1,2,2)
    plot(year(2:end),eta,'o-');
    grid on;
    legend('eta');
    xlabel('year');

    % 5.评价拟合结果
    % 5.1 相对残差检验
    average_relative_residuals=mean(relative_residuals);
    disp(strcat('average relative_residuals:',num2str(average_relative_residuals)))
    if average_relative_residuals<0.1
        disp('average relative_residuals: excellent')
    elseif average_relative_residuals<0.2
        disp('average relative_residuals: acceptable')
    else
        disp('average relative_residuals: unacceptable')
    end

    % 5.2 级比偏差检验
    average_eta = mean(eta);   % 计算平均级比偏差
    disp(strcat('平均级比偏差为',num2str(average_eta)))
    if average_eta<0.1
        disp('average_eta: excellent')
    elseif average_eta<0.2
        disp('average_eta: acceptable')
    else
        disp('average_eta: unacceptable')
    end

    % 6.最终预测时序图
    figure(5)
    plot(year,x0,'-o',year,x0_hat,'-*m',year(end)+1:year(end)+predict_n,result,'-*b')
    grid on
    hold on
    plot([year(end),year(end)+1],[x0(end),result(1)],'-*b')
    legend('original data','fitting data','prediction data')
    xlabel('year')
    ylabel('pollution')
end
        

