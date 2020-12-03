% ������� geoTrans - ������������ � ������������ �������� �����������
% ������������ ���� ��������� (y0,x0).
% 
% ������� ������:
%       image       - ��������, �����, ����������� ���� double;
%       kMascht     - ���������� �������;
%       angle       - ���� �������� ��������� ����������� ������������ ���� 
%                     ��������� (y0,x0). ���� �������� � ��������;
%       y0          - ��������� �� ��� Y ������� ������������ ��������
%                     ��������� ��������������;
%       x0          - ��������� �� ��� X ������� ������������ ��������
%                     ��������� ��������������.
% 
% �������� ������:
%       newImage    - ��������������� �����������
% 
% �������������� ��������:
%       � ������� ������������ �������������� ������������� ������� 
%       cosGrad() � sinGrad()

function newImage = geoTrans(image, kMascht, angle, y0, x0)

[nRow, nCol, nColor] = size(image);
% ���� �������� �� ������
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


% �������� ������ ��� ����� �����������. ������(2) ���������, ����� ����
% �������� ������ ��� ��������. kMascht ��������� ���������������.
newRow = round(kMascht*nRow *sqrt(2));
newCol = round(kMascht*nCol *sqrt(2));
newImage = zeros(newRow, newCol);

% ������������ ��� ����� ����������. 
% y-kMascht*y0 � x-kMascht*x0 - ��������� �������� (� ������ ����������� 
% ��������) ����� (y0, x0) �� ���������.
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