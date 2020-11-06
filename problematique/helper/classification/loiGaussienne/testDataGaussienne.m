function [errorNP300, errorP300] = testDataGaussienne(probNP300, probP300, test_nP300, test_P300)
    syms x1 x2;
    
    numberNP300 = 30;
    numberP300 = 30;

    errorNP300 = 0;
    for index = 1:numberNP300
        fprintf('Index for NP300 = %f \n', index);
        point = test_nP300(index, :);
        testP300 = eval(subs(probP300, [x1, x2], point));
        testNP300 = eval(subs(probNP300, [x1, x2], point));

        % Faux Positif
        if (testNP300 < testP300)
            errorNP300 = errorNP300 + 1;
        end
    end
    
    errorP300 = 0;
    for index = 1:numberP300
        fprintf('Index for P300 = %f \n', index);
        point = test_P300(index, :);
        testP300 = eval(subs(probP300, [x1, x2], point));
        testNP300 = eval(subs(probNP300, [x1, x2], point));
        %testNP300 = testNP300/3;

        % Faux négatif
        if (testP300 < testNP300)
            errorP300 = errorP300 + 1;
        end
    end

    fprintf('=========================== \n');
    fprintf('Test : error NP300 = %.4f \n', (numberNP300 - errorNP300)/numberNP300) * 100;
    fprintf('Test : error P300 = %.4f \n', (numberP300 - errorP300)/numberP300) * 100;
end

