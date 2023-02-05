function [fitresult, gof] = createFit(year, population)
%CREATEFIT(YEAR,POPULATION)
%  创建一个拟合。
%
%  要进行 'population_predict' 拟合的数据:
%      X 输入: year
%      Y 输出: population
%  输出:
%      fitresult: 表示拟合的拟合对象。
%      gof: 带有拟合优度信息的结构体。
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 03-Feb-2023 14:50:09 自动生成


%% 拟合: 'population_predict'。
[xData, yData] = prepareCurveData( year, population );

% 设置 fittype 和选项。
ft = fittype( 'xm/(1+(xm/3.9-1)*exp(-r*(t-1790)))', 'independent', 't', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.106652770180584 100];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', 'population_predict' );
h = plot( fitresult, xData, yData );
legend( h, 'population vs. year', 'population_predict', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'year', 'Interpreter', 'none' );
ylabel( 'population', 'Interpreter', 'none' );
grid on


