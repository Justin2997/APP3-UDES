function show_4d(data)
figure

subplot(2,2,1)
title('Dimension 1')
plot(data(:,1))

subplot(2,2,2)
title('Dimension 2')
plot(data(:,2))

subplot(2,2,3)
title('Dimension 3')
plot(data(:,3))

subplot(2,2,4)
title('Dimension 4')
plot(data(:,4))
end