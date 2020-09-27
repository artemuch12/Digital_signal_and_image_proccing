% Function of quantization of a signal.
% Input Specifications:
%   image - signal reports;
%   levels - quantizer levels depth;
% Output
%   quanImage - quantized reports;
function [quanImage] = imageQuantization (image, levels)
if(levels <= 0)
    error("levels depth cannot be less than 0");
end
if fix(levels)-levels ~= 0
    error("Input variable 'levels' is not integer!");
end

[col, row, color] = size(image);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

% We lead image to format double and divided all pixels to scale. Round
% from nearest integer and return scale.
quanImage = uint8(round(double(image)./(256/levels)).*(256/levels));
