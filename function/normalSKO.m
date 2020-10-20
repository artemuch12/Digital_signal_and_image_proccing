function sko = normalSKO(image, newImage)
[nRow, nCol, ~] = size(image);
sko = (sum(sum((image-newImage).^2))/(nRow*nCol))/var(image(:));