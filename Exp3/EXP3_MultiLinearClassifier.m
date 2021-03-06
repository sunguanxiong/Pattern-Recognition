clc
clear
load Samples

%处理数据增加偏置列%
Data = [ones(size(TrainSamples,1),1),TrainSamples];
K = 10;
[A] = TrainLMSE(Data,TrainLabels, K);

TestData = [ones(size(TestSamples,1),1),TestSamples];
%得到参数矩阵A。每列对应一个数字的分类器，第i列对应数字(i-1);%
Score = (TestData*A>0);
result = zeros(size(TestLabels));


for i=1:size(Score,1)
    if (sum(Score(i,:))~= 1)
        result(i) = -1;
    else
        result(i) = find(Score(i,:)==1)-1;
    end
end

t = (result==TestLabels);
Precision = sum(t)/size(TestLabels,1)
