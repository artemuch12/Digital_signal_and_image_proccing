% This function performs linear contrast of the input image. 
% Input data:
%   image - image reduce to format uint8 and is grey shades
% Output data:
%   newImage - image that has passed linear contrast
%   diap - dynamic diapazone new image (from 0 to 255)
function [newImage, diap] = linContrast(image)

[~, ~, color] = size(image);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

imageDouble = double(image);
minImage = min(min(imageDouble));
maxImage = max(max(imageDouble));

newImage = uint8((imageDouble-minImage)/(maxImage-minImage).*255);
diap = uint8(0:1:255);