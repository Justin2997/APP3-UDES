function [] = plotTrainingData(nP300, P300)
    figure;

    % Plot NP300 
    subplot(4, 2, 1);
    plot(nP300(:, 1), "o");
    subplot(4, 2, 3);
    plot(nP300(:, 2), "o");
    subplot(4, 2, 5);
    plot(nP300(:, 3), "o");
    subplot(4, 2, 7);
    plot(nP300(:, 4), "o");

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
end

