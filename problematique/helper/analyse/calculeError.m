function [errorNP300, errorP300] = calculeError(probNP300, probP300, nP300, P300)
    syms x1 x2;

    errorNP300 = 0;
    for index = 1:500
        fprintf('Index for NP300 = %f \n', index);
        point = nP300(index, :);
        testP300 = eval(subs(probNP300, [x1, x2], point));
        testNP300 = eval(subs(probP300, [x1, x2], point));

        if (testNP300 < testP300)
            errorNP300 = errorNP300 + 1;
        end
    end
    
    errorP300 = 0;
    for index = 1:130
        fprintf('Index for P300 = %f \n', index);
        point = P300(index, :);
        testP300 = eval(subs(probNP300, [x1, x2], point));
        testNP300 = eval(subs(probP300, [x1, x2], point));

        if (testP300 < testNP300)
            errorP300 = errorP300 + 1;
        end
    end

    fprintf('=========================== \n');
    fprintf('Error NP300 = %.4f \n', (500 - errorNP300)/100);
    fprintf('Error P300 = %.4f \n', (130 - errorP300)/100);
end

