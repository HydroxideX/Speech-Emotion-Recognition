X = readTrainingData();
size(X)
K = 2;
max_iters = 10;
initial_centroids = initCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);