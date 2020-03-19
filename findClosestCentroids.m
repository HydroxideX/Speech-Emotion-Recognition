function idx = findClosestCentroids(X, centroids)
K = size(centroids, 1);
idx = zeros(size(X,1), 1);
for i = 1:size(X,1)
  minDist = 10000000000;
  for j = 1:size(centroids,1)
    dist = sum((X(i,:) - centroids(j,:)).^2);
    if dist < minDist
      minDist = dist;
      idx(i) = j;
    endif
  endfor
endfor
% =============================================================
end

