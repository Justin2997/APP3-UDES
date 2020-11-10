function [errorNP300, errorP300] = testDataGaussienne_frontiere(probNP300, probP300, test_nP300, test_P300)
    syms x1 x2;
    
    numberNP300 = 30;
    numberP300 = 30;

    fprintf('=========================== \n');
    fprintf('Test \n');
    
    fprintf('Testing NP300 on %f data... \n', numberNP300);
    errorNP300 = 0;
    
    frontiere = probP300 - probNP300;
    for index = 1:numberNP300
        %fprintf('Index for NP300 = %f \n', index);
        point = test_nP300(index, :);
        answer = eval(subs(frontiere, [x1, x2], point));

        % Faux Positif
        if (answer >= 0)
            errorNP300 = errorNP300 + 1;
        end
    end
    fprintf('Finish NP300 \n');
    
    fprintf('Testing P300 on %f data... \n', numberP300);
    errorP300 = 0;
    for index = 1:numberP300
        %fprintf('Index for P300 = %f \n', index);
        point = test_P300(index, :);
        answer = eval(subs(frontiere, [x1, x2], point));

        % Faux négatif
        if (answer <= 0)
            errorP300 = errorP300 + 1;
        end
    end
    fprintf('Finish P300 \n');

    fprintf('=========================== \n');
    fprintf('Test : error NP300 = %.4f \n', ((errorNP300)/numberNP300) * 100);
    fprintf('Test : error P300 = %.4f \n', ((errorP300)/numberP300) * 100);
    fprintf('=========================== \n');

    fprintf('=========================== \n');
end

