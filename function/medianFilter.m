% ������� medianFilter ���������� ��������� ���������� �����������
% 
% ������� ������:
%       image       - ��������, �����, ����������� ���� uint8;
%       sizeMask    - ������� ���������� �����.
% 
% �������� ������:
%       newImage    - ��������������� ������������ ���� uint8.

function newImage = medianFilter(image, sizeMask)

[nRow, nCol, nColor] = size(image);

% ���� ��������
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not double');
end

% ��������� ������ ��� ��������������� ����������� � ���������� ����
newImage = zeros(nRow, nCol);
frame = zeros(sizeMask, sizeMask);

% �������� ����������
step = -ceil(sizeMask/2)+1:ceil(sizeMask/2)-1;
for y = (ceil(sizeMask/2)):nRow-ceil(sizeMask/2)+1
    for x = (ceil(sizeMask/2)):nCol-ceil(sizeMask/2)+1
            frame = image(y+step, x+step);
            frame = sort(frame(:));
            newImage(y,x) = frame(ceil(length(frame)/2));
    end
end
newImage = uint8(newImage);