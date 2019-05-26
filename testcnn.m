clc;
clear;
close all;
datapath=pwd;
Datasetpath=fullfile(datapath,'PreprocessedDatabase');
trainingDS = imageDatastore(Datasetpath,'IncludeSubfolders',1,...
    'LabelSource','foldernames');
tbl = countEachLabel(trainingDS);

layers=[imageInputLayer([227 227 3])
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2,'stride',2)
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2,'stride',2)
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2,'stride',2)
        fullyConnectedLayer(3)
        softmaxLayer
        classificationLayer()]
    
maxEpochs=300;
lr = 0.0001;
miniBatchSize = 64; % lower this if your GPU runs out of memory.


 opts = trainingOptions('sgdm', ...
     'LearnRateSchedule', 'none',...
     'InitialLearnRate', lr,... 
     'MaxEpochs', maxEpochs, ...
      'MiniBatchSize', miniBatchSize,...
     'Plots','training-progress');
   
% analyzeNetwork(layers)
net = trainNetwork(trainingDS, layers, opts);

save('trainedNet.mat','net')

    

disp('exit');

