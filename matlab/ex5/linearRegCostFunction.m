function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
    m = size(X, 1);
  
    theta1 = [0 ; theta(2:end)];
    J = (sum((X*theta-y).^2) + lambda*(theta1'*theta1))/(2*m);
    grad = (X'*(X*theta-y) + lambda*theta1)/m;
    
    grad = grad(:);
end