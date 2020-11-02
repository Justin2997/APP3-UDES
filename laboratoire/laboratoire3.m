clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
%clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
imtool close all;	% Close all figure windows created by imtool.
format long g;
format compact;
fontSize = 20;
addpath("PointsC1C2C3/");
addpath("baseDeDonneesImages/");

% Question 1
load C1.txt
load C2.txt
load C3.txt

figure;
plot(C1(:, 1), C1(:, 2), "+", C2(:, 1), C2(:, 2), "*", C3(:, 1), C3(:, 2), "o");

% Question 2
syms x1 x2; x = [x1;x2];

meanC1 = (x - mean(C1)');
meanC2 = (x - mean(C2)');
meanC3 = (x - mean(C3)');

probC1 = (1/sqrt(det(cov(C1))*(2*pi)^2)).*exp(-0.5 * meanC1' * inv(cov(C1))* meanC1);
probC2 = (1/sqrt(det(cov(C2))*(2*pi)^2)).*exp(-0.5 * meanC2' * inv(cov(C2))* meanC2);
probC3 = (1/sqrt(det(cov(C3))*(2*pi)^2)).*exp(-0.5 * meanC3' * inv(cov(C3))* meanC3);

c1Vc2 = probC1 - probC2; 
c1Vc3 = probC1 - probC3; 
c2Vc3 = probC2 - probC3;

figure
hold on
ezplot(c1Vc2)
ezplot(c1Vc3)
ezplot(c2Vc3)
plot(C1(:,1),C1(:,2), "xb")
plot(C2(:,1),C2(:,2), "xr")
plot(C3(:,1),C3(:,2), "xg")

% Question 5
nomberError = 0;
for index = 1:100
    fprintf('Index = %f \n', index)
    
    point = C1(index, :);
    testC1 = eval(subs(probC1, [x1, x2], point));
    testC2 = eval(subs(probC2, [x1, x2], point));
    testC3 = eval(subs(probC3, [x1, x2], point));
    
    if (testC1 > testC2) && (testC1 > testC3)
        nomberError = nomberError + 1;
    end
end
fprintf('Error C1 = %.4f \n', (100 - nomberError)/100)

nomberError = 0;
for index = 1:100
    fprintf('Index = %f \n', index)
    
    point = C2(index, :);
    testC1 = eval(subs(probC1, [x1, x2], point));
    testC2 = eval(subs(probC2, [x1, x2], point));
    testC3 = eval(subs(probC3, [x1, x2], point));
    
    if (testC2 > testC1) && (testC2 > testC1)
        nomberError = nomberError + 1;
    end
end
fprintf('Error C2 = %.4f \n', (100 - nomberError)/100)
