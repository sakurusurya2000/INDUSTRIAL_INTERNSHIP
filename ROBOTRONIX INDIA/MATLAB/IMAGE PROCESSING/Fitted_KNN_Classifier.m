%% IMAGE PROCESSING USING KNN CLASSIFIERS
%% AUTHOR
% S Sai Suryateja,
% Vellore Institute of Technology,Vellore
%% Load the dataset fisheriris
load fisheriris
%% Specify the X and Y axis
X = meas;
Y = species;
%% Define the KNN Classifier 
rng(1)
Mdl = fitcknn(X,Y,'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName','expected-improvement-plus'))