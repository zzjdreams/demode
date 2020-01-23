function y=djxmc(t,tt)
%tt为单个矩形脉冲的宽度，t为自变量时间，以t=0 为分界，左右各tt/2的宽度
y=u_t(t+tt/2)-u_t(t-tt/2);
end