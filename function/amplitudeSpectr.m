function amSpectr = amplitudeSpectr(image)
amSpectr = abs(fft2(double(image)));
