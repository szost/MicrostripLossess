function w = Weff(W,h,t)
%WEFF Summary of this function goes here
%   Detailed explanation goes here

    %We/h Correction for strip thicness -> as a width
    if (W/h)<=(1/(2*pi))
        w = (W/h)+(1.25/pi)*(t/h)*(1+log((4*pi*W)/t));
    else
        w = (W/h)+(1.25/pi)*(t/h)*(1+log((2*h)/t));
    end
end

