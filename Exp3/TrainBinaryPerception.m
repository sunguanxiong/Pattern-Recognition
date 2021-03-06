%训练二类感知器%
function [a] = TrainBinaryPerception(Data,Labels)
    [m,n]= size(Data);
    %初始化A%
    a = rand(n,1);
    
    %*********对数据进行规范化使得所有的A*y的值均>0***********%
    Data(Labels==2,:) = -Data(Labels==2,:);
    
    %梯度下降计算a%
    k=0;
    while 1
    %计算准则函数J（A）%
    temp_score = Data*a;
    if(temp_score(k+1)<=0)
        a = a+Data(k+1,:)';
        t = Data*a;
        J = -sum(t(t<=0));
    end
    if((Data*a)>0)
        break
    else
        k=mod(k+1,m);
    end
    end
end