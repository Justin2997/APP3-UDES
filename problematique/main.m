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
addpath("helper/classification/loiGaussienne/A");
addpath("helper/classification/plusProcheVoisin/A");
addpath("helper/classification/plusProcheVoisin/B");
addpath("helper/classification/bayes");
addpath("donnees/");

[training_nP300, training_P300, Inconnus] = loadTrainingData();
all_training = [training_nP300; training_P300];

[test_nP300, test_P300] = loadTestData();

%% Analyse P300 structure

% analysePCA(all_training)
% plotTrainingData(training_nP300, training_P300);

%% 2 - A) Implémentation d'algorithme
fprintf('2 - A) \n');
[coeff,~,~,~,~] = pca(all_training);
[decorelation_training_nP300, decorelation_training_P300] = decorelation(training_nP300, training_P300, coeff);

[probNP300, probP300] = evaluationProbability(decorelation_training_nP300, decorelation_training_P300);

% Error sur les données de training
[training_errorNP300, training_errorP300] = calculeErrorGaussiennes(probNP300, probP300, decorelation_training_nP300, decorelation_training_P300);

% Error sur les données de test
[decorelation_test_nP300, decorelation_test_P300] = decorelation(test_nP300, test_P300, coeff);
[test_errorNP300, test_errorP300] = testDataGaussienne(probNP300, probP300, decorelation_test_nP300, decorelation_test_P300);

% Inconnu
[inconnuNP300, inconnuP300] = inconnuDataGaussienne(probNP300, probP300, Inconnus);

%%  2 - B) Implémentation Bayes
%TODO: restructurer pour sortie
%[test_errorNP300, test_errorP300] = erreurBayes(decorelation_test_nP300, decorelation_test_P300, decorelation_training_nP300, decorelation_training_P300);

%% 3 - C) Implémentation d'algorithme


%% 5 - Implémentation Plus proche voisin

% A)
fprintf('5 - A) \n');
k = 3;
[baricentreNP300, baricentreP300] = baricentrePlusProcheVoisin(decorelation_training_nP300, decorelation_training_P300, k);
[test_errorNP300, test_errorP300] = errorTestPlusProcheVoisin(decorelation_test_nP300, decorelation_test_P300, baricentreNP300, baricentreP300, k);
[inconnuNP300, inconnuP300] = inconnuTestPlusProcheVoisin(Inconnus, baricentreNP300, baricentreP300, k);

% B)
fprintf('5 - B) \n');
k = 1;
[baricentreNP300, baricentreP300] = quantificationVectoriellePlusProcheVoisin(decorelation_training_nP300, decorelation_training_P300);
[test_errorNP300, test_errorP300] = errorTestPlusProcheVoisin(decorelation_test_nP300, decorelation_test_P300, baricentreNP300, baricentreP300, k);
[inconnuNP300, inconnuP300] = inconnuTestPlusProcheVoisin(Inconnus, baricentreNP300, baricentreP300, k);

