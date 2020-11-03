% »——À≈ƒŒ¬¿Õ»≈ –ŒÀ» ‘¿«Œ¬Œ√Œ —œ≈ “–¿ ¬ «¿ƒ¿◊≈ Œ¡–¿¡Œ“ » »«Œ¡–¿∆≈Õ»…
% INVESTIGATION OF THE ROLE OF THE PHASE SPECTRUM IN IMAGE PROCESSING
clear
close all
clc

addpath('.\image');
addpath('.\function');

imageFace = imread('face.bmp');
[nRowFace, nColFace, nColorFace] = size(imageFace);
figure;
imshow(imageFace);
title('Original Image Face');

imageLen = imread('len.bmp');
[nRowLen, nColLen, nColorLen] = size(imageLen);
figure;
imshow(imageLen);
title('Original Image Len');

amSpectrFace = amplitudeSpectr(imageFace);
amSpectrLen = amplitudeSpectr(imageLen);

phSpectrFace = phaseSpectr(imageFace);
phSpectrLen = phaseSpectr(imageLen);

imageSynOne = synthesisImage(amSpectrFace, phSpectrLen);
imageSynTwo = synthesisImage(amSpectrLen, phSpectrFace);
figure;
imshow(imageSynOne);
title('AM-Face, PH-Len');
figure;
imshow(imageSynTwo);
title('AM-Len, PH-Face');

imageSynPhase = synthesisOnPhaseImage(phSpectrLen);
figure;
imshow(imageSynPhase);
title('The synthesize image on phase spectrum the image Len');
imageSynPhase = synthesisOnPhaseImage(phSpectrFace);
figure;
imshow(imageSynPhase);
title('The synthesize image on phase spectrum the image Face');

rmpath('.\image');
rmpath('.\function');