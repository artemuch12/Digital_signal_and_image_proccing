% ������� thresholdEmperFunction ����������� ��������� �������� �� 
% ������������ ������� � �� ����������� ������.
% 
% ������� ������:
%       empFunc     - ������������ ������� �����������
%       lvl         - �������� ������������ ������� ��� �������� ����������
%                     �����.
% 
% �������� ������:
%       thrMean     - ������������ �����
% 
% �������������� ��������:
%       ����� ���������� �������� �������.

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