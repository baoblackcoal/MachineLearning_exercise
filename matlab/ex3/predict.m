function p = predict(Theta1, Theta2, X)
%     disp(size(Theta1));
%     disp(size(Theta2));
%     disp(size(X));
    n = length(X(:, 1));
    p = zeros(n, 1);
    X1 = [ones(n, 1) X];
    
    a = sigmoid(X1*Theta1');
    n = length(a(:, 1));
    a1 = [ones(n, 1) a];
    b = sigmoid(a1*Theta2');
    [t, p] = max(b, [], 2);
end