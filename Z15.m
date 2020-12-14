% ������������� ����������� � �������������� ��������
% IMAGE RECOGNITION USING STANDARDS

clear
close all
clc

addpath('.\image');
addpath('.\function');
% ��������� 4 �����������
im1 = double(imread('6.bmp'));
im2 = double(imread('3.bmp'));
im3 = double(imread('5.bmp'));
im4 = double(imread('8.bmp'));
% ������� �� �������
[nRow1, nCol1, nColor1] = size(im1);
[nRow2, nCol2, nColor2] = size(im2);
[nRow3, nCol3, nColor3] = size(im3);
[nRow4, nCol4, nColor4] = size(im4);
% ������� �� �����
figure;
subplot(2,2,1);
imshow(im1,[]);
title("Image 1");
subplot(2,2,2);
imshow(im2,[]);
title("Image 2");
subplot(2,2,3);
imshow(im3,[]);
title("Image 3");
subplot(2,2,4);
imshow(im4,[]);
title("Image 4");

% "���������" ������ �������� ��� ���������
im1_10 = AWBG(im1, 10);
im1_5 = AWBG(im1, 5);
im1_1 = AWBG(im1, 1);
im1_01 = AWBG(im1, 0.1);

figure;
subplot(2,2,1);
imshow(im1_10,[]);
title("Noise SNR=10");
subplot(2,2,2);
imshow(im1_5,[]);
title("Noise SNR=5");
subplot(2,2,3);
imshow(im1_1,[]);
title("Noise SNR=1");
subplot(2,2,4);
imshow(im1_01,[]);
title("Noise SNR=0.1");

neIm1_1 = neImage(uint8(im1_1));
figure;
imshow(neIm1_1);
title("Negativ image 1");

% ������� ������������ ����������
corrCoefSNR10 = corrcoef(im1, im1_10);
corrCoefSNR5 = corrcoef(im1, im1_5);
corrCoefSNR1 = corrcoef(im1, im1_1);
corrCoefSNR01 = corrcoef(im1, im1_01);

% ���������� �����������
answer1 = recognize(im1_10, im1, im2, im3, im4);
answer2 = recognize(im1_5, im1, im2, im3, im4);
answer3 = recognize(im1_1, im1, im2, im3, im4);
answer4 = recognize(im1_01, im1, im2, im3, im4);
answerNe = recognize(double(neIm1_1), im1, im2, im3, im4);

fprintf("��� 10 ������� %d\n", answer1);
fprintf("��� 5 ������� %d\n", answer2);
fprintf("��� 1 ������� %d\n", answer3);
fprintf("��� 0.1 ������� %d\n", answer4);
fprintf("��� 1 � ������� ������� %d\n", answerNe);

rmpath('.\image');
rmpath('.\function');