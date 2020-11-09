function [propreNP300, propreP300] = decorelation(nP300, P300, coeff)
    % Page 117 Note de Cours
    % Ce raisonnement peut être poursuivi, et, finalement, 
    % la matrice U qui permet d’obtenir la meilleure représentation possible des données est la matrice des vecteurs propres de la matrice 
    % d’autocorrélation des variables XXT , chaque vecteur propre correspondant à un axe de projection. 
    % La valeur propre qui lui est associée est en outre représentative de l’amplitude de la dispersion des données selon cet axe.

    % Resample
    % nP300 = resample(nP300, 1, 4);
    
    % Covariance
    %covNP300 = cov(nP300);
    %covP300 = cov(P300);
    %covCombine = cov([nP300; P300]);

    % VectorPropre
    %[vectorPropreNP300, valeurPropreNP300] = eig(covNP300);
    %[vectorPropreP300, valeurPropreP300] = eig(covP300);
    %[vectorPropreCombineP300, valeurPropreCombineP300] = eig(covCombine);
    
    % PCA
    % L'ACP va déterminer les deux axes qui expliquent le mieux la dispersion de l'objet, interprété comme un nuage de points. Elle va aussi les ordonner par inertie expliquée, le second axe étant perpendiculaire au premier.
    % pcaNP300 = pcacov(nP300);
    % pcaP300 = pcacov(P300);
    
    % Return
    %P300 = P300 * coeff;
    %nP300 = nP300 * coeff;
    
    propreNP300 = [nP300(:, 3), nP300(:, 4)];
    propreP300 = [P300(:, 3), P300(:, 4)];
end

