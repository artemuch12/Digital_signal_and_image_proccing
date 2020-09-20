function ecvImage = ecvalingImage(image,  empFunct)

[col, row, color] = size(image);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end
ecvImage = image;
newEmpFunct = empFunct;
ymax = 255;
ymin = 0;

newEmpFunct = ceil((ymax-ymin).*empFunct+ymin);
for y = 1:col
    for x = 1:row
        ecvImage(y,x) = newEmpFunct(image(y,x)+1);
    end
end
ecvImage = uint8(ecvImage);
