clear ; close all; clc

num_labels = 8;

fprintf('Loading Data ...\n')

[Xtrain ytrain Xcv ycv Xtest ytest] = readSplitData();

m = size(Xtrain, 1);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2b: One-vs-All Training ============
fprintf('\nTraining One-vs-All Logistic Regression...\n')
bestLambda = 0;

lambda = 5;
[all_theta] = oneVsAll(Xtrain, ytrain, num_labels, lambda);


%% ================ Part 3: Predict for One-Vs-All ================

pred = predictOneVsAll(all_theta, Xtrain);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytrain)) * 100);
pred = predictOneVsAll(all_theta, [Xcv; Xtest]);
fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == [ycv;ytest])) * 100);

