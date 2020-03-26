function [Xtrain ytrain Xcv ycv Xtest ytest] = readSplitData()
  load('Data.mat');
  size(X)
  input = X(:,1:size(X,2)-1);
  [input mu sigma] = featureNormalize(input);
  output = X(:,size(X,2));
  Xtrain = input(1:2950,:);
  Xcv = input(2951:2952,:);
  Xtest = input(2953:size(input,1),:);
  ytrain = output(1:2950,:);
  ycv = output(2951:2952,:);
  ytest = output(2953:size(input,1),:);
  size(Xtrain)
endfunction
