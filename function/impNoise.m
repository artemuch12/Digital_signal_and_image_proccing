function newImage = impNoise(image, threshold)

[nRow, nCol, nColor] = size(image);

newImage = zeros(nRow, nCol);

for y = 1:1:nRow
    for x = 1:1:nCol
        timeVar = unidrnd(100);
        if(timeVar > threshold)
            newImage(y,x) = image(y,x);
        else
            newImage(y,x) = uint8(255);
        end
    end
end
newImage = uint8(newImage);