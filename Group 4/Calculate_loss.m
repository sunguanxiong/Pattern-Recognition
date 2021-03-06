function [Loss, Delta] = Calculate_loss(X, Y, W, lamda)
    Delta = zeros(size(W));
    Delta_temp = zeros(size(W));
    Loss = 0;
    [m,n] = size(X);
    c = size(W,2);
    score = zeros(c,1);
    for i = 1:m
        score = X(i,:)*W;
        temp = ones(1,c)*score(Y(i)+1);
        temp = score - temp + 1;
        sel = temp > 0;
        Loss = Loss + sum(temp(sel))-1;
        for j = 1:c
            if(j == Y(i)+1)
                Delta_temp(:,j) = -X(i,:)'*(sum(sum(temp>0))-1);
            else
                Delta_temp(:,j) = X(i,:)'* sel(1,j);
            end
        end
        Delta = Delta + Delta_temp;
    end
    Loss = Loss/m + lamda*sum(sum(W.*W));
    Delta = Delta/m + 2*lamda*W;
% Loss = Loss/m;
% Delta = Delta/m;
end