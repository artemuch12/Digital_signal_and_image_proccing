% This function calculates math expectation
% Input data:
%     image - image reduce to format double and is grey shades
% Output data:
%     sred - math expectation input image
function sred = mean2My(image)
[nRow, nCol, nColor] = size(image);
% Checking for color components 
if nColor ~= 1
    error('Image is not grey');
end
% Checking for format input image
if ~strcmpi(class(image), 'double')
    error('Image is not double');
end

sred = sum(sum(image))/(nRow*nCol);