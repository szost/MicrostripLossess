function eEff = epsEff0(W,h,er,t)
    %With the strip thickness correction
    %Agrees for t/h <= 0.005, 2<=er<=10 and W/h>=0.1
    if (W/h)<=1
        F = ((1+((12*h)/W))^(-1/2))+0.041*((1-(W/h))^2);
    else
        F = ((1+((12*h)/W))^(-1/2));
    end
    
%F = (1+10*(h/W))^(-1/2);

    C = ((er-1)/(4.6))*((t/h)/(sqrt(W/h)));
    
    eEff = ((er+1)/2)+((er-1)/2)*F-C;
end

