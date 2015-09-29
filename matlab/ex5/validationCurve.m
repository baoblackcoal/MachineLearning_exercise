function [lambda_vec, error_train, error_val] = ...
    validationCurve(X_poly, y, X_poly_val, yval)

    lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10];
    u = length(lambda_vec);

    m = length(y);
    n = length(yval);
   
    error_train = zeros(u, 1);
    error_val = zeros(u, 1);

    for i=1:u
        theta = trainLinearReg(X_poly, y, lambda_vec(i));
        theta1 = [0;theta(2:end)];

        error_train(i) = sum((X_poly*theta - y).^2)/(2*m) + lambda_vec(i)*(theta1'*theta1)/(2*m);
        error_val(i) = sum((X_poly_val*theta - yval).^2)/(2*n);
    end
end