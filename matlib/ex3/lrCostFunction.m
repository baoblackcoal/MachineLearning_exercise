function [cost, grad] = lrCostFunction(theta, X, y, lambda)
%     lambda = 0.001;
%     fprintf('lambda=%f\n', lambda);
%     disp(size(theta));
%     disp(size(X));
%     disp(size(y));
    m = length(y);
%     u = length(theta);
    h = sigmoid(X*theta);
    grad = zeros(size(theta));
   
    thetaTmp = [0; theta(2:end)];
    cost = sum((-y.*log(h) - (1.-y).*log(1.-h)))/m + lambda*(thetaTmp'*thetaTmp)/(2*m);
    grad = X'*(h-y)/m + lambda*thetaTmp/m;
end