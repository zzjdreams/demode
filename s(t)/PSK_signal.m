function y=PSK_signal(t,T,st,f)
    w=2*pi*f;
    y=zqjxmc(t,T,st).*cos(w*t)+zqjxmc(t,T,-1*st+1).*cos(w*t+pi);
end