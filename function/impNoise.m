% ������� impNoise ����������� ���������� ��� � ����� 255, �� ��������
% �����������
% 
% ������� ������:
%       image       - ��������, �����, ����������� ���� uint8;
%       threshold   - ����� ����, � ���������.
% 
% �������� ������:
%       newImage    - ����������� ����������� ���� uint8.

function newImage = impNoise(image, threshold)

[nRow, nCol, nColor] = size(image);

% ���� ��������
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'uint8')
    error('Image is not double');
end

newImage = zeros(nRow, nCol);

for y = 1:1:nRow
    for x = 1:1:nCol
        timeVar = unidrnd(100);
        if(timeVar > threshold)
            newImage(y,x) = image(y,x);
        else
            newImage(y,x) = uint8(255);
        end
    end
end
newImage = uint8(newImage);