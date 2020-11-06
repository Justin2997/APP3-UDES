function [] = plotTrainingData(nP300, P300)
    figure;

    % Plot NP300 
    subplot(4, 2, 1);
    plot(nP300(:, 1), "x");
    subplot(4, 2, 3);
    plot(nP300(:, 2), "x");
    subplot(4, 2, 5);
    plot(nP300(:, 3), "x");
    subplot(4, 2, 7);
    plot(nP300(:, 4), "x");

    % Plot P300
    subplot(4, 2, 2);
    plot(P300(:, 1), "o");
    subplot(4, 2, 4);
    plot(P300(:, 2), "o");
    subplot(4, 2, 6);
    plot(P300(:, 3), "o");
    subplot(4, 2, 8);
    plot(P300(:, 4), "o");


    sgtitle("Simple Training Data");
    
    
    % Plot in 4D
    figure;
    hold on
    scatter3(nP300(:, 1), nP300(:, 2), nP300(:, 3), 40, nP300(:, 4), "o");
    scatter3(P300(:, 1), P300(:, 2), P300(:, 3), 40, P300(:, 4), "x");

    % Plot avec les 2 dimentions importants
    figure;
    hold on
    plot(P300(:, 2), P300(:, 3), "o");
    plot(nP300(:, 2), nP300(:, 3), "x");
    
    % Histogramme
    figure;
    hold on
    histogram(P300(:, 3));
    histogram(P300(:, 4));
    histogram(nP300(:, 3));
    histogram(nP300(:, 4));
end

