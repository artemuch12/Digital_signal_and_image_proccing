% This function calculates empirical function
% Input data:
%     hysto - histogram
% Output data:
%     empFunct - empirical function
function empFunct = empirFunction(hyst)
sc = length(hyst);
empFunct = zeros(sc, 1);
empFunct(1) = hyst(1);
for i = 2:sc
    empFunct(i) = empFunct(i-1)+hyst(i);
end
