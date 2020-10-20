% Œ÷≈Õ»¬¿Õ»≈ —œ≈ “–¿À‹ÕŒ… œÀŒ“ÕŒ—“» ÃŒŸÕŒ—“» »  Œ––≈Àﬂ÷»ŒÕÕŒ… ‘”Õ ÷»» 
% »«Œ¡–¿∆≈Õ»ﬂ
% ESTIMATION OF POWER SPECTRAL DENSITY AND THE CORRELATION FUNCTION OF 
% THE IMAGE

clear
close all
clc

addpath('.\image');
addpath('.\function');

image = imread('face.bmp');
[nRow, nCol, nColor] = size(image);
figure;
imshow(image);
title('Original Image Face');

sred = sum(sum(double(image)))/(nRow*nCol);
imageCentr = double(image) - sred;
PSDimage = abs(fft2(imageCentr)).^2;
AUTOCorrol = ifft2(PSDimage);

PSDCol1 = abs(fft(double(image(:,1)) - sum(double(image(:,1)))/nCol)).^2;
AUTOCorrolCol = ifft(PSDCol1);

time = abs(fft(double(image) - repmat(mean2(double(image)), nRow))).^2;
PSDCols = zeros(size(PSDCol1));
for y = 1:nRow
    PSDCols(y,1) = sum(time(y,:))/nCol;
end

AUTOCorrolCols = zeros(size(AUTOCorrolCol));
time = ifft(time);
for y = 1:nRow
    AUTOCorrolCols(y,1) = sum(time(y,:))/nCol;
end

figure;
imshow(log(PSDimage+1),[]);
title('Assessment PSD image');
figure;
subplot(1,2,1);
imshow(AUTOCorrol, []);
subplot(1,2,2);
mesh(AUTOCorrol);
title('Two-dimensional image correlation function');
figure;
plot(PSDCol1);
hold on;
title('Assessment PSD ');
plot(PSDCols);
legend('One column', 'Median in column image')
hold off;

figure;
plot(AUTOCorrolCol);
hold on;
title('Correlation function');
plot(AUTOCorrolCols);
legend('One column', 'Median in column image')
hold off;


rmpath('.\image');
rmpath('.\function');