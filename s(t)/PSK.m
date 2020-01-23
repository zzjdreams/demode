function y=PSK(str,f,T)
clc;
% T=2;
% str='101010'
t=-0:0.01:6*T;
y=0;
w=2*pi*f;
st=str2num(str(:))';
% st=[1,0,0,1,0,1];
% for n=1:length(st)
%     y=y+st(n).*(t> (n-1) & t<n);
% end
y=zqjxmc(t,T,st);

subplot(3,2,1);
plot(t,y);
title('输入信源s（t）');
ylabel('s(t)');
xlabel('t(s)');
grid on;
% axis([0,6,-1,1]);

ys=0;
sta=-1*st+1;
for n=1:length(sta)
    ys=ys+sta(n).*(t> (n-1) & t<n);
end

subplot(3,2,2);
plot(t,1-zqjxmc(t,T,st));
grid on;
title('s（t）翻转');
ylabel('s(t)');
xlabel('t(s)');
% axis([0,length(st),-2,2]);


yc1=cos(w.*t);
subplot(3,2,3);
plot(t,yc1);
grid on;
title('cos(w*t)');
% axis([0,length(st),-2,2]);



yc2=-yc1;
subplot(3,2,4);
plot(t,yc2);
grid on;
title('-cos(w*t)');
% axis([0,length(st),-2,2]);


ycom=y.*yc1+ys.*yc2;
subplot(3,2,5);
plot(t,PSK_signal(t,T,st,f));
grid on;
title('输出信号');
% axis([0,length(st),-2,2]);

yf=fft(PSK_signal(t,T,st,f));
subplot(3,2,6);
plot(t,abs(yf));
title('频谱图');


box;
% figure('Name','2FSK');
% 
% figure(1);
set(gcf,'Name','~~~~2PSK波形展示');
% figure('NumberTitle', 'off', 'Name', '2FSK波形展示');
set(gcf,'position',[300 50 900 700]);
end

