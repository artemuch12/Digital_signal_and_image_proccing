% ������� koefInvFil ������������ ����������� ������������ ��� ���������� 
% ������� � ������������ � ����������� �������� �������������� ���
% 
% ������� ������:
%       rad         - ������ �������������� ���
%       nRow � nCol - ������������� ������� ����������� 
% 
% �������� ������:
%       newFilter   - ����������� ������������ ���������� �������

function newFilter = koefInvFil(rad, nRow, nCol)

% ���� ��������
if rad <= 0
    error("The distortion radius is less than or equal to zero");
end
if nRow <= 0 || nCol <= 0
    error("Geometric dimensions less than or equal to zero");
end

% ��������� ��� ��� ���������
filter = fft2(impulseResponce(rad, nRow, nCol));

% ��������� ������
newFilter = 1./filter;

% ��������� ������������ � ������������ ����������
for y = 1:nRow
    for x = 1:nCol
        if isinf(newFilter(y,x))
            newFilter(y,x) = 0;
        end
    end
end