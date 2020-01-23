function y=FSK(str,f,T)
clc;

y=0;
% T=2;
% f=10;
% str='100101';
t=-10:0.01:6*T;
w1=2*pi*f;
w2=2*pi*(f+5);

% st=[1,0,0,1,0,1];

st=str2num(str(:))'
% for n=1:length(st)*T
%     t1=mod(n,6);
%     if t1==0
%         t2=6;
%     else
%         t2=t1;
%     end
%     y=y+st(t2).*(t> (n-1) & t<n);
% end

y=zqjxmc(t,T,st);

subplot(3,2,1);
plot(t,zqjxmc(t,T,st));
title('输入信源s（t）');
ylabel('s(t)');
xlabel('t(s)');
grid on;
axis([0,6*T,0,1]);

ys=0;
sta=-1*st+1;
for n=1:length(sta)*T
    t1=mod(n,6);
    if t1==0
        t2=6;
    else
        t2=t1;
    end
    ys=ys+sta(t2).*(t> (n-1) & t<n);
end

subplot(3,2,2);
plot(t,1-zqjxmc(t,T,st));
grid on;
title('s（t）翻转');
ylabel('s(t)');
xlabel('t(s)');
axis([0,6*T,0,1]);

yc1=cos(w1*t);
subplot(3,2,3);
plot(t,yc1);
grid on;
title('cos(w1*t)');
axis([0,6*T,-1,1]);

yc2=cos(w2*t);
subplot(3,2,4);
plot(t,yc2);
grid on;
title('cos(w2*t)');
axis([0,6*T,-1,1]);


ycom=zqjxmc(t,T,st).*yc1+ys.*yc2;
subplot(3,2,5);
plot(t,ycom);
grid on;
title('输出信号');
axis([0,6*T,-1,1]);

yf=fft(FSK_signal(t,T,st,f));
subplot(3,2,6);
plot(t,abs(yf));
grid on;
title('频谱图');

box;
% figure('Name','2FSK');
set(gcf,'Name','~~~~2FSK波形展示')
% figure('NumberTitle', 'off', 'Name', '2FSK波形展示');
set(gcf,'position',[300 50 900 700]);
end

