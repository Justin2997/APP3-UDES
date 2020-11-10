function analysePCA(data)
[coeff, score,latent,~, explained] = pca(data);

decorrData = coeff' * data';
decorrData = (decorrData)';

figure
plot(data)
legend('Dim 1','Dim 2','Dim 3','Dim 4')
figure
plot(decorrData)
legend('Dim 1','Dim 2','Dim 3','Dim 4')

%show_4d(data)
%show_4d(decorrData)
end