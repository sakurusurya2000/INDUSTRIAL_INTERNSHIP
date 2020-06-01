%% AUTHOR
% S Sai Suryateja
% Vellore Institute of Technology,Vellore
% IMAGE PROCESSING USING CNN CLASSIFIERS
%% Load the dataset
% Load the ground truth data
data = load('stopSignsAndCars.mat', 'stopSignsAndCars');
stopSignsAndCars = data.stopSignsAndCars;
% Update the path to the image files to match the local file system
visiondata = fullfile(toolboxdir('vision'),'visiondata');
stopSignsAndCars.imageFilename = fullfile(visiondata, stopSignsAndCars.imageFilename);
% Display a summary of the ground truth data
summary(stopSignsAndCars)
%% Only keep the image file names and the stop sign ROI labels
stopSigns = stopSignsAndCars(:, {'imageFilename','stopSign'});
% Display one training image and the ground truth bounding boxes
I = imread(stopSigns.imageFilename{1});
I = insertObjectAnnotation(I,'Rectangle',stopSigns.stopSign{1},'stop sign','LineWidth',8);
figure(1)
imshow(I)
%% RNN Training
% A trained detector is loaded from disk to save time when running the example. Set this flag to true to train the detector.
doTraining = false;
if doTraining 
    % Set training options
    options = trainingOptions('sgdm', ...
        'MiniBatchSize', 128, ...
        'InitialLearnRate', 1e-3, ...
        'LearnRateSchedule', 'piecewise', ...
        'LearnRateDropFactor', 0.1, ...
        'LearnRateDropPeriod', 100, ...
        'MaxEpochs', 100, ...
        'Verbose', true);
    % Train an R-CNN object detector. This will take several minutes.    
    rcnn = trainRCNNObjectDetector(stopSigns, cifar10Net, options, ...
    'NegativeOverlapRange', [0 0.3], 'PositiveOverlapRange',[0.5 1])
else
    % Load pre-trained network for the example.
    load('rcnnStopSigns.mat','rcnn')       
end
%% Testing RNN Classifier
% Read test image
testImage = imread('stopSignTest.jpg');
% Detect stop signs
[bboxes,score,label] = detect(rcnn,testImage,'MiniBatchSize',128)
% Display the detection results
[score, idx] = max(score);
bbox = bboxes(idx, :);
annotation = sprintf('%s: (Confidence = %f)', label(idx), score);
outputImage = insertObjectAnnotation(testImage, 'rectangle', bbox, annotation);
figure(2)
imshow(outputImage)