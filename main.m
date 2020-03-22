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
testAccuracy = 0;
bestTestAccuracy = 0;
lambda = 0.000001
for i = 1:8
  i
  [all_theta] = oneVsAll(Xtrain, ytrain, num_labels, lambda);
  pred = predictOneVsAll(all_theta, [Xcv; Xtest]);
  testAccuracy = mean(double(pred == [ycv;ytest]))*100;
  if testAccuracy > bestTestAccuracy
    bestLambda = lambda;
    bestTestAccuracy = testAccuracy;
  end;
  lambda *= 10;
end;
bestLambda
bestTestAccuracy

%% ================ Part 3: Predict for One-Vs-All ================


