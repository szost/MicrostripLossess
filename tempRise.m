function [delT] = tempRise(W,h,er,t,f,tanDel,roCon,K) %K - substrate thermal conductivity
%TEMPRISE Summary of this function goes here

% Edwards, Terence Charles_ Steer, Michael Bernard -
% Foundations for microstrip circuit design-John Wiley & Sons

[alphaCon,alphaDiel] = lossess(W,h,er,t,f,tanDel,roCon);

We_t = Weff(W,h,t);
We_f = Weff(W,h,t,f);

delT = ((0.2303)/K)*((alphaCon/We_t)+alphaDiel/(2*We_f));%C/W

end

