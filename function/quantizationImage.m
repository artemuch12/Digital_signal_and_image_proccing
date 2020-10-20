function quanImage = quantizationImage(image, level)

[col, row, color] = size(image);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end
if level < 1
    error ('Level downer one!');
end
if fix(level) - level ~= 0
    error ('Level is not integer!');
end

quanImage = image;

imageDouble = double(image);
minImage = 0;
maxImage = level;

quanImage = uint8((imageDouble-minImage)/(maxImage-minImage).*255);
