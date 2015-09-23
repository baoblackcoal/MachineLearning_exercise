function [all_theta] = oneVsAll(X, y, num_labels, lambda)
    %  Set options for fminunc
    options = optimset('GradObj', 'on', 'MaxIter', 100);
    
	[r c] = size(X);
	X1 = [ones(r, 1) X];
    all_theta = zeros(num_labels, c+1);
    theta = zeros(c+1, 1);
    for k=1:num_labels
        %  Run fminunc to obtain the optimal theta
        %  This function will return theta and the cost   fmincg
        all_theta(k, :) = ...
            fmincg(@(t)(lrCostFunction(t, X1, (y == k), lambda)), theta, options);
      
    end
end