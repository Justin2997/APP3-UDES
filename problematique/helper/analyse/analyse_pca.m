function analyse_pca(data)
[coeff, score,latent,~, explained] = pca(data)

decorrData = data * coeff;
figure
plot(data)
figure
plot(decorrData)

%show_4d(data)
%show_4d(decorrData)
end