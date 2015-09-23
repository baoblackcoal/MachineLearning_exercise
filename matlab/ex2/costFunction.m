function [cost, grad] = costFunction(theta, X, y)
%     disp(size(theta));
%     disp(size(X));
    m = length(y);
    h = sigmoid(X*theta);
    cost = sum((-y.*log(h) - (1.-y).*log(1.-h)))/m;
    grad(1) = sum(h - y)/m; 
    grad(2) = sum((h - y).*X(:, 2))/m; 
    grad(3) = sum((h - y).*X(:, 3))/m; 
end