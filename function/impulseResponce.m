% ������� impulseResponce ������� ��������� � �������������� ��� ��������
% �������
% 
% ������� ������:
%       rad         - ������ ���������
%       nRow � nCol - �������������� ������� ����������� �� ������� �����
%                     ���������� ���������
function filter = impulseResponce(rad, nRow, nCol)

% ���� ��������
if rad <= 0
    error("Radius is not positive");
end
if rad < 1
    error("Radius is less 1")
end

if nRow <= 0 || nCol <= 0
    error("Size is not positive or equals zero");
end

filter = zeros(nRow, nCol);
yCentr = ceil(nRow/2);
xCentr = ceil(nCol/2);
for y = 1:1:nRow
    for x = 1:1:nCol
        if((y-yCentr)^2+((x-xCentr))^2) <= rad^2
            filter(y,x) = 1;
        end
    end
end
time = filter./sum(sum(filter));
filter = fftshift(time);