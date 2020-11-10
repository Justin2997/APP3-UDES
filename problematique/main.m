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
addpath("helper/classification/loiGaussienne/C");
addpath("helper/classification/plusProcheVoisin/A");
addpath("helper/classification/plusProcheVoisin/B");
addpath("helper/classification/bayes");
addpath("donnees/");

[training_nP300, training_P300, Inconnus] = loadTrainingData();
[test_nP300, test_P300] = loadTestData();

%% 1 - Analyse des données
%analysePCA([training_nP300; training_P300])
%show_4d(training_nP300, training_P300)
%plotTrainingData(training_nP300, training_P300);

%% 1- Decorelation
all_training = [training_nP300; training_P300];
covCombine = cov(all_training);
[vectorPropre, valeurPropre] = eig(covCombine);

[decorelation_training_nP300] = decorelation(training_nP300, vectorPropre);
[decorelation_training_P300] = decorelation(training_P300, vectorPropre);
[decorelation_test_nP300] = decorelation(test_nP300, vectorPropre);
[decorelation_test_P300] = decorelation(test_P300, vectorPropre);
[decorelation_inconnu] = decorelation(Inconnus, vectorPropre);

show_4d(decorelation_training_nP300, decorelation_training_P300)

decorelation_training_nP300 = reduction_dimension(decorelation_training_nP300);
decorelation_training_P300 = reduction_dimension(decorelation_training_P300);
decorelation_test_nP300 = reduction_dimension(decorelation_test_nP300);
decorelation_test_P300 = reduction_dimension(decorelation_test_P300);
decorelation_inconnu = reduction_dimension(decorelation_inconnu);

%% 2 - A) Implémentation d'algorithme
fprintf('2 - A) \n');
apriorieP300 = length(decorelation_training_P300)/length(all_training);
[probNP300, probP300] = evaluationProbability(decorelation_training_nP300, decorelation_training_P300);

% Error sur les données de training
[training_errorNP300, training_errorP300] = calculeErrorGaussiennes(probNP300, probP300, decorelation_training_nP300, decorelation_training_P300, apriorieP300);

% Error sur les données de test
[test_errorNP300, test_errorP300] = testDataGaussienne(probNP300, probP300, decorelation_test_nP300, decorelation_test_P300, apriorieP300);

% Inconnu
[inconnuNP300, inconnuP300] = inconnuDataGaussienne(probNP300, probP300, decorelation_inconnu, apriorieP300);

%%  2 - B) Implémentation Bayes
fprintf('2 - B) \n');
[test_errorNP300_bayes, test_errorP300_bayes] = erreurBayes(decorelation_test_nP300, decorelation_test_P300, decorelation_training_nP300, decorelation_training_P300);

%% 2 - C) Implémentation d'algorithme
fprintf('2 - C) \n');
apriorieP300 = length(decorelation_training_P300)/length(all_training);
[probNP300, probP300] = evaluationProbability(decorelation_training_nP300, decorelation_training_P300);

% Error sur les données de training
[training_errorNP300, training_errorP300] = calculeErrorGaussiennes_frontiere(probNP300, probP300, decorelation_training_nP300, decorelation_training_P300, apriorieP300);

% Error sur les données de test
[test_errorNP300, test_errorP300] = testDataGaussienne_frontiere(probNP300, probP300, decorelation_test_nP300, decorelation_test_P300, apriorieP300);

% Inconnu
[inconnuNP300, inconnuP300] = inconnuDataGaussienne_frontiere(probNP300, probP300, decorelation_inconnu, apriorieP300);

%% 5 - Implémentation Plus proche voisin

% A)
fprintf('5 - A) \n');
k = 5;
[baricentreNP300, baricentreP300] = baricentrePlusProcheVoisin(decorelation_training_nP300, decorelation_training_P300, k);
[test_errorNP300, test_errorP300] = errorTestPlusProcheVoisin(decorelation_test_nP300, decorelation_test_P300, baricentreNP300, baricentreP300, k);
[inconnuNP300, inconnuP300] = inconnuTestPlusProcheVoisin(decorelation_inconnu, baricentreNP300, baricentreP300, k);

% B)
fprintf('5 - B) \n');
k = 2;
nombreBaricentreInitial = 15;
[baricentreNP300, baricentreP300] = quantificationVectoriellePlusProcheVoisin(decorelation_training_nP300, decorelation_training_P300, nombreBaricentreInitial);
[test_errorNP300, test_errorP300] = errorTestPlusProcheVoisin(decorelation_test_nP300, decorelation_test_P300, baricentreNP300, baricentreP300, k);
[inconnuNP300, inconnuP300] = inconnuTestPlusProcheVoisin(decorelation_inconnu, baricentreNP300, baricentreP300, k);

