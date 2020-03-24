clear ; close all; clc

fprintf('Loading Data ...\n')
[Xtrain ytrain Xcv ycv Xtest ytest] = readSplitData();
Xtrain=[Xtrain;Xcv];
ytrain=[ytrain;ycv];
m = size(Xtrain, 1);
input_layer_size  =181;
hidden_layer_size = 100;
num_labels = 8;

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Training NN ===================

fprintf('\nTraining Neural Network... \n')


options = optimset('MaxIter', 500);

%try different values of lambda
lambda = 3;
highK=0;
index=0;
for i=1:2
hidden_layer_size = 24+i;
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

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

fprintf('Program paused. Press enter to continue.\n');


%================== Predict-Data============
pred = predict(Theta1, Theta2, Xtrain);

fprintf('\: %f\n', mean(double(pred == ytrain)) * 100);

endfor