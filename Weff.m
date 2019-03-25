function w = Weff(W,h,t,f)
%WEFF Summary of this function goes here
%   Detailed explanation goes here
%
c (2016)
    switch nargin
        case 3
            %We/h Correction for strip thicness -> as a width
            if (W/h)<=(1/(2*pi))
                w = (W/h)+(1.25/pi)*(t/h)*(1+log((4*pi*W)/t));
            else
                w = (W/h)+(1.25/pi)*(t/h)*(1+log((2*h)/t));
            end

        case 4
            % Edwards, Terence Charles_ Steer, Michael Bernard -
            % Foundations for microstrip circuit design-John Wiley & Sons
            % Inc 7.7.2
            eEff = epsEff0(W,h,er,t);
                                             
            %We/h Correction for strip thicness -> as a width
            if (W/h)<=(1/(2*pi))
                w0 = (W/h)+(1.25/pi)*(t/h)*(1+log((4*pi*W)/t));
            else
                w0 = (W/h)+(1.25/pi)*(t/h)*(1+log((2*h)/t));
            end
            
            fp = physconst('LightSpeed')/(2*w0*sqrt(eEff)); 
            
            w = W + (w0-W)/(1+(f/fp)^2);           
    end
end

