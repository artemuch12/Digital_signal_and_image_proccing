% Функция gradMetod производит выделение контура используя градиентый 
% метод (аппроксимация градиента). 
% y(i,j) = |x(i,j)-x(i-1,j-1)|+|x(i,j-1)-x(i-1,j)| - выражение по которому
% выделяется контур.
% 
% Входные данные:
%       image       - исходное, серое, изображение типа double;
% 
% Выходные данные:
%       gradIm      - изображение с выделенными контурами
% 
% Дополнительные данные:
%       Граничные точки вдоль верхей строки и левого столбца не
%       обрабатываюстя.

function gradIm = gradMetod(image)

% Блок проверок
[nRow, nCol, nColor] = size(image);
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'double')
    error('Image is not double');
end

gradIm = zeros();
for y = 2:nRow
    for x = 2:nCol
        gradIm(y,x) = abs(image(y,x)-image(y-1,x-1))+...
            abs(image(y,x-1)-image(y-1,x));
    end
end