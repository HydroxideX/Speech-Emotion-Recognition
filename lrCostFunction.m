function [J, grad] = lrCostFunction(theta, X, y, lambda)

m = length(y);
J = 0;
grad = zeros(size(theta));

H =   sigmoid(X * theta);
firstTerm = -y .* log(H);
secondTerm = -(ones(m,1)-y).*log(ones(m,1)-H);
J = (1./m) .* (sum(firstTerm) + sum(secondTerm));
J += (lambda./(2.*m)).*sum(theta(2:size(theta)).^2);
grad = (1./m).* (X' * (H-y));
grad += (lambda./m).*([0; theta(2:size(theta))]);
grad = grad(:);

end
