clear ; close all; clc

fprintf('Loading Data ...\n')
[Xtrain ytrain Xcv ycv Xtest ytest] = splitDataCorrrectly();

m = size(Xtrain, 1);
input_layer_size  =200;
hidden_layer_size = 104;
num_labels = 8;

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Training NN ===================

fprintf('\nTraining Neural Network... \n')

k=intmax;
lambda = 0;
best_lambda=lambda;
bestTheta1=[];
bestTheta2=[];

while(lambda<10)
  %try different values of lambda
  initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
  initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

  % Unroll parameters
  initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


  options = optimset('MaxIter', 300);

  % Unroll parameters
  initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];
  % Create "short hand" for the cost function to be minimized
  costFunction = @(p) nnCostFunction(p, ...
                                     input_layer_size, ...
                                     hidden_layer_size, ...
                                     num_labels, Xtrain, ytrain, lambda);

  % Now, costFunction is a function that takes in only one argument (the
  % neural network parameters)
  [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
  % Obtain Theta1 and Theta2 back from nn_params
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                   hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                   num_labels, (hidden_layer_size + 1));
                   
  J=nnCostfunctionwithouttheta(nn_params, ...
                                     input_layer_size, ...
                                     hidden_layer_size, ...
                                     num_labels, Xcv, ycv, lambda);
  
  if k>J
    k=J
    best_lambda=lambda
    bestTheta1=Theta1;
    bestTheta2=Theta2;
  endif
  if lambda==0
    lambda=0.001;
  else
    lambda*=2;
  endif
  
endwhile;

fprintf('Program paused. Press enter to continue.\n');

%================== Predict-Data============
pred = predict(bestTheta1, bestTheta2, Xtest);

fprintf(': %f\n', mean(double(pred == ytest)) * 100);
best_lambda
