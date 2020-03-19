function centroids = computeCentroids(X, idx, K)
[m n] = size(X);
centroids = zeros(K, n);
numberEachCentroid = zeros(K,1);
for i = 1:length(centroids)
  for j = 1:length(idx)
    if idx(j) == i
      centroids(i,:) += X(j,:);
      numberEachCentroid(i)++;
    endif
  endfor
endfor

for i = 1:length(numberEachCentroid)
  centroids(i,:) = centroids(i,:)./numberEachCentroid(i);
endfor
end

