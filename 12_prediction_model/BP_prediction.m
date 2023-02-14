% BP神经网络进行预测

load ch12_BP_data.mat
% 1.进入神经网络拟合工具箱拟合，导出结果result
% 2.生成net对象，用sim函数预测
net=result.Network;
sim(net,new_X(1,:)')
% 3.预测下面的十个值
predict_y=zeros(10,1);
for i=1:10
    result=sim(net,new_X(i,:)');
    predict_y(i)=result;
end
disp('predictions:')
disp(predict_y)