function [probNP300, probP300] = evaluationProbability(nP300, P300)
    syms x1 x2; x = [x1; x2]; % Les 2 signal de P300 sont corrélé
    
    coutP300 = 3;
    coutNP300 = 1;

    meanNP300 = (x - mean(nP300)');
    meanP300 = (x - mean(P300)');

    probNP300 = ((1/sqrt(det(cov(nP300))*(2*pi)^1)).*exp(-0.5 * meanNP300' * inv(cov(nP300))* meanNP300)) * coutNP300;
    probP300 = ((1/sqrt(det(cov(P300))*(2*pi)^1)).*exp(-0.5 * meanP300' * inv(cov(P300))* meanP300)) * coutP300;

    %nP300VP300 = probNP300 - probP300;
  
    %figure
    %hold on
    %fimplicit(probP300);
    %plot(P300(:,1), P300(:,2), "xr");
    %plot(nP300(:,1), nP300(:,2), "or");
end


