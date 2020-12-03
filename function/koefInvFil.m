% Функция koefInvFil рассчитывает комплексные коэффициенты для инверсного 
% фильтра к изображениям с искажениями имеющими цилиндрическую ФРТ
% 
% Входные данные:
%       rad         - радиус цилиндрической ФРТ
%       nRow и nCol - геометричские размеры изображения 
% 
% Выходные данные:
%       newFilter   - комплексные коэффициенты инверсного фильтра

function newFilter = koefInvFil(rad, nRow, nCol)

% Блок проверок
if rad <= 0
    error("The distortion radius is less than or equal to zero");
end
if nRow <= 0 || nCol <= 0
    error("Geometric dimensions less than or equal to zero");
end

% Получение КЧХ для искажений
filter = fft2(impulseResponce(rad, nRow, nCol));

% Инверсный фильтр
newFilter = 1./filter;

% Зануление коэффицентов с бесконечными значениями
for y = 1:nRow
    for x = 1:nCol
        if isinf(newFilter(y,x))
            newFilter(y,x) = 0;
        end
    end
end