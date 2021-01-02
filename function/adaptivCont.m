function  newImage = adaptivCont (image, sizeWin)

[iRow, iCol, ~] = size(image);
% �������� ������ �� ����� �����������
newImage = zeros(iRow, iCol);

frame = zeros(sizeWin, sizeWin);

stepI = -ceil(sizeWin/2)+1:ceil(sizeWin/2)-1;
stepJ = -ceil(sizeWin/2)+1:ceil(sizeWin/2)-1;

for i = (ceil(sizeWin/2)):sizeWin:iRow-ceil(sizeWin/2)+1
    for j = (ceil(sizeWin/2)):sizeWin:iCol-ceil(sizeWin/2)+1
        frame = image(i+stepI, j+stepJ);
%         �������������
        maxFram = max(max(frame));
        minFram = min(min(frame));
%         ������������ ��������, ����� ���� �������� � ��� ����������
%         ����� �� ���� NaN
        if maxFram ~= minFram
            frame = (frame-minFram)/(maxFram-minFram).*255;
        end
        newImage(i+stepI, j+stepJ) = frame;
    end
end
