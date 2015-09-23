function pred = predictOneVsAll(all_theta, X)
%     disp(size(all_theta));
%     disp(size(X));
    n = length(X(:, 1));
    pred = zeros(n, 1);
    X1 = [ones(n, 1) X];
    [v, pred] = max(sigmoid(X1*all_theta'), [], 2);
end
