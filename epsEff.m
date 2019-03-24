function eps = epsEff(W,h,er,t,f)
%EPSEFF Summary of this function goes here
%   Detailed explanation goes here
    switch nargin
        case 3
            % Hammerstad, E., and O. Jensen, “Accurate Models for Microstrip Computer-Aided Design,”
            % IEEE MTT-S Int. Microwave Symp. Dig., 1980, pp. 407–409.
            
            %Accuracy better than 0.2% for er<=128 and 0.01 <= u <=100
            u = W/h;
            a = 1+(1/49)*log((u^4+(u/52)^2)/(u^4+0.432))+(1/18.7)*log(1+(u/18.1)^3);
            b = 0.564*(((er-0.9)/(er+3))^0.053);
            
            eps = ((er+1)/2)+((er-1)/2)*((1+10/u)^(-a*b));
        case 4
            % Bahl, I.J., and R. Garg, “Simple and Accurate Formulas for Microstrip with Finite Strip
            % Thickness,” Proc. IEEE, Vol. 65, 1977, pp. 1611–1612.

            % Hammerstad, E. O., “Equations for Microstrip Circuit Design,” Proc. European Microwave
            % Conf., 1975, pp. 268–272.
            
            %With the strip thickness correction
            %Agrees for t/h <= 0.005, 2<=er<=10 and W/h>=0.1
            
            eps = epsEff0(W,h,er,t);
        case 5          
            %eeff(f)
            % Kobayashi, M., “A Dispersion Formula Satisfying Recent Requirements in Microstrip
            % CAD,” IEEE Trans., Vol. MTT-36, August 1988, pp. 1246–1250.
            
            if W/h<=0.7
                m_c = 1+((1.4)/(1+(W/h)))*(0.15-0.235*exp((-0.45*f)/()))
            else
                m_c = 1;
            end
            
            m_0 = 1+((1)/(1+sqrt(W/h)))+0.32*(((1)/(1+sqrt(W/h)))^3);
            
            m = m_0*m_c;
            %%%%
            eEff = epsEff0(W,h,er,t);
            
            f_k = (c*atan(er*sqrt((eEff-1)/(er-eEff))))/(2*pi*h*sqrt(er-eEff));
            f_50 = f_k/(0.75+(W/h)*(0.75-(0.332/(er^1.73))));
            
            eps = er-((er-eEff)/(1+(f/f_50)^m));
    end
end

function eEff = epsEff0(W,h,er,t)
    %With the strip thickness correction
    %Agrees for t/h <= 0.005, 2<=er<=10 and W/h>=0.1
    if (W/h)<=1
        F = ((1+((12*h)/W))^(-1/2))+0.041*((1-(W/h))^2);
    else
        F = ((1+((12*h)/W))^(-1/2));
    end
    
    C = ((er-1)/(4.6))*(t/h)/(sqrt(W/h));
    
    eEff = ((er+1)/2)+((er-1)/2)*F-C;
end