function rustImage = rustrImage(image, Ra)

[col, row, color] = size(image);
[Rcol, Rrow] = size(Ra);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

rustImage = image;
sredY = ceil(Rcol/2);
sredX = ceil(Rrow/2);
for y = sredY:sredY:col
    for x = sredX:sredX:row
        rustImage(y-sredY+1:y+sredY-1,x-sredX+1:x+sredX-1) = ...
            uint8(double(rustImage(y-sredY+1:y+sredY-1,x-sredX+1:x+sredX-1))+Ra);
    end
end

