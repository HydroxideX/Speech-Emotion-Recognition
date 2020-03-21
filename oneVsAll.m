function [all_theta] = oneVsAll(X, y, num_labels, lambda)

m = size(X, 1);
n = size(X, 2);
all_theta = zeros(num_labels, n + 1);
X = [ones(m, 1) X];
initial_theta = zeros(n+1,1);
for i = 1:num_labels
    options = optimset('GradObj','on','MaxIter',50);
    all_theta(i,:) = fmincg(@(t)(lrCostFunction(t,X,(y==i),lambda)),initial_theta,options)';
endfor
end
