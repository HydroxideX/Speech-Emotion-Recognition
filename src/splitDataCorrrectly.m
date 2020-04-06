function [Xtrain ytrain Xcv ycv Xtest ytest] = splitDataCorrrectly()
  load('Data.mat');
  input = X(:,1:size(X,2)-1);
  [input mu sigma] = featureNormalize(input);
  output = X(:,size(X,2));
  Xtrain = input(1:2531,:);
  Xcv = input(2531:2531+843,:);
  Xtest = input(2531+843:size(input,1),:);
  ytrain = output(1:2531,:);
  ycv = output(2513:2531+843,:);
  ytest = output(2531+843:size(input,1),:);
endfunction
