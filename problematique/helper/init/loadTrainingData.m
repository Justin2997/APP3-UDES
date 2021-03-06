% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [nP300, P300, Inconnus] = loadTrainingData()
    P300 = load("ref_P300");
    nP300 = load("ref_NP300");

    Inconnus = load("Inconnus");
end

