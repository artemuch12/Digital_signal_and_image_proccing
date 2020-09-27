% This function synthesize image on input and phase spectrum.
% Amplitude spectrum constant.
% Input data:
%     phSp - phase spectrum (type: double)
% Output data:
%     synImag - synthesis image (type: uint8)
function synImage = synthesisOnPhaseImage(phSp)
if ~strcmpi(class(phSp), 'double')
    error('One of input spectra is not double');
end
synImage = ifft2(exp(1i*phSp));
synImage = uint8(synImage.*(255/max(max(abs(synImage)))));