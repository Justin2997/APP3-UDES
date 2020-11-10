% Author: Justin Brulotte, Gabriel Bouchard, Sébastien Pomerleau
% Université de Sherbrooke, APP3 S8GIA, A2020

function value = get2DHistValue(hist, Xbin, Ybin, point)
    x = point(1);
    y = point(2);

    idx = find(Xbin > x,1);

    idy = find(Ybin > y,1);

    idx = idx - 1;
    idy = idy - 1;

    if isempty(idy) || isempty(idx) || idy == 0 || idx == 0
        value = 0;
    else
        value = hist(idx,idy);
    end
end