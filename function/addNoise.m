%                               |-256  256 |
% Function add noise by inteval |----,  ---|
%                               | 2n     2n|
function imageNoise = addNoise(image, bytes)

if(bytes <= 0)
    error('Bit depth cannot be less than 0');
end
if fix(bytes)-bytes ~= 0
    error('Input variable Bit is not integer!');
end

[nRow, nCol, nColor] = size(image);

if nColor ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

imageNoise = (rand(nRow, nCol)-0.5).*2.*(256/(2*bytes));
imageNoise = uint8(imageNoise + double(image));


