% ƒ»— –≈“»«¿÷»ﬂ » ¬Œ——“¿ÕŒ¬À≈Õ»≈ »«Œ¡–¿∆≈Õ»…
% IMAGE SAMPLING AND RECOVERY

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = double(imread('face.bmp'));
[nRow, nCol, nColor] = size(image);

discImage2 = double(discretImage(image, 2));
discImage4 = double(discretImage(image, 4));
discImage8 = double(discretImage(image, 8));

figure;
subplot(2,2,1);
imshow(image,[]);
title('Original Image Face');
subplot(2,2,2);
imshow(discImage2,[]);
title('Discretization image with step 2');
subplot(2,2,3);
imshow(discImage4,[]);
title('Discretization image with step 4');
subplot(2,2,4);
imshow(discImage8,[]);
title('Discretization image with step 8');

amImage = log(amplitudeSpectr(image)+1);
amDiscImage2 = log(amplitudeSpectr(discImage2)+1);
amDiscImage4 = log(amplitudeSpectr(discImage4)+1);
amDiscImage8 = log(amplitudeSpectr(discImage8)+1);

figure;
subplot(2,2,1);
imshow(amImage, []);
title('Amplitude spector image');
subplot(2,2,2);
imshow(amDiscImage2, []);
title('Amplitude spector image with step 2');
subplot(2,2,3);
imshow(amDiscImage4, []);
title('Amplitude spector image with step 4');
subplot(2,2,4);
imshow(amDiscImage8, []);
title('Amplitude spector image with step 8');

inImage2 = interpImage(discImage2, 2);
inImage4 = interpImage(discImage4, 4);
inImage8 = interpImage(discImage8, 8);

figure;
subplot(2,2,1);
imshow(image,[]);
title('Original Image Face');
subplot(2,2,2);
imshow(inImage2,[]);
title('Rebuilt image with step 2');
subplot(2,2,3);
imshow(inImage4,[]);
title('Rebuilt image with step 4');
subplot(2,2,4);
imshow(inImage8,[]);
title('Rebuilt image with step 8');

sko2 = normalSKO(double(image), inImage2);
sko4 = normalSKO(double(image), inImage4);
sko8 = normalSKO(double(image), inImage8);

fprintf('\n');
fprintf('Normal SKO for step 2 equals %d\n', sko2);
fprintf('Normal SKO for step 4 equals %d\n', sko4);
fprintf('Normal SKO for step 8 equals %d\n', sko8);

rmpath('.\image');
rmpath('.\function');