% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [baricentreNP300, baricentreP300] = baricentrePlusProcheVoisin(nP300, P300, k)
    %% Init
    baricentreNP300 = [];
    baricentreP300 = [];
    
    temp_P300 = P300;
    temp_nP300 = nP300;
    
    meanNP300 = mean(nP300);
    meanP300 = mean(P300);

    %% Point P300
    for kIndex = 1:k
        distance_from_P300 = sum((temp_P300 - meanP300) .^ 2, 2);
        baricentreP300 = [baricentreP300; temp_P300(distance_from_P300 == min(distance_from_P300),:)];
        temp_P300(distance_from_P300 == min(distance_from_P300),:) = [];
    end
    
    %% Point nP300
    for kIndex = 1:k
        distance_from_nP300 = sum((temp_P300 - meanNP300) .^ 2, 2);
        baricentreNP300 = [baricentreNP300; temp_nP300(distance_from_nP300 == min(distance_from_nP300),:)];
        temp_nP300(distance_from_nP300 == min(distance_from_nP300),:) = [];
    end
end

