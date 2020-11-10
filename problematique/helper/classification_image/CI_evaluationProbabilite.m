function [probCoast, probForest, probStreet] = evaluationProbabilite(S_Coast, S_Forest, S_Street)
    syms x1 x2; x = [x1; x2];

    meanCoast = (x - mean(S_Coast)');
    meanForest = (x - mean(S_Forest)');
    meanStreet = (x - mean(S_Street)');

    probCoast = (1/sqrt(det(cov(S_Coast))*(2*pi)^1)).*exp(-0.5 * meanCoast' * inv(cov(S_Coast))* meanCoast);
    probForest = (1/sqrt(det(cov(S_Forest))*(2*pi)^1)).*exp(-0.5 * meanForest' * inv(cov(S_Forest))* meanForest);
    probStreet = (1/sqrt(det(cov(S_Street))*(2*pi)^1)).*exp(-0.5 * meanStreet' * inv(cov(S_Street))* meanStreet);
end
