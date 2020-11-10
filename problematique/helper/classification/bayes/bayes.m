function [PCx3, nPCx3] = bayes(P300_hist,PXedge,PYedge, nP300_hist,nPXedge,nPYedge,alldata_hist,AXedge,AYedge, CxP300, CxnP300, point)

pXc = get2DHistValue(P300_hist,PXedge,PYedge,point);
npXc = get2DHistValue(nP300_hist,nPXedge,nPYedge,point);
pX = get2DHistValue(alldata_hist,AXedge,AYedge,point);
    
PCx3 = pXc*CxP300/pX * 3;
nPCx3 = npXc*CxnP300/pX;

end