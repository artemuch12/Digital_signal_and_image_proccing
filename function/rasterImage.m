function outImage = rasterImage(image, Ra)
[nRow, nCol, nColor] = size(image);
if nColor ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

[rRow, rCol, ~] = size(Ra);
if rRow ~= rCol
    error('Input the disturbance  matrix  is not square');
end
if (rRow > nRow) || (rCol > nCol)
    error('The disturbance matrix greater size input image!');
end

outImage = image;
sredY = ceil(rRow/2);
sredX = ceil(rCol/2);
for y = sredY:rRow:nRow
    for x = sredX:rCol:nCol
        outImage(y-sredY+1:y+sredY-1,x-sredX+1:x+sredX-1) = ...
            uint8(double(outImage(y-sredY+1:y+sredY-1,...
            x-sredX+1:x+sredX-1))+Ra);
    end
end
