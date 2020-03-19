function V = correctVector(X,wavData)
  V = X;
   if length(X) > length(wavData)
     wavData = [wavData; zeros(size(X,2) - length(wavData),1)];
   endif;
   if length(X) < length(wavData)
    maxSize = length(wavData);
      V = [V zeros(size(X,1),maxSize-size(X,2))];
  endif 
  V = [ V; wavData'];
endfunction
