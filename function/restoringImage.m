% ������� restoringImage ���������������, ���������� �������������� ���,
% ����������� ���� ������ ��������� ��������� ���������� ������.
% 
% ������� ������:
%       image       - ��������, �����, ����������� ���� double;
%       rad         - ������ �������������� ���
% 
% �������� ������:
%       newImage    - ��������������� �����������

function newImage = restoringImage(image, rad)

[nRow, nCol, nColor] = size(image);

% ���� ��������
[nRow, nCol, nColor] = size(image);
if nColor ~= 1
    error('Image is not grey');
end
if ~strcmpi(class(image), 'double')
    error('Image is not double');
end
if rad <= 0
    error("The distortion radius is less than or equal to zero");
end

% ������ ��� �������
time = koefInvFil(rad, nRow, nCol);

% ������� � ��������� ������� ��� ������� � ����������� �����������
newImage = ifft2(time.*fft2(image));