function newImage = rasfokus(image, rad)
[nRow, nCol, nColor] = size(image);

impulse = impulseResponce(rad, nRow, nCol);

newImage = real(ifft2(fftshift(impulse).*fft2(image)));