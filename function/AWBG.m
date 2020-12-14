function imNoise = AWBG(image, snr)

[nRow, nCol] = size(image);

disperImage = var(image(:));
stdNoise = sqrt(disperImage/snr);
imNoise = image + normrnd(0, stdNoise, [nRow nCol]);