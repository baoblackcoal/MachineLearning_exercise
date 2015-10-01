function [C, sigma] = dataset3Params(X, y, Xval, yval)
	a = [0.01 0.03 0.1 0.3 1 3 10 30];
    
    n = length(a);
%     C = Zeros(n, n);
%     sigma = Zeros(n, n);
%     x1 = [1 2 1]; x2 = [0 4 -1]; 
    r = zeros(n, n);
    
    for i=1:n
       for j=1:n
          C = a(i);
          sigma = a(j);
          model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
          yValPredict = svmPredict(model, Xval);
          r(i, j) = mean(double(yValPredict ~= yval));
       end
    end
    
%     surf(a,a,r)
    
    [r, l] = find(r==min(r(:)));
    C = a(r);
    sigma = a(l);
    
    fprintf('C=%f, sigma=%f', C, sigma);
end