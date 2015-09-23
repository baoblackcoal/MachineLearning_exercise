function p = predict(theta, X)
%     disp(size(X));
%     disp(size(theta));
    y = sigmoid(X*theta);
    p = (y >= 0.5);
end