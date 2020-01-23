function y=u_t(t)

% y=1.*(t>0)+0.5.*(t==0)+0.*(t<0);


t=-10:0.01:10;
y=0;
st=[1,0,0,1,0,1];
for n=1:length(st)
%     y=y+st(n).*(t>(n-1)&t<n)+0.*(t<0|t>6)
    y=y+st(n).*(t> (n-1) & t<n);
end

subplot(3,1,1);
% y=1.*(t>0)+0.5.*(t==0)+0.*(t<0);
% y=0.*(t<0)+1.*(t>0&t<1)+0.*(t>1&t<2)+0.*(t>2&t<3)+1.*(t>3&t<4)+0.*(t>4);
plot(t,y);
% set(gca,'xtick',-10:1:10);
title('2ASK');
ylabel('s(t)');
xlabel('t(s)');
axis([0,10,-2,2]);

yc=cos(30*t);
subplot(3,1,2);
plot(t,yc)
axis([0,10,-2,2]);


yt=y.*yc;
subplot(3,1,3);
plot(t,yt)
axis([0,10,-2,2]);


figure(1);
end

