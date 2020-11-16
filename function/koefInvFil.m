function newFilter = koefInvFil(rad, nRow, nCol)
filter = fftshift(impulseResponce(rad, nRow, nCol));
newFilter = 1./filter;
for y = 1:nRow
    for x = 1:nCol
        if isinf(newFilter(y,x))
            newFilter(y,x) = 0;
        end
    end
end