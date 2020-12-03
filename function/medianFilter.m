% Функция medianFilter производит медианную фильтрацию изображения
% 
% Входные данные:
%       image       - исходное, серое, изображение типа uint8;
%       sizeMask    - размеры квадратной маски.
% 
% Выходные данные:
%       newImage    - отфильтрованное изображенное типа uint8.

function newImage = medianFilter(image, sizeMask)

[nRow, nCol, nColor] = size(image);

% Блок проверок
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not double');
end

% Выделение памяти под отфильтрованное изображение и скользящее окно
newImage = zeros(nRow, nCol);
frame = zeros(sizeMask, sizeMask);

% Алгоритм фильтрации
step = -ceil(sizeMask/2)+1:ceil(sizeMask/2)-1;
for y = (ceil(sizeMask/2)):nRow-ceil(sizeMask/2)+1
    for x = (ceil(sizeMask/2)):nCol-ceil(sizeMask/2)+1
            frame = image(y+step, x+step);
            frame = sort(frame(:));
            newImage(y,x) = frame(ceil(length(frame)/2));
    end
end
newImage = uint8(newImage);