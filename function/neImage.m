function negImage = neImage(image)

[~, ~, color] = size(image);
if color ~= 1
    error('Image not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not uint8');
end

negImage = 255 - image;