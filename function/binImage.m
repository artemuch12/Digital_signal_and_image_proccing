function bImage = binImage(image, threshold) 

[col, row, color] = size(image);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

bImage = logical(zeros(col, row));

for y = 1:col
    for x = 1:row
        if image(y,x) <= threshold
            bImage(y,x) = false;
        else
            bImage(y,x) = true;
        end
    end
end
