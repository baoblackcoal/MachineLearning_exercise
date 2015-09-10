function theta = gradientDescent(X, y, theta, alpha, iterations)
    n = length(y);
    for i=1:iterations
        thetaTmp = theta;
        sumTheta0 = 0;
        sumTheta1 = 0;
        for j=1:n
            sumTheta0 = sumTheta0 + (thetaTmp(1)*X(j, 1) + thetaTmp(2)*X(j, 2) - y(j))/n;
            sumTheta1 = sumTheta1 + ((thetaTmp(1)*X(j, 1) + thetaTmp(2)*X(j, 2) - y(j))*X(j, 2))/n;
        end
        theta(1) = thetaTmp(1)-alpha*sumTheta0;
        theta(2) = thetaTmp(2)-alpha*sumTheta1;
    end
end