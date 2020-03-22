function V = shuffleSaveMatrix(X)
  V = X(randperm(size(X,1)),:);
  X = V;
  save -binary Data1.mat X;
endfunction
