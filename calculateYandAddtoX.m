function V = calculateYandAddtoX(X)
  y = [];
for i = 1:24
  for  j = 1:4
    y = [y; 1];
   endfor;
   for j = 2:8
     for k = 1:8
        y = [y; j];
      endfor;
    endfor;
endfor;
V = [X y];
endfunction
