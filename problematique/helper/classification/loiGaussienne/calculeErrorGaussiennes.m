function [errorNP300, errorP300] = calculeErrorGaussiennes(probNP300, probP300, nP300, P300)
    syms x1 x2;
    
    numberNP300 = 500;
    numberP300 = 130;

    errorNP300 = 0;
    for index = 1:numberNP300
        fprintf('Index for NP300 = %f \n', index);
        point = nP300(index, :);
        testP300 = eval(subs(probNP300, [x1, x2], point));
        testNP300 = eval(subs(probP300, [x1, x2], point));

        if (testNP300 < testP300)
            errorNP300 = errorNP300 + 1;
        end
    end
    
    errorP300 = 0;
    for index = 1:numberP300
        fprintf('Index for P300 = %f \n', index);
        point = P300(index, :);
        testP300 = eval(subs(probNP300, [x1, x2], point));
        testNP300 = eval(subs(probP300, [x1, x2], point));

        if (testP300 < testNP300)
            errorP300 = errorP300 + 1;
        end
    end

    fprintf('=========================== \n');
    fprintf('Training : error NP300 = %.4f % \n', (numberNP300 - errorNP300)/numberNP300) * 100;
    fprintf('Training : error P300 = %.4f % \n', (numberP300 - errorP300)/numberP300) * 100;
end

