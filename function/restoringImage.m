function newImage = restoringImage(image, rad)

[nRow, nCol, nColor] = size(image);
time = koefInvFil(rad, nRow, nCol);
newImage = real(ifft2(time.*fft2(image)));