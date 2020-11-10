function [inconnuNP300, inconnuP300] = inconnuDataGaussienne_frontiere(probNP300, probP300, inconnu, apriorieP300)
    syms x1 x2;
    
    inconnuNP300 = [];
    inconnuP300 = [];
    
    numberSize = size(inconnu, 1);

    fprintf('=========================== \n');
    fprintf('Inconnu \n');
    
    fprintf('Testing Inconnu on %f data... \n', numberSize);
    
    probP300 = probP300 * apriorieP300;
    probNP300 = probNP300 * (1-apriorieP300);
    
    frontiere = probP300 - probNP300;
    
    for index = 1:numberSize
        %fprintf('Index for NP300 = %f \n', index);
        point = inconnu(index, :);
        
        answer = eval(subs(frontiere, [x1, x2], point));

        % Faux Positif
        if (answer > 0)
            inconnuP300 = [inconnuP300; point];
        else
            inconnuNP300 = [inconnuNP300; point];
        end
    end
    fprintf('Finish Inconnu \n');
    
    fprintf('=========================== \n');
    fprintf('Inconnu : NP300 = %.4f \n', size(inconnuP300, 1));
    fprintf('Inconnu : P300 = %.4f \n', size(inconnuNP300, 1));
    fprintf('=========================== \n');

    fprintf('=========================== \n');
end
