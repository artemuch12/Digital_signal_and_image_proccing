function newMas = convolution2(haract, mas)

[nRowHar, nColHar, nColorHar] = size(haract);
[nRowMas, nColMas, nColorMas] = size(mas);
mas = double(mas);
newMas = zeros(nRowMas, nColMas);

for y = ceil(nRowHar/2):1:(nRowMas-ceil(nRowHar/2)+1)
    for x = ceil(nColHar/2):1:(nColMas-ceil(nColHar/2)+1)
          timeOne = y-ceil(nRowHar/2)+1:y+ceil(nRowHar/2)-1;
          timeTwo = x-ceil(nColHar/2)+1:x+ceil(nColHar/2)-1;
          newMas(y,x) = sum(sum(haract.*mas(timeOne,timeTwo)));
    end
end
% newMas = uint8(newMas);
       