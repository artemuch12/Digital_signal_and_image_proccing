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


% �������� ������ ��� ����� �����������.
newRow = round(nRow);
newCol = round(nCol);
newImage = zeros(newRow, newCol);

dy = y0*(1-cosGrad(angle)/kMascht)-x0*sinGrad(angle)/kMascht;
dx = y0*sinGrad(angle)/kMascht+x0*(1-cosGrad(angle)/kMascht);


% ������������ ��� ����� ���������� � ������. 
for y = 1:newRow
    for x = 1:newCol
        yNew = round(y*cosGrad(angle)/kMascht+...
            x*sinGrad(angle)/kMascht+dy);
        xNew = round(-1*y*sinGrad(angle)/kMascht+...
            x*cosGrad(angle)/kMascht+dx);
        if (yNew > 0) && (xNew >0) && (yNew <= nRow) && (xNew <= nCol)
            newImage(y, x) = image(yNew,xNew);
        end
    end
end