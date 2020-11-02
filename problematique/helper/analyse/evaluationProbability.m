function [probNP300, probP300] = evaluationProbability(nP300, P300)
    syms x1 x2 x3 x4; x = [x1; x2; x3; x4]; % Les 4 signal de P300 sont corrélé

    meanNP300 = (x - mean(nP300)');
    meanP300 = (x - mean(P300)');

    probNP300 = (1/sqrt(det(cov(nP300))*(2*pi)^2)).*exp(-0.5 * meanNP300' * inv(cov(nP300))* meanNP300);
    probP300 = (1/sqrt(det(cov(P300))*(2*pi)^2)).*exp(-0.5 * meanP300' * inv(cov(P300))* meanP300);

    % nP300VP300 = probNP300 - probP300;
end


