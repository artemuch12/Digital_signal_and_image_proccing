clear
close all
clc

image = double(imread('face.bmp'));

figure;
imshow(image,[]);
title("�����������");
% ���������� ����� ��������� 15�15
newImage = adaptivCont (image, 15);

figure;
imshow(newImage,[]);
title("������������ �����������");
