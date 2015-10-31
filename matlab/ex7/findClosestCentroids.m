function idx = findClosestCentroids(X, centroids)
    n = length(centroids(:, 1));
    m = length(X(:, 1));
    idx = zeros(m, 1);
    tmp = zeros(n, 1);
    
    for i=1:m
        for j=1:n
            tmp(j) = sum((X(i, :) - centroids(j, :)).^2);
        end
    	[v idx(i)] = min(tmp); 
    end
end