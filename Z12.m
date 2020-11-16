% �������������� �������-���������� ����������� ��������� ��������
% RESTORING LINEARLY DISTORTED IMAGES WITH AN INVERSE FILTER

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = double(imread('len.bmp'));
[nRow, nCol, nColor] = size(image);
figure;
imshow(image,[]);
title("Original Image Face");

rasImage5 = rasfokus(image, 5);
rasImage10 = rasfokus(image, 10);
rasImage20 = rasfokus(image, 20);

figure;
subplot(2,2,1);
imshow(rasImage5, []);
title("Distortions from 5");
subplot(2,2,2);
imshow(rasImage10, []);
title("Distortions from 10");
subplot(2,2,3);
imshow(rasImage20, []);
title("Distortions from 20");

imwrite(rasImage5, 'rasImage5.bmp');
imwrite(rasImage10, 'rasImage10.bmp');
imwrite(rasImage20, 'rasImage20.bmp');

resImage5 = restoringImage(rasImage5, 5);
resImage10 = restoringImage(rasImage10, 10);
resImage20 = restoringImage(rasImage20, 20);

figure;
subplot(2,2,1);
imshow(resImage5, []);
title("Distortions from 5");
subplot(2,2,2);
imshow(resImage10, []);
title("Distortions from 10");
subplot(2,2,3);
imshow(resImage20, []);
title("Distortions from 20");


rmpath('.\image');
rmpath('.\function');