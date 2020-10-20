function discImage = discretImage(image, nd)

if nd <= 0
    error('Parameter nd is not bigger zero!');
end

[nRow, nCol, nColor] = size(image);

discImage = zeros(nRow, nCol);

for y = 1:nd:nRow
    for x = 1:nd:nCol
        discImage(y, x) = image(y,x);
    end
end