% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [hist_Coast, hist_Forest, hist_Street] = CI_generationHistogrammes(S_Coast, S_Forest, S_Street)

for i = 1:3
   FullHistogramme = [0 0 0];
    
   switch i
       case 1
           vector = S_Coast';
       case 2
           vector = S_Forest';
       case 3
           vector = S_Street';
   end
       
   for h = 2:numel(vector)  % numel(S_FullVector) % Semble trop grands maybe ?  Plante a h=361
        nBins = 256; % nb de bins de l'histogramme
        image = vector(h).data;

        comp1Hist = imhist(image(:,:,1), nBins);
        comp2Hist = imhist(image(:,:,2), nBins);
        comp3Hist = imhist(image(:,:,3), nBins);

        hist3Composantes = [comp1Hist comp2Hist comp3Hist];

        FullHistogramme =  FullHistogramme + hist3Composantes;
   end
   
    switch i
       case 1
           hist_Coast = FullHistogramme;
       case 2
           hist_Forest = FullHistogramme;
       case 3
           hist_Street = FullHistogramme;
    end
    
    hFig = figure;
    hold on

    h(1) = stem(1:256, FullHistogramme(:,1),'r'); % Coast
    h(2) = stem(1:256, FullHistogramme(:,2),'g'); % Forest
    h(3) = stem(1:256, FullHistogramme(:,3),'b'); % Street
    title('Superposition des 3 histogrammes');
    hold off
end