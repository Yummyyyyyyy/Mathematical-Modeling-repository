function [fitresult, gof] = createFit(x, y)
%CREATEFIT(X,Y)
%  创建一个拟合。
%
%  要进行 '1' 拟合的数据:
%      X 输入: x
%      Y 输出: y
%  输出:
%      fitresult: 表示拟合的拟合对象。
%      gof: 带有拟合优度信息的结构体。
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 03-Feb-2023 14:34:23 自动生成


%% 拟合: '1'。
[xData, yData] = prepareCurveData( x, y );

% 设置 fittype 和选项。
ft = fittype( 'poly1' );

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft );

% 绘制数据拟合图。
figure( 'Name', '1' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x', '1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on


