function [inconnuNP300, inconnuP300] = inconnuDataGaussienne(probNP300, probP300, inconnu, apriorieP300)
    syms x1 x2;
    
    inconnuNP300 = [];
    inconnuP300 = [];
    
    numberSize = size(inconnu, 1);

    fprintf('=========================== \n');
    fprintf('Inconnu \n');
    
    fprintf('Testing Inconnu on %f data... \n', numberSize);
    for index = 1:numberSize
        %fprintf('Index for NP300 = %f \n', index);
        point = inconnu(index, :);
        
        testP300 = eval(subs(probP300, [x1, x2], point));
        testNP300 = eval(subs(probNP300, [x1, x2], point));

        testP300 = testP300 * apriorieP300;
        testNP300 = testNP300 * (1-apriorieP300);
        
        % Faux Positif
        if (testNP300 < testP300)
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