function [errorNP300, errorP300] = errorTestPlusProcheVoisin(test_nP300, test_P300, nP300, P300, k)
    %% Initialisation
    errorNP300 = 0;
    errorP300 = 0;
    
    numberPointNP300 = 0;
    numberPointP300 = 0;
    
    % TODO : Enlever le resample
    % nP300 = resample(nP300, 1, 4);
    
    test_nP300size = size(test_nP300, 1);
    test_P300size = size(test_P300, 1);
    
    for index = 1:test_P300size  
        %% Calcule de la distance
        A = test_P300(index, :);
        temp_nP300 = nP300;
        temp_P300  = P300;
        
        for kIndex = 1:k %% TODO Not sure this should be k + 1
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
            errorP300 = errorP300 + 1;
        end
        
        %fprintf('=========================== \n');
        %fprintf('Points P300  = %.4f, %.4f \n', A(1, 1), A(1, 2));
        %fprintf('Voisin P300 = %.4f \n', numberPointP300);
        %fprintf('Voisin NP300  = %.4f \n', numberPointNP300);
        %fprintf('=========================== \n');
        
        numberPointP300 = 0;
        numberPointNP300 = 0;
    end
    
    for index = 1:test_nP300size  
        %% Calcule de la distance
        A = test_nP300(index, :);
        temp_nP300 = nP300;
        temp_P300  = P300;
        
        for kIndex = 1:k %% TODO Not sure this should be k + 1
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
            errorNP300 = errorNP300 + 1;
        end
        
        %fprintf('=========================== \n');
        %fprintf('Points P300  = %.4f, %.4f \n', A(1, 1), A(1, 2));
        %fprintf('Voisin P300 = %.4f \n', numberPointP300);
        %fprintf('Voisin NP300  = %.4f \n', numberPointNP300);
        %fprintf('=========================== \n');
        
        numberPointP300 = 0;
        numberPointNP300 = 0;
    end
    
    fprintf('=========================== \n');
    fprintf('K              = %.4f \n', k);
    fprintf('Error P300     = %.4f \n', ((test_P300size - errorP300)/test_P300size) * 100);
    fprintf('Error NP300    = %.4f \n', ((test_nP300size - errorNP300)/test_nP300size) * 100);
    fprintf('=========================== \n');
end

