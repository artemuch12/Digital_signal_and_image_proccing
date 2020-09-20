% Ã≈“Œƒ œ–≈Œ¡–¿«Œ¬¿Õ»ﬂ √»—“Œ√–¿ÃÃ »«Œ¡–¿∆≈Õ»…
% METHOD FOR CONVERTING IMAGE HISTOGRAMS

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = imread('face.bmp');
[nRow, nCol, nColor] = size(image);
figure;
imshow(image);
title("Original Image");

[contrastImage,~] = linContrast(image);
histo = histogramMy(contrastImage);
empFunct = empirFunction(histo);
figure;
imshow(contrastImage);
title("Contrast Image");
figure;
plot(histo);
title("Histogram the contrast image");
figure;
plot(empFunct);
title("Empirical function the contrast image");

ecvImage = ecvalingImage(contrastImage,  empFunct);
figure;
imshow(ecvImage);
title("Equalized the contrast image");
ecvImageOrigin = ecvalingImage(image,  empFunct);
figure;
imshow(ecvImage);
title("Equalized the origin image");
histoEcvImage = histogramMy(ecvImage);
empFunctEcvImage = empirFunction(histoEcvImage);
figure;
plot(empFunctEcvImage);
title("Empirical function the equalized image");


rmpath('.\image');
rmpath('.\function');