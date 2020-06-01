%% IMAGE PROCESSING USING CNN CLASSIFIERS
%% AUTHOR
% S Sai Suryateja,
% Vellore Institute of Technology,Vellore
%% Load and explore the data
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos', ...
    'nndatasets','DigitDataset');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
%% Display images of datastore
figure(1),perm = randperm(10000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
end
%% Calculate the number of images in each category
labelCount = countEachLabel(imds)
%% Specify the image sizes
img = readimage(imds,1);
size(img)
%% Dive the datset into Training and Validation
numTrainFiles = 750;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
%% Define the CNN architecture
layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];
%% Specify Training options
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');
%% Train the network
net = trainNetwork(imdsTrain,layers,options);
%% Classify Validated Images
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;
%% Calculate the Accuracy
accuracy = sum(YPred == YValidation)/numel(YValidation)