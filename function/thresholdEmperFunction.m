% Функция thresholdEmperFunction рассчитвает пороговое значение по 
% эмперической функции и по внутреннему порогу.
% 
% Входные данные:
%       empFunc     - Эмпирическая функция изображения
%       lvl         - значение эмперической функции для которого выбирается
%                     порог.
% 
% Выходные данные:
%       thrMean     - выработанный порог
% 
% Дополнительный материал:
%       Порог выбирается бинарным поиском.

function thrMean = thresholdEmperFunction(empFunc, lvl)

len = length(empFunc);
thrMin = 1;
thrMax = len;

while thrMin < thrMax-1
    thrMean = round((thrMax+thrMin)/2);
    if empFunc(thrMean) < lvl
        thrMin = thrMean;
    else
        thrMax = thrMean;
    end
end