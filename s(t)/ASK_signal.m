function y=ASK_signal(t,T,st,f)
    w=2*pi*f;
    y=zqjxmc(t,T,st).*cos(w*t);
end