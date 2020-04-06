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

 size(y)
%angry
  y=[y;5*ones(396,1)];
 
 %disgust
  y=[y;7*ones(399,1)];
 
 %fear
  y=[y;6*ones(399,1)];
 
 %happy
  y=[y;3*ones(400,1)];
 
 %neutral
  y=[y;ones(398,1)];
 
 %sad
  y=[y;4*ones(392,1)];
 
 %surprsie
  y=[y;8*ones(393,1)];

V = [X y];
endfunction
