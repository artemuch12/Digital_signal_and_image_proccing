function inImage = interpImage(discImage, nd)

if nd <= 0
    error('Parameter nd is not bigger zero!');
end

if ~strcmpi(class(discImage), 'double')
    error('Image is not double');
end

[nRow, nCol, nColor] = size(discImage);

spDiscImage = fft2(double(discImage));

for y = (nRow/nd/2+1):1:(nRow-(nRow/nd/2))
    spDiscImage(y,:) = 0;
end
for x = (nCol/nd/2+1):1:(nCol-(nCol/nd/2))
    spDiscImage(:,x) = 0;
end


inImage = real(ifft2(spDiscImage))*nd^2;
