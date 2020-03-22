function [J grad] = nnCostFunction2(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%
% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size+1 )),hidden_layer_size, (input_layer_size + 1));
                 
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))): (hidden_layer_size * (input_layer_size + 1))+(hidden_layer_size)*(hidden_layer_size+1)), hidden_layer_size, (hidden_layer_size + 1));
                 
Theta3 = reshape(nn_params(1 + (hidden_layer_size * (input_layer_size + 1))+(hidden_layer_size)*(hidden_layer_size+1):end), num_labels, (hidden_layer_size + 1));
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
Theta3_grad = zeros(size(Theta3));
Delta2=0;
Delta1=0;
Delta0 = 0;
for i=1:m
      a1=[1 ;X(i,:)'];
      z2=Theta1*a1;
      a2=[ 1; sigmoid(Theta1*a1) ];
      z3=Theta2*a2;
      a3 = [1; sigmoid(Theta2*a2) ];
      h=sigmoid(Theta3*a3);
      yr=zeros(num_labels,1);
      yr(y(i))=1;
      delta3=h-yr;
      delta2=Theta3'*delta3;
      delta2 = delta2(2:end);
      delta2=delta2.*sigmoidGradient(z3);
      delta1 = Theta2'*delta2;
      delta1 = delta1(2:end);
      delta1=delta1.*sigmoidGradient(z2);
      Delta2=Delta2+delta3*a3';
      Delta1=Delta1+delta2*a2';
      Delta0 = Delta0 + delta1*a1';
      J=J+(1/m)*(-yr'*(log(h))-(1-yr)'*(log(1-h)));
  end;
  Theta1_grad=(1/m)*Delta0;
  Theta1_grad(:,2:end)=Theta1_grad(:,2:end)+(lambda/m)*Theta1(:,2:end);
  Theta2_grad=(1/m)*Delta1;
  Theta2_grad(:,2:end)=Theta2_grad(:,2:end)+(lambda/m)*Theta2(:,2:end);
  Theta3_grad=(1/m)*Delta2;
  Theta3_grad(:,2:end)=Theta3_grad(:,2:end)+(lambda/m)*Theta3(:,2:end);
  J2=0;
  for i=2:input_layer_size+1
    for j=1:hidden_layer_size
       J2=J2+Theta1(j,i)^2;
     end
   end
  for i=2:hidden_layer_size+1
    for j=1:hidden_layer_size
       J2=J2+Theta2(j,i)^2;
    end
  end
  for i=2:hidden_layer_size+1
    for j=1:num_labels
       J2=J2+Theta3(j,i)^2;
    end
  end
  J=J+(lambda/(2*m))*J2;
% -------------------------------------------------------------
% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:);Theta3_grad(:)];

end