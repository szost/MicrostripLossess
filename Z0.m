function Zchar = Z0(W,h,er,t,f)
%Z0M_A Summary of this function goes here
%   Detailed explanation goes here

    switch nargin
        case 3
            % Hammerstad, E., and O. Jensen, “Accurate Models for Microstrip Computer-Aided Design,”
            % IEEE MTT-S Int. Microwave Symp. Dig., 1980, pp. 407–409.
            
            %Accuracy better than 0.01% for u<=1 and 0.03% for u<=1000
            %t = 0, er = 1
            u = W/h;
            f = 6+(2*pi-6)*exp(-(30.666/u)^0.7528);
            
            Z0ma = ((120*pi)/(2*pi))*log((f/u)+sqrt(1+(2/u)^2));
            eEff = epsEff(W,h,er);
            
            Zchar = Z0ma/sqrt(eEff);

        case 4
            %We/h Correction for strip thicness -> as a width
            Zchar = Z0m(W,h,er,t);
        case 5
            %Z0(f)
            %Hammerstad, E., and O. Jensen, “Accurate Models for Microstrip Computer-Aided Design,”
            %IEEE MTT-S Int. Microwave Symp. Dig., 1980, pp. 407–409.
            %Dispersion
            eEff_t = epsEff0(W,h,er,t);
            eEff_f = epsEff0(W,h,er,t,f);
            
            Z0 = Z0m(W,h,er,t);
            
            Zchar = Z0*((eEff_f-1)/(eEff_t-1))*sqrt(eEff_t/eEff_f);         
    end
end

function Zchar = Z0m(W,h,er,t)
    
    p = Weff(W,h,t);
    eEff = epsEff(W,h,er,t);
    
    %Z0m
    if (W/h)<=1
        Zchar = ((120*pi)/(2*pi*sqrt(eEff)))*log((8/p)+0.25*p);
    else
        Zchar = ((120*pi)/sqrt(eEff))*((p+1.393+0.667*log(p+1.444))^(-1));
    end
    
end


