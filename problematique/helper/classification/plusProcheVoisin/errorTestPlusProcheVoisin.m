function [errorNP300, errorP300] = errorTestPlusProcheVoisin(test_nP300, test_P300, baricentreNP300, baricentreP300, k)
    %% Initialisation
    errorNP300 = 0;
    errorP300 = 0;
    
    numberPointNP300 = 0;
    numberPointP300 = 0;
    
    test_nP300size = size(test_nP300, 1);
    test_P300size = size(test_P300, 1);
    
    for index = 1:test_P300size  
        %% Calcule de la distance
        A = test_P300(index, :);
        temp_nP300 = baricentreNP300;
        temp_P300  = baricentreP300;
        
        for kIndex = 1:k
            distance_from_P300 = sum((temp_P300 - A) .^ 2, 2);
            distance_from_NP300 = sum((temp_nP300 - A) .^ 2, 2);
        
            min_distance_from_P300 = min(distance_from_P300);
            min_distance_from_NP300 = min(distance_from_NP300);
            
            if (min_distance_from_P300 < min_distance_from_NP300)
                numberPointP300 = numberPointP300 + 1;
                temp_P300(distance_from_P300 == min(distance_from_P300),:) = [];
            else
                numberPointNP300 = numberPointNP300 + 1;
                temp_nP300(distance_from_NP300 == min(distance_from_NP300),:) = [];
            end
        end
        
        if (numberPointP300 < numberPointNP300)
            errorP300 = errorP300 + 1;
        end
        
        numberPointP300 = 0;
        numberPointNP300 = 0;
    end
    
    for index = 1:test_nP300size  
        %% Calcule de la distance
        A = test_nP300(index, :);
        temp_nP300 = baricentreNP300;
        temp_P300  = baricentreP300;
        
        for kIndex = 1:k
            distance_from_P300 = sum((temp_P300 - A) .^ 2, 2);
            distance_from_NP300 = sum((temp_nP300 - A) .^ 2, 2);
        
            min_distance_from_P300 = min(distance_from_P300);
            min_distance_from_NP300 = min(distance_from_NP300);
            
            if (min_distance_from_P300 < min_distance_from_NP300)
                numberPointP300 = numberPointP300 + 1;
                temp_P300(distance_from_P300 == min(distance_from_P300),:) = [];
            else
                numberPointNP300 = numberPointNP300 + 1;
                temp_nP300(distance_from_NP300 == min(distance_from_NP300),:) = [];
            end
        end
        
        if (numberPointP300 > numberPointNP300)
            errorNP300 = errorNP300 + 1;
        end
        
        numberPointP300 = 0;
        numberPointNP300 = 0;
    end
    
    fprintf('=========================== \n');
    fprintf('Test                  \n');
    fprintf('K              = %.4f \n', k);
    fprintf('Error P300     = %.4f \n', ((errorP300)/test_P300size) * 100);
    fprintf('Error NP300    = %.4f \n', ((errorNP300)/test_nP300size) * 100);
    fprintf('=========================== \n');
end

