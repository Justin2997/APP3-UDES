function show_4d(data, data2)
figure
hold on

subplot(2,3,1)
hold on
title('Dimension 1 et 2')
scatter(data(:,1),data(:,2),10,'b','o')
scatter(data2(:,1),data2(:,2),10,'r','+')
xlabel('Dim 1')
ylabel('Dim 2')

subplot(2,3,2)
hold on
title('Dimension 1 et 3')
scatter(data(:,1),data(:,3),10,'b','o')
scatter(data2(:,1),data2(:,3),10,'r','+')
xlabel('Dim 1')
ylabel('Dim 3')

subplot(2,3,3)
hold on
title('Dimension 1 et 4')
scatter(data(:,1),data(:,4),10,'b','o')
scatter(data2(:,1),data2(:,4),10,'r','+')
xlabel('Dim 1')
ylabel('Dim 4')

subplot(2,3,4)
hold on
title('Dimension 2 et 3')
scatter(data(:,2),data(:,3),10,'b','o')
scatter(data2(:,2),data2(:,3),10,'r','+')
xlabel('Dim 2')
ylabel('Dim 3')

subplot(2,3,5)
hold on
title('Dimension 2 et 4')
scatter(data(:,2),data(:,4),10,'b','o')
scatter(data2(:,2),data2(:,4),10,'r','+')
xlabel('Dim 2')
ylabel('Dim 4')

subplot(2,3,6)

hold on
title('Dimension 3 et 4')
scatter(data(:,3),data(:,4),10,'b','o')
scatter(data2(:,3),data2(:,4),10,'r','+')
xlabel('Dim 3')
ylabel('Dim 4')

end