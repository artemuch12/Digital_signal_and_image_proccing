function newImage = medianFilter(image)

[nRow, nCol, nColor] = size(image);

newImage = zeros(nRow, nCol);
frame = zeros(3, 3);
step = -1:1;
for y = 2:nRow-1
    for x = 2:nCol-1
            frame = image(y+step, x+step);
            frame = sort(frame(:));
            newImage(y,x) = frame(5);
    end
end
newImage = uint8(newImage);