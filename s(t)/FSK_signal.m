function y=FSK_signal(t,T,st,f)
    w1=2*pi*f;w2=2*pi*(f+5);
    y1=cos(w1*t);
    y2=cos(w2*t);
    y=zqjxmc(t,T,st).*y1+(zqjxmc(t,T,-1*st+1)).*y2;
end