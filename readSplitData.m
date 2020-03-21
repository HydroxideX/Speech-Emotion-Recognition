function [Xtrain ytrain Xcv ycv Xtest ytest] = readSplitData()
  load('Data.mat');
  input = X(:,1:size(X,2)-1);
  input = [ones(size(input,1),1) input];
  output = X(:,size(X,2));
  Xtrain = input(1:800,:);
  Xcv = input(801:1100,:);
  Xtest = input(1101:size(input,1),:);
  ytrain = output(1:800,:);
  ycv = output(801:1100,:);
  ytest = output(1101:size(input,1),:);
endfunction
