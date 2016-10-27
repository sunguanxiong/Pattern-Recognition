clear
load TestLabels1.csv
load Testsamples1.csv
load TrainSamples.csv
load Trainlabels.csv
[m, n] = size(TrainSamples);
c = 10;
%初始化w
W = rand(n,c)*0.0001;
%增广数据集和w
TrainSamples = [TrainSamples ones(m,1)];
W = [W;zeros(1,c)];
%计算Loss,规定lamda
%采用mini-batch梯度下降方法 b= 256
lamda = 50000;
b = 256;
lr = 1e-7;
iter = 0;
max_iter = 5000;
threshold = 0.1;
while true
    %计算梯度使用~小批量梯度下降法
    %随机产生数据batch
    selecter = randi([1,m],b,1);
    Data_batch = TrainSamples(selecter,:);
    Label_batch = Trainlabels(selecter);
    [Loss, Delta] = Calculate_loss(Data_batch, Label_batch, W, lamda);
    W = W - lr*Delta;
    if (Loss < threshold || iter > max_iter)
        break;
    else
        iter
        Loss
        iter = iter + 1;
    end
end
Testsamples1 = [Testsamples1 ones(m,1)];
Test_score = Testsamples1*W;
Result = zeros(m,1);
for i=1:m
    Result(i) = find(Test_score(i,:)==max(Test_score(i,:)))-1;
end
temp = (Result==TestLabels1);
accuracy = sum(temp)/m;
fprintf('The accuracy rate is: %f',accuracy);


