% Функция restoringImage восстанавливает, искаженное цилиндрической ФРТ,
% изображение зная радиус искажения используя иинверсный фильтр.
% 
% Входные данные:
%       image       - исходное, серое, изображение типа double;
%       rad         - радиус цилиндрической ФРТ
% 
% Выходные данные:
%       newImage    - восстанолвенное изображение

function newImage = restoringImage(image, rad)

[nRow, nCol, nColor] = size(image);

% Блок проверок
[nRow, nCol, nColor] = size(image);
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'double')
    error('Image is not double');
end
if rad <= 0
    error("The distortion radius is less than or equal to zero");
end

% Расчет КЧХ фильтра
time = koefInvFil(rad, nRow, nCol);

% Свертка в частотной области КЧХ фильтра и искаженного изображения
newImage = ifft2(time.*fft2(image));