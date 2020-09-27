function phSpectr = phaseSpectr(image)
spectr = fft2(double(image));
phSpectr = angle(spectr);