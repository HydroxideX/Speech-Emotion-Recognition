function X = readTrainingData()
  X = [];
  #myDir = uigetdir;
  for i = 1:24
    myDir = 'Audio/Actor_';
    if i < 10
     myDir = strcat(myDir,'0');
     myDir = strcat(myDir,int2str(i));
    endif
    if i >9
      myDir = strcat(myDir,int2str(i));
    endif 
    myDir
    myFiles = dir(fullfile(myDir,'*.wav'));
    for k = 1:length(myFiles)
      baseFileName = myFiles(k).name;
      fullFileName = fullfile(myDir, baseFileName);
      [wavData Fs] = audioread(fullFileName);
      V = correctVector(X,wavData);
      X = V;
    end
  endfor;
  size(X)
endfunction
