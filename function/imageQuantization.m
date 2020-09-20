

% Function of quantization of a signal.
% Input Specifications:
%   image - signal reports;
%   bit - quantizer bit depth;
% Output
%   quanImage - quantized reports;
function [quanImage] = imageQuantization (image, bit)
if(bit <= 0)
    error("Bit depth cannot be less than 0");
end
if fix(bit)-bit ~= 0
    error("Input variable 'Bit' is not integer!");
end

[col, row, color] = size(image);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

quanImage = image;

minCount = min(min(image));
maxCount = max(max(image));
