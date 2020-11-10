% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [inconnuCoast, inconnuForest, inconnuStreet] = CI_testImagesInconnues(probCoast, probForest, probStreet, inconnu)
    syms x1 x2;
    
    inconnuCoast = [];
    inconnuForest = [];
    inconnuStreet = [];
    
    
    numberSize = 1000; % size(inconnu, 1);
    
    fprintf('=========================== \n');
    fprintf('Inconnu \n');
    fprintf('Testing Inconnu on %f data... \n', numberSize);
    
    for index = 1:numberSize
        point = inconnu(index, :);
       
        testCoast = eval(subs(probCoast, [x1, x2], point));
        testForest = eval(subs(probForest, [x1, x2], point));
        testStreet = eval(subs(probStreet, [x1, x2], point));

        % Faux Positif
        if (testCoast > testForest && testCoast > testStreet)
            inconnuCoast = [inconnuCoast; point];
        elseif (testForest > testCoast && testForest > testStreet)
            inconnuForest = [inconnuForest; point];
        elseif (testStreet > testCoast && testStreet > testForest)
            inconnuStreet = [inconnuStreet; point];
        end
        
    end
    
    fprintf('Finish Inconnu \n');
    
    fprintf('=========================== \n');
    fprintf('Inconnu : Coast = %.4f : %.2f \n', size(inconnuCoast, 1), (size(inconnuCoast, 1)/numberSize)*100);
    fprintf('Inconnu : Forest = %.4f : %.2f \n', size(inconnuForest, 1), (size(inconnuForest, 1)/numberSize)*100);
    fprintf('Inconnu : Street = %.4f : %.2f \n', size(inconnuStreet, 1), (size(inconnuStreet, 1)/numberSize)*100);
    fprintf('=========================== \n');

    fprintf('=========================== \n');
    
    
    
    