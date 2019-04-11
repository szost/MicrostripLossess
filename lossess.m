function [unitLengthConLossess,unitLengthDielLossess] = lossess(W,h,er,t,f,tanDel,roRes)
%CONLOSSESS Summary of this function goes here
%   Detailed explanation goes here

% Pucel, R. A., et al., “Losses in Microstrip,” IEEE Trans., Vol. MTT-16, 1968,
% pp. 342–350. Correction in IEEE Trans., Vol. MTT-16, 1968, p. 1064.
% 
% Schneider, M. V., “Microstrip Lines for Microwave Integrated Circuits,” Bell System
% Technical Journal, Vol. 48, 1969, pp. 1422–1444.
% 
% Denlinger, E. J., “Losses in Microstrip Lines,” IEEE Trans. on Microwave Theory Tech.,
% Vol. MTT-28, June 1980, pp. 513–522.

u0 = 4*pi*10^(-7);
eps0 = 1/((physconst('LightSpeed'))^2*u0);

We = Weff(W,h,t)*h;
Z0m = Z0(W,h,er,t);
eEffFreq = epsEff(W,h,er,t,f);

Rs = sqrt(pi*f*u0*roRes); %resistivity
sigma = 2*pi*f*eps0*er*tanDel;%conductivity


    if (W/h) >= (1/(2*pi))
        B = h;
    else
        B = 2*pi*W;
    end
    
A = 1+(h/We)*(1+(1.25/pi)*log((2*B)/t)); 

    if W/h <=1
        unitLengthConLossess = 1.38*A*(Rs/(h*Z0m))*((32-((We/h)^2))/(32+((We/h)^2)));
    else
        unitLengthConLossess = 6.1*10^(-5)*A*((Rs*Z0m*eEffFreq)/h)*((We/h)+((0.667*(We/h))/((We/h)+1.444)));
    end
    
    if W/h <=1
        unitLengthDielLossess = 4.34*120*pi*sigma*((eEffFreq-1)/(sqrt(eEffFreq)*(er-1)));
    else
        unitLengthDielLossess = 27.3*(er/(er-1))*((eEffFreq-1)/(sqrt(eEffFreq)))*(tanDel/(physconst('LightSpeed')/f));
    end
    
end

