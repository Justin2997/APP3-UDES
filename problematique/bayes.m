clear 
addpath("helper/");
addpath("helper/init");
addpath("helper/analyse");
addpath("helper/classification");
addpath("helper/classification/loiGaussienne");
addpath("donnees/");

[nP300, P300] = loadTrainingData();
[nP300_test, P300_test] = loadTestData();

propreNP300 = [nP300(:, 3), nP300(:, 4)];
propreP300 = [P300(:, 3), P300(:, 4)];

propreNP300_test = [nP300_test(:, 3), nP300_test(:, 4)];
propreP300_test = [P300_test(:, 3), P300_test(:, 4)];

alldata = [propreP300(:,:);propreNP300(:,:)];

[nP300_hist, nPXedge, nPYedge] = histcounts2(propreNP300(:,1),propreNP300(:,2));
[P300_hist, PXedge, PYedge]  = histcounts2(propreP300(:,1),propreP300(:,2));
[alldata_hist, AXedge, AYedge]  = histcounts2(alldata(:,1),alldata(:,2));

[P300_size,~] = size(P300);
[nP300_size,~] = size(nP300);
[alldata_size,~] = size(alldata);

P300_hist = P300_hist/P300_size;
nP300_hist = nP300_hist/nP300_size;
pX = alldata_hist/alldata_size;

CxP300 = P300_size/alldata_size;
CxnP300 = nP300_size/alldata_size;

erreur_np = 0;
for index = 1:length(propreNP300_test)
    pXc = get2DHistValue(P300_hist,PXedge,PYedge,propreNP300_test(index,:));
    npXc = get2DHistValue(nP300_hist,nPXedge,nPYedge,propreNP300_test(index,:));
    pX = get2DHistValue(alldata_hist,AXedge,AYedge,propreNP300_test(index,:));
    
    PCx3 = pXc*CxP300/pX;
    nPCx3 = npXc*CxnP300/pX;
    
    if nPCx3 < PCx3
        erreur_np = erreur_np + 1;
    end
end

erreur_p = 0;
for index = 1:length(propreP300_test)
    pXc = get2DHistValue(P300_hist,PXedge,PYedge,propreP300_test(index,:));
    npXc = get2DHistValue(nP300_hist,nPXedge,nPYedge,propreP300_test(index,:));
    pX = get2DHistValue(alldata_hist,AXedge,AYedge,propreP300_test(index,:));
    
    PCx3 = pXc*CxP300/pX;
    nPCx3 = npXc*CxnP300/pX;
    
    if nPCx3 > PCx3
        erreur_p = erreur_p + 1;
    end
end

erreur_p = erreur_p / length(propreP300_test);
erreur_np = erreur_np / length(propreNP300_test);