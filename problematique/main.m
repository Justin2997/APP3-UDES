%% Initialisation
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
imtool close all;	% Close all figure windows created by imtool.
format long g;
format compact;

addpath("helper/");
addpath("helper/init");
addpath("helper/analyse");
addpath("helper/classification");
addpath("helper/classification/loiGaussienne");
addpath("helper/classification/plusProcheVoisin");
addpath("helper/classification/bayes");
addpath("donnees/");

[training_nP300, training_P300, Inconnus] = loadTrainingData();
all_training = [training_nP300;training_P300];

[test_nP300, test_P300] = loadTestData();

%% Analyse P300 structure

%analyse_pca(all_training)

% plotTrainingData(training_nP300, training_P300);
[coeff,~,~,~,~] = pca(all_training);
[decorelation_training_nP300, decorelation_training_P300] = decorelation(training_nP300, training_P300, coeff);

%% Implémentation d'algorithme - Loi Gaussienne
%[probNP300, probP300] = evaluationProbability(decorelation_training_nP300, decorelation_training_P300);

%[decorelation_training_nP300, decorelation_training_P300] = decorelation(training_nP300, training_P300);
%[training_errorNP300, training_errorP300] = calculeErrorGaussiennes(probNP300, probP300, decorelation_training_nP300, decorelation_training_P300);

[decorelation_test_nP300, decorelation_test_P300] = decorelation(test_nP300, test_P300, coeff);
%[test_errorNP300, test_errorP300] = testDataGaussienne(probNP300, probP300, decorelation_test_nP300, decorelation_test_P300);

%% Implémentation Bayes
%TODO: restructurer pour sortie
[test_errorNP300, test_errorP300] = erreurBayes(decorelation_test_nP300, decorelation_test_P300, decorelation_training_nP300, decorelation_training_P300);

%% 5 - Implémentation Plus proche voisin

% A)
[frontiaire] = frontiairePlusProcheVoisin(decorelation_training_nP300, decorelation_training_P300);

% B)
%[test_errorNP300, test_errorP300] = errorTestPlusProcheVoisin(decorelation_test_nP300, decorelation_test_P300, decorelation_training_nP300, decorelation_training_P300, 3);


