function cost = computeCost(X, y, theta)
    n = length(y);
    sum = 0;
    for i=1:n
        sum = sum + (theta(1)*X(i,1) + theta(2)*X(i,2) - y(i))^2;
    end
    cost = sum/(2*n);
%     fprintf('cost = %f', cost);
end