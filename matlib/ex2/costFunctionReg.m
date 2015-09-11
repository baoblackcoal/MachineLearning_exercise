function [cost, grad] = costFunctionReg(theta, X, y, lambda)
%     lambda = 0.001;
%     fprintf('lambda=%f\n', lambda);
%     disp(size(theta));
%     disp(size(X));
%     disp(size(y));
    m = length(y);
    u = length(theta);
    h = sigmoid(X*theta);
    cost = sum((-y.*log(h) - (1.-y).*log(1.-h)))/m + lambda*sum(theta(2:u))/(2*m);
    grad(1) = sum((h-y).*X(:, 1))/m;
    for i=2:u
        grad(i) = sum((h-y).*X(:, i))/m + lambda*theta(i)/m;
    end
%     fprintf('size(grad)=%d', size(grad));
end