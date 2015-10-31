function centroids = computeCentroids(X, idx, K)
    n = size(X, 1);
    m = size(X, 2);
    sum = zeros(K, m);
    cnt = zeros(K, 1);
    centroids = zeros(K, m);
    for i=1:n
        for j=1:K
            if (idx(i) == j)
            	sum(j, :) = sum(j, :) + X(i, :);
                cnt(j) = cnt(j) + 1;
            end
        end
    end

    for j=1:K
        centroids(j, :) = sum(j, :)/cnt(j);
    end
end