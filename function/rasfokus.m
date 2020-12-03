% Функция rasfokus расфокусирует изображение используя искажения с
% цилиндрической ФРТ заданного радиуса
% 
% Входные данные:
%       image       - исходное, серое, изображение типа double;
%       rad         - радиус искажений
% 
% Выходные данные:
%       newImage    - искаженное изобаржение

function newImage = rasfokus(image, rad)
[nRow, nCol, nColor] = size(image);

% Блок проверок
if rad <= 0
    error("Radius is not positive");
end
if rad < 1
    error("Radius is less 1")
end
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'double')
    error('Image is not double');
end
% Получение цилиндрической ФРТ заданного радиуса
impulse = impulseResponce(rad, nRow, nCol);

% Искаженное изображение
newImage = real(ifft2(fft2(impulse).*fft2(image)));