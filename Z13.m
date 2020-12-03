% ��������� ������ ��������� ��������
% THE METHODS OF ALLOCATION OF CONTOURS

clear
close all
clc

addpath('.\image');
addpath('.\function');

% �������� ������������� �����������
image = double(imread('len.bmp'));
[nRow, nCol, nColor] = size(image);
figure;
imshow(image,[]);
title("Original Image Face");

% ����� ��� ������ �������
matrix = [0 1 0
          1 -4 1
          0 1 0];
      
% ������������� ��������
gradImage = gradMetod(image);
laplaceMethod = conv2(matrix, image);

% ����� ����������� � ��������� 
figure;
subplot(1,2,1);
imshow(gradImage,[]);
title("Dragient method");
subplot(1,2,2);
imshow(laplaceMethod,[]);
title("Laplace method");

% ���������������� �����������, ���������� � ��������� 0..255
minImage = min(min(gradImage));
maxImage = max(max(gradImage));
gradImage = uint8(round((gradImage-minImage)/(maxImage-minImage).*255));

minImage = min(min(laplaceMethod));
maxImage = max(max(laplaceMethod));
laplaceMethod = uint8(round((laplaceMethod-minImage)/...
                (maxImage-minImage).*255));

% ��������� ��������� ����������� (������������� ������������� �������)
hystoGrad = histogramMy(gradImage);
hystoLaplace = histogramMy(laplaceMethod);

% ��������� ������������ ������� ����������� (������������� ������������� 
% �������)
empGrad = empirFunction(hystoGrad);
empLaplace = empirFunction(hystoLaplace);
figure;
subplot(1,2,1);
plot(empGrad);
subplot(1,2,2);
plot(empLaplace);

% ����������� ������� ��� ����������� ����������� �� �� ������������
% ��������. �������� ������������ ������� ��� ������. 
thr = 0.5;
thrGrad = thresholdEmperFunction(empGrad, thr);
thrLaplace = thresholdEmperFunction(empLaplace, thr);
fprintf("Threshold for Gradient methode equals: %.f\n", thrGrad);
fprintf("Threshold for Laplace methode equals: %.f\n", thrLaplace);

% ����������� ����������� �� ������� (������������� ������������� 
% �������)
binGrad = binImage(gradImage, thrGrad);
binLaplace = binImage(laplaceMethod, thrLaplace);

figure;
subplot(1,2,1);
imshow(binGrad,[]);
title("Dragient method");
subplot(1,2,2);
imshow(binLaplace,[]);
title("Laplace method");

rmpath('.\image');
rmpath('.\function');