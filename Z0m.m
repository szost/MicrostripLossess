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

