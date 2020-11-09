function [errorNP300, errorP300] = calculeErrorGaussiennes(probNP300, probP300, nP300, P300)
    syms x1 x2;
    
    numberNP300 = 130;
    numberP300 = 130;

    
    fprintf('=========================== \n');
    fprintf('Training \n');
    
    fprintf('Testing NP300 on %f data... \n', numberNP300);
    errorNP300 = 0;
    for index = 1:numberNP300
        % fprintf('Index for NP300 = %f \n', index);
        point = nP300(index, :);
        testP300 = eval(subs(probP300, [x1, x2], point));
        testNP300 = eval(subs(probNP300, [x1, x2], point));

        % Faux positif
        if (testNP300 < testP300)
            errorNP300 = errorNP300 + 1;
        end
    end
    fprintf('Finish NP300 \n');
    
    fprintf('Testing P300 on %f data... \n', numberP300);
    errorP300 = 0;
    for index = 1:numberP300
        %fprintf('Index for P300 = %f \n', index);
        point = P300(index, :);
        testP300 = eval(subs(probP300, [x1, x2], point));
        testNP300 = eval(subs(probNP300, [x1, x2], point));
        %testNP300 = testNP300/3;

        % Faux négatif
        if (testP300 < testNP300)
            errorP300 = errorP300 + 1;
        end
    end
    fprintf('Finish P300 \n');

    fprintf('=========================== \n');
    fprintf('Training : error NP300 = %.4f \n', ((numberNP300 - errorNP300)/numberNP300) * 100);
    fprintf('Training : error P300 = %.4f \n', ((numberP300 - errorP300)/numberP300) * 100);
    fprintf('=========================== \n');

    fprintf('=========================== \n');
end

