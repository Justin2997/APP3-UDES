% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function [erreur_p_entrainement, erreur_np_entrainement, erreur_p_test, erreur_np_test, inconnue_p, inconnue_np] = erreurBayes(propreNP300_test, propreP300_test, propreNP300,  propreP300, inconnue)
alldata = [propreP300(:,:);propreNP300(:,:)];

[nP300_hist, nPXedge, nPYedge] = histcounts2(propreNP300(:,1),propreNP300(:,2));
[P300_hist, PXedge, PYedge]  = histcounts2(propreP300(:,1),propreP300(:,2));
[alldata_hist, AXedge, AYedge]  = histcounts2(alldata(:,1),alldata(:,2));

P300_size = length(propreP300);
nP300_size = length(propreNP300);
alldata_size = length(alldata);

P300_hist = P300_hist/P300_size;
nP300_hist = nP300_hist/nP300_size;
alldata_hist = alldata_hist/alldata_size;

CxP300 = P300_size/alldata_size;
CxnP300 = nP300_size/alldata_size;

erreur_np_test = 0;
erreur_p_test = 0;
erreur_p_entrainement = 0;
erreur_np_entrainement = 0;
inconnue_p = 0;
inconnue_np = 0;

fprintf('=========================== \n');
fprintf('Training \n');

fprintf('Testing NP300 on %f data... \n', length(propreNP300));

for index = 1:length(propreNP300)
    [PCx3, nPCx3] = bayes(P300_hist,PXedge,PYedge, nP300_hist,nPXedge,nPYedge,alldata_hist,AXedge,AYedge, CxP300, CxnP300, propreNP300(index,:));
    if nPCx3 <= PCx3
        erreur_np_entrainement = erreur_np_entrainement + 1;
    end
end
fprintf('Finish NP300 \n');

fprintf('Testing P300 on %f data... \n', length(propreP300));

for index = 1:length(propreP300)
    [PCx3, nPCx3] = bayes(P300_hist,PXedge,PYedge, nP300_hist,nPXedge,nPYedge,alldata_hist,AXedge,AYedge, CxP300, CxnP300, propreP300(index,:));

    if nPCx3 >= PCx3
        erreur_p_entrainement = erreur_p_entrainement + 1;
    end
end

fprintf('Finish P300 \n');


erreur_p_entrainement = erreur_p_entrainement / length(propreP300);
erreur_np_entrainement = erreur_np_entrainement / length(propreNP300);

fprintf('=========================== \n');
fprintf('Training : error NP300 = %.4f \n', (erreur_np_entrainement * 100));
fprintf('Training : error P300 = %.4f \n', (erreur_p_entrainement * 100));
fprintf('=========================== \n');


fprintf('=========================== \n');
fprintf('Test \n');

fprintf('Testing NP300 on %f data... \n', length(propreNP300_test));

for index = 1:length(propreNP300_test)
    [PCx3, nPCx3] = bayes(P300_hist,PXedge,PYedge, nP300_hist,nPXedge,nPYedge,alldata_hist,AXedge,AYedge, CxP300, CxnP300, propreNP300_test(index,:));
    if nPCx3 <= PCx3
        erreur_np_test = erreur_np_test + 1;
    end
end

fprintf('Finish NP300 \n');

fprintf('Testing P300 on %f data... \n', length(propreP300_test));

for index = 1:length(propreP300_test)
    [PCx3, nPCx3] = bayes(P300_hist,PXedge,PYedge, nP300_hist,nPXedge,nPYedge,alldata_hist,AXedge,AYedge, CxP300, CxnP300, propreP300_test(index,:));

    if nPCx3 >= PCx3
        erreur_p_test = erreur_p_test + 1;
    end
end

 fprintf('Finish P300 \n');

fprintf('=========================== \n');
fprintf('Test : error NP300 = %.4f \n', ((erreur_np_test)/length(propreNP300_test)) * 100);
fprintf('Test : error P300 = %.4f \n', ((erreur_p_test)/length(propreP300_test)) * 100);
fprintf('=========================== \n');



fprintf('=========================== \n');
fprintf('Inconnu \n');

fprintf('Testing Inconnu on %f data... \n', length(inconnue));

for index = 1:length(inconnue)
    [PCx3, nPCx3] = bayes(P300_hist,PXedge,PYedge, nP300_hist,nPXedge,nPYedge,alldata_hist,AXedge,AYedge, CxP300, CxnP300, inconnue(index,:));

    if nPCx3 >= PCx3
        inconnue_p = inconnue_p + 1;
    else
       inconnue_np = inconnue_np + 1;
    end
end


fprintf('Finish Inconnu \n');
    
fprintf('=========================== \n');
fprintf('Inconnu : NP300 = %.4f \n', inconnue_np);
fprintf('Inconnu : P300 = %.4f \n', inconnue_p);
fprintf('=========================== \n');

fprintf('=========================== \n');

end