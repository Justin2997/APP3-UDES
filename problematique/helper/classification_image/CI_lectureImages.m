% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [S_Coast, S_Forest, S_Street] = CI_lectureImages(Mode)
S_Coast = [];
S_Forest = [];
S_Street = [];

D = "donnees/images/training";

imageCoast = dir(fullfile(D, 'coast*.jpg'));
% S_Coast = cell(1, numel(imageCoast));

for k = 2:numel(imageCoast)
    F = fullfile(D,imageCoast(k).name);
    I = imread(F);
    
    switch Mode
        case 2
            I = JR_Rgb2Yul(I);
            
        case 3
            I = rgb2ycbcr(I);
            
        case 4
            [I(:,:,1),I(:,:,2),I(:,:,3)]=RGB2Lab(I(:,:,1),I(:,:,2),I(:,:,3));
    end
   
    S_Coast(k).data = I; 
end


imageForest = dir(fullfile(D, 'forest*.jpg'));
% S_Forest = cell(1, numel(imageForest));

for k = 2:numel(imageForest)
    F = fullfile(D,imageForest(k).name);
    I = imread(F);
        switch Mode
        case 2
            I = JR_Rgb2Yul(I);
            
        case 3
            I = rgb2ycbcr(I);
            
        case 4
            [I(:,:,1),I(:,:,2),I(:,:,3)]=RGB2Lab(I(:,:,1),I(:,:,2),I(:,:,3));
        end
        
    S_Forest(k).data = I; 
end

street = dir(fullfile(D, 'street*.jpg'));
% S_Street = cell(1, numel(imageStreet));

for k = 2:numel(street)
    F = fullfile(D,street(k).name);
    I = imread(F);
        switch Mode
        case 2
            I = JR_Rgb2Yul(I);
            
        case 3
            I = rgb2ycbcr(I);
            
        case 4
            [I(:,:,1),I(:,:,2),I(:,:,3)]=RGB2Lab(I(:,:,1),I(:,:,2),I(:,:,3));
        end
       
    S_Street(k).data = I; 
end