% ������� rasfokus ������������� ����������� ��������� ��������� �
% �������������� ��� ��������� �������
% 
% ������� ������:
%       image       - ��������, �����, ����������� ���� double;
%       rad         - ������ ���������
% 
% �������� ������:
%       newImage    - ���������� �����������

function newImage = rasfokus(image, rad)
[nRow, nCol, nColor] = size(image);

% ���� ��������
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
% ��������� �������������� ��� ��������� �������
impulse = impulseResponce(rad, nRow, nCol);

% ���������� �����������
newImage = real(ifft2(fft2(impulse).*fft2(image)));