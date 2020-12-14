function poz = recognize(imTest, im1, im2, im3, im4)
coef = zeros(1,4);
coef(1) = coefcorr(imTest, im1);
coef(2) = coefcorr(imTest, im2);
coef(3) = coefcorr(imTest, im3);
coef(4) = coefcorr(imTest, im4);
if max(abs(coef)) == abs(coef(1))
    poz = 1;
elseif max(abs(coef)) == abs(coef(2))
    poz = 2;
elseif max(abs(coef)) == abs(coef(3))
    poz = 3;
elseif max(abs(coef)) == abs(coef(4))
    poz = 4;
end

function coef = coefcorr(im1, im2)
time = corrcoef(im1, im2);
coef = time(1,2);