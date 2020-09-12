% This function calculates standard deviation. This function use function 
% Input data:
%     image - image reduce to format double and is grey shades
% Output data:
%     sko - standard deviation

% Note: For work this function necessary have function mean2My in path 
% '.\function'!

function sko = std2My(image)
[col, row, color] = size(image);
% Checking for color components 
if color ~= 1
    error('Image not grey');
end
% Checking for format input image
if ~strcmpi(class(image), 'double')
    error('Image is not double');
end

sko = sqrt(sum(sum(image.^2))/(col*row) - mean2My(image)^2);
