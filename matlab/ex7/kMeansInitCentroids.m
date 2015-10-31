function initial_centroids = kMeansInitCentroids(X, K)
    randidx = randperm(size(X, 1));
    initial_centroids = X(randidx(1:K), :);
end