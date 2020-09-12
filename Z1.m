clear
close all
clc

% Adding paths for images
addpath('.\image');

% Read original image
image = imread('CASTLE.bmp');

% Take size original image
[nRow, nCol, nColor] = size(image);

% Output image and it nColor components
figure;
imageR = image(:,:,1);
imageG = image(:,:,2);
imageB = image(:,:,3);

imshow(image);
title('Castle.bmp');
figure;
imshow(imageR);
title('RED');
figure;
imshow(imageG);
title('GREEN');
figure;
imshow(imageB);
title('BLUE');

% Receive strings from nColor image components 
StringR = image(255,:,1);
StringG = image(255,:,2);
StringB = image(255,:,3);
figure;
hold on
plot(StringR, 'r');
plot(StringG, 'g');
plot(StringB, 'b');
legend('StringR','StringG','StringB');
title('');
hold off

% Receive nColumn from nColor image components 
nColR = image(:,255,1);
nColG = image(:,255,2);
nColB = image(:,255,3);
figure;
hold on
plot(nColR, 'r');
plot(nColG, 'g');
plot(nColB, 'b');
legend('nColR','nColG','nColB');
title('nColumn');
hold off

% Cut fragment image
image25x25g = image(25:150, 25:150, 2);
figure;
surf(image25x25g);

% Closing all open paths
rmpath('.\image');