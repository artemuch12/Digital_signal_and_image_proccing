function newImage = rotateFree(image, x0, y0, angle)

[row, col, ~] = size(image);


% Переводим угол из градусов в радианы
angle = angle.*pi./180;

dx = x0*(1-cos(angle))-y0*sin(angle);
dy = x0*sin(angle)+y0*(1-cos(angle));

% Находим четыре угловые точки по которым выделим память
listY = zeros(1,4);
listX = zeros(1,4);

listX(1) = round(0*cos(angle)+0*sin(angle)+dx);
listY(1) = round(-1*0*sin(angle)+0*cos(angle)+dy);

listX(2) = round(row*cos(angle)+0*sin(angle)+dx);
listY(2) = round(-1*row*sin(angle)+0*cos(angle)+dy);

listX(3) = round(0*cos(angle)+col*sin(angle)+dx);
listY(3) = round(-1*0*sin(angle)+col*cos(angle)+dy);

listX(4) = round(row*cos(angle)+col*sin(angle)+dx);
listY(4) = round(-1*row*sin(angle)+col*cos(angle)+dy);

maxY = max(listY);
minY = min(listY);
maxX = max(listX);
minX = min(listX);

newRow = maxX-minX;
newCol = maxY-minY;

% Выделяем память под новое изображение
newImage = zeros(newRow, newCol);


for xNew = 1:newRow
    for yNew = 1:newCol
        x = round((xNew-newRow/2)*cos(angle)+(yNew-newCol/2)*sin(angle)+row/2);
        y = round(-(xNew-newRow/2)*sin(angle)+(yNew-newCol/2)*cos(angle)+col/2);
        if (y > 0) && (x >0) && (y <= col) && (x <= row)
            newImage(xNew,yNew) = image(x,y);
        end
    end
end

