[Xtrain ytrain Xcv ycv Xtest ytest] = readSplitData();
Xtrain=[Xtrain];
ytrain=[ytrain];
m = size(Xtrain, 1);
input_layer_size  =181;
hidden_layer_size = 25;
num_labels = 8;


initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Training NN ===================

fprintf('\nTraining Neural Network... \n')


options = optimset('MaxIter', 500);

%try different values of lambda
lambda = 2.8;
Jtrain=[];
Jcv=[];
constant=80;
for i=1:constant
% Create "short hand" for the cost function to be minimized
  xtemp=Xtrain(1:i,:);
  ytemp=ytrain(1:i,:);
  costFunction = @(p) nnCostFunction(p, ...
                                     input_layer_size, ...
                                     hidden_layer_size, ...
                                     num_labels, xtemp, ytemp, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
  [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
  J=nnCostfunctionwithouttheta(nn_params,input_layer_size, ...
                                     hidden_layer_size, ...
                                     num_labels, xtemp, ytemp, lambda);
  Jtrain=[Jtrain;J];
  J=nnCostfunctionwithouttheta(nn_params,input_layer_size, ...
                                     hidden_layer_size, ...
                                     num_labels, Xcv, ycv, lambda);
   Jcv=[Jcv;J];
endfor
% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;
plot(1:constant, Jtrain, 1:constant, Jcv);
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 80 0 4])


%================== Predict-Data============
pred = predict(Theta1, Theta2, Xtest);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytest)) * 100);