function [propreNP300, propreP300] = decorelation(nP300, P300)
    
    % Covariance
    covNP300 = cov(nP300);
    covP300 = cov(P300);

    % VectorPropre
    [vectorPropreNP300, valeurPropreNP300] = eig(covNP300);
    [vectorPropreP300, valeurPropreP300] = eig(covP300);
    
    % Return
    propreNP300 = [nP300(:, 1), nP300(:, 4)];
    propreP300 = [P300(:, 1), P300(:, 4)];
end

