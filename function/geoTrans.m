% Функция geoTrans - масштабирует и поворачивает исходное изображение
% относительно пары координат (y0,x0).
% 
% Входные данные:
%       image       - исходное, серое, изображение типа double;
%       kMascht     - коэффицент масштаб;
%       angle       - угол поворота исходного изображения относительно пары 
%                     координат (y0,x0). Угол задается в градусах;
%       y0          - коодината по оси Y пикселя относительно которого
%                     происходя преобразования;
%       x0          - коодината по оси X пикселя относительно которого
%                     происходя преобразования.
% 
% Выходные данные:
%       newImage    - преобразованное изображение
% 
% Дополнительный материал:
%       В функции используется дополнительные нестандартные функции 
%       cosGrad() и sinGrad()

function newImage = geoTrans(image, kMascht, angle, y0, x0)

[nRow, nCol, nColor] = size(image);
% Блок проверок на ошибки
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'double')
    error('Image is not double');
end
if y0 > nRow || y0 < 1
    error("The Y coordinate of the reference point is off the grid")
end
if x0 > nCol || x0 < 1
    error("The X coordinate of the reference point is off the grid")
end
if kMascht <= 0
    error("The zoom level is less than or equal to zero")
end


% Выделяем память под новое изображение. Корень(2) необходим, чтобы дать
% максимум памяти при повороте. kMascht учитывает масштабирование.
newRow = round(kMascht*nRow *sqrt(2));
newCol = round(kMascht*nCol *sqrt(2));
newImage = zeros(newRow, newCol);

% Пересчитваем все новые координаты. 
% y-kMascht*y0 и x-kMascht*x0 - позволяет оставить (с учетом коэффицента 
% масштаба) точку (y0, x0) не подвижной.
for y = 1:newRow
    for x = 1:newCol
        yNew = round((y-kMascht*y0)*cosGrad(angle)/kMascht+...
            (x-kMascht*x0)*sinGrad(angle)/kMascht+y0);
        xNew = round(-1*(y-kMascht*y0)*sinGrad(angle)/kMascht+...
            (x-kMascht*x0)*cosGrad(angle)/kMascht+x0);
        if (yNew > 0) && (xNew >0) && (yNew <= nRow) && (xNew <= nCol)
            newImage(y, x) = image(yNew,xNew);
        end
    end
end