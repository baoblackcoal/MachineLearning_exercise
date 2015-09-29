function [error_train, error_val] = learningCurve(Xtrain, ytarin, Xval, yval, lambda)
    m = length(ytarin);
    n = length(yval);
    error_train = zeros(m, 1);
    error_val = zeros(m, 1);
    
    for i=1:m
        X_tmp = Xtrain(1:i, :);
        y_tmp = ytarin(1:i, :);
        theta = trainLinearReg(X_tmp, y_tmp, lambda);
        
        theta1 = [0;theta(2:end)];
        error_train(i) = sum((X_tmp*theta - y_tmp).^2)/(2*i) + lambda*(theta1'*theta1)/(2*i);
        error_val(i) = sum((Xval*theta - yval).^2)/(2*n);
    end
end