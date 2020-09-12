% This function calculates histogram input image
% Input data:
%     image - image is grey shades
% Output data:
%     hysto - histogram
function hysto = histogramMy(image)
[col, row, color] = size(image);
% Checking for color components 
if color ~= 1
    error('Image not grey');
end

minImage = min(min(image));

if minImage < 1
    image = image - minImage + 1;
end
hysto = zeros(256, 1);
for y = 1:col
    for x = 1:row
        hysto(image(y,x)) = hysto(image(y,x)) + 1;
    end
end
hysto = hysto/(col*row);