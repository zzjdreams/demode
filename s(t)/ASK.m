function y=ASK(str,f,T)

% f=10;
% T=2;
w=2*pi*f;
t=0:0.01:6*T;
% t=-10:0.01:10;
% y=0;
st=str2num(str(:))';
% st=[1,0,0,1,0,1];
% for n=1:length(st)
%     y=y+st(n).*(t> (n-1) & t<n);
% end

y=zqjxmc(t,T,st);

subplot(3,2,1);
plot(t,y);
grid on;
title('�����ź�');
% text(1,1,'����ע��')
ylabel('s(t)');
xlabel('t(s)');
grid on;
% axis([0,length(st),-1,1]);

yc=cos(w*t);
subplot(3,2,2);
plot(t,yc);
grid on;
title('�ز��ź�');
% axis([0,length(st),-1,1]);


yt=y.*yc;
subplot(3,2,3);
plot(t,yt);
grid on;
title('2ASK�ź�');
% axis([0,length(st),-1,1]);


ys=0;
sta=-1*st+1;
for n=1:length(sta)
    ys=ys+sta(n).*(t> (n-1) & t<n);
end

subplot(3,2,4);
plot(t,1-zqjxmc(t,T,st));
title('s��t����ת');
ylabel('s(t)');
xlabel('t(s)');
grid on;
% axis([0,length(st),-1,1]);


yf=fft(ASK_signal(t,T,st,f));
subplot(3,2,5);
plot(t,abs(yf));
title('Ƶ���ź�');
grid on;


yfr=real(yf);
yfi=imag(yf);
margin=sqrt(yfr.^2+yfi.^2); %ͼ������ף���log������ʾ
phase=real(angle(yf)); %ͼ����λ��
subplot(3,2,6);
plot(t,abs(phase));
title('�������ź�');
grid on;

% r1=real(yf);          %ʵ��
% i1=imag(yf);          %�鲿
% margin1=log(sqrt(r1.^2+i1.^2));      %ͼ������ף���log������ʾ
% phase1=real(angle(yf)*180/pi);     %ͼ����λ��
% subplot(3,2,5),plot(margin1),title('������');
% subplot(3,2,6),plot(phase1),title('��λ��');

set(gcf,'Name','~~~~2ASK����չʾ')
set(gcf,'position',[300 50 900 700]);
figure(1);
end

