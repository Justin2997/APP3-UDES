% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
imtool close all;	% Close all figure windows created by imtool.
format long g;
format compact;
addpath("helper/classification_image");
addpath("donnees/images/test");
addpath("donnees/images/training");

% Mode : 
%   1 = RGB
%   2 = YUV
%   3 = YCbCr
%   4 = LAN
Mode = 1;

% Reduction de dimension : Specifie la dimension a retirer (entre 1 et 3)
ParamToReduce = 3;

% Lecture des images
[S_Coast, S_Forest, S_Street] = CI_lectureImages(Mode);

% Affichage des histogrammes comprenant toutes les images d'une meme classe
[hist_Coast, hist_Forest, hist_Street] = CI_generationHistogrammes(S_Coast, S_Forest, S_Street);

Coast = [0 0];
for i = 2:100 % numel(S_Coast)
    tmp = double(squeeze(reshape(S_Coast(i).data, [1,(256*256),3])));
    tmp(:,ParamToReduce) = [];
    Coast=[Coast;tmp];
end

Forest = [0 0];
for i = 2:100 % numel(S_Forest)
    tmp = double(squeeze(reshape(S_Forest(i).data, [1,(256*256),3])));
    tmp(:,ParamToReduce) = [];
    Forest=[Forest;tmp];
end

Street = [0 0];
for i = 2:100 % numel(S_Forest)
    tmp = double(squeeze(reshape(S_Street(i).data, [1,(256*256),3])));
    tmp(:,ParamToReduce) = [];
    Street=[Street;tmp];
end

% % Densites de probabilites
[probCoast, probForest, probStreet] = CI_evaluationProbabilite(Coast, Forest, Street);

% Test avec image inconnue
D = "donnees/images/test";
images = dir(fullfile(D, '*.jpg'));

for k = 1:numel(images)
    F = fullfile(D,images(k).name);
    I = imread(F);
    
    switch Mode
        case 2
            I = JR_Rgb2Yul(I);
        case 3
            I = rgb2ycbcr(I);
        case 4
            [I(:,:,1),I(:,:,2),I(:,:,3)] = RGB2Lab(I(:,:,1),I(:,:,2),I(:,:,3));
    end

    I(:,:,ParamToReduce) = [];
    I = double(squeeze(reshape(I, [1,(256*256),2])));
    
    inconnues(k).data = double(I); 
end

[inconnuCoast, inconnuForest, inconnuStreet] = CI_testImagesInconnues(probCoast, probForest, probStreet, inconnues(1).data);












