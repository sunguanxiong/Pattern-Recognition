%ͨ��data��Labelsѵ����֪����������Ϊk
function [A] = TrainLMSE(Data,Labels, K)
%DATA,LABELS,k��������%
    [~,n] = size(Data);
    A = zeros(n,K);
    %ʹ��һ�Զ�ķ�ʽѵ�����������%
    for i=1:K
        %�����ݷֳ����࣬��i��ͷǵ�i��%
        i
        Labels_new = 2*ones(size(Labels));
        Labels_new(Labels == i-1) = 1;
        A(:,i) = TrainBinaryLMSE(Data,Labels_new);
    end
end