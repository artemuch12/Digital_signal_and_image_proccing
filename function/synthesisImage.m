% This function synthesize image on input amplitude and phase spectra.
% Input data:
%     amSP - amplitude spectrum (type: double)
%     phSp - phase spectrum (type: double)
% Output data:
%     synImag - synthesis image (type: uint8)
function synImage = synthesisImage(amSp, phSp)
if (~strcmpi(class(amSp), 'double')) || (~strcmpi(class(phSp), 'double'))
    error('One of input spectra is not double');
end
synImage = uint8(ifft2(amSp.*exp(1i*phSp)));