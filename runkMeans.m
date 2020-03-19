function [centroids, idx] = runkMeans(X, initial_centroids, max_iters, plot_progress)

[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);

for i=1:max_iters
        fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    
    % For each example in X, assign it to the closest centroid
    idx = findClosestCentroids(X, centroids);

    % Given the memberships, compute new centroids
    centroids = computeCentroids(X, idx, K);
end

end

