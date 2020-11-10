% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [propre] = decorelation(data, coeff)
    % Page 117 Note de Cours
    % Ce raisonnement peut être poursuivi, et, finalement, 
    % la matrice U qui permet d’obtenir la meilleure représentation possible des données est la matrice des vecteurs propres de la matrice 
    % d’autocorrélation des variables XXT , chaque vecteur propre correspondant à un axe de projection. 
    % La valeur propre qui lui est associée est en outre représentative de l’amplitude de la dispersion des données selon cet axe.

    % Return (page 116 note de cour)
    data = coeff' * data';
    propre = (data)';
end

