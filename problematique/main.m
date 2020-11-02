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
addpath("donnees/");

[training_nP300, training_P300, Inconnus] = loadTrainingData();
[test_nP300, test_P300] = loadTestData();

%% Analyse P300 structure

plotTrainingData(training_nP300, training_P300);

[probNP300, probP300] = evaluationProbability(training_nP300, training_P300);