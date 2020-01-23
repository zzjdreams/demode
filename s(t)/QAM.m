
function QAM(str)
st=str2num(str(:))';
% ��������������
M=16;   %����
N=4;    %��Դ���������ȣ�Ϊ��֤���룬ѡ�� log2��M����������

bitstream=zeros(1,N); 
symbolstream=zeros(1,N/log2(M));
% for n1=1:N
%     bitstream(n1)=binornd(1,0,5,1,1);
% end


bitstream=st(1:4);

%���������
for n1=1:length(symbolstream) 
pack=[bitstream(4*(n1-1)+1),bitstream(4*(n1-1)+2),bitstream(4*(n1-1)+3),bitstream(4*(n1-1)+4)];
if pack==[0 0 0 0] 
    symbolstream(n1)=1+1i; 
elseif pack==[0 0 1 0] 
    symbolstream(n1)=2+1i; 
elseif pack==[0 0 1 1] 
    symbolstream(n1)=2+2j; 
elseif pack==[0 0 0 1] 
    symbolstream(n1)=1+2j; 
elseif pack==[0 1 0 1] 
    symbolstream(n1)=-1+2j; 
elseif pack==[0 1 0 0] 
    symbolstream(n1)=-1+j; 
elseif pack==[0 1 1 1] 
    symbolstream(n1)=-2+2j; 
elseif pack==[0 1 1 0] 
    symbolstream(n1)=-2+j; 
elseif pack==[1 1 1 0]
    symbolstream(n1)=-2-j; 
elseif pack==[1 1 1 1] 
    symbolstream(n1)=-2-2j; 
elseif pack==[1 1 0 1] 
    symbolstream(n1)=-1-2j; 
elseif pack==[1 1 0 0] 
    symbolstream(n1)=-1-j; 
elseif pack==[1 0 0 0] 
    symbolstream(n1)=1-j; 
elseif pack==[1 0 1 0] 
    symbolstream(n1)=2-j; 
elseif pack==[1 0 0 1] 
    symbolstream(n1)=1-2j; 
else
    symbolstream(n1)=2-2j;
end 
end 
subplot(221)
% figure(1) 
hold on 
for n1=-2:2 
for n2=-2:2 
if ~((n1==0)||(n2==0)) 
scatter(n1,n2); 
end 
end 
end 
axis([-3 3 -3 3]); 
hold off 
title('16QAM ����ͼ '); 
xlabel('ͬ��֧· ') 
ylabel('����֧· ') 
%�����ز�
fc=10; %�ز�Ƶ��
fs=100; %����Ƶ��
T=1; %ÿ���ų���ʱ��
N_samples=T*fs; % ÿ�����ڵĲ�������
t=0:T/N_samples:(T-T/N_samples); 
carrier=exp(1i*2*pi*fc*t); 
%�����ź����� g(t) 
%gt=ones(1,length(carrier)); 
gt=1-cos(2*pi*(1/T)*t); 

%���ɵ����ź� S(t) 
St_complex=zeros(1,length(carrier)*length(symbolstream)); 
for n1=1:length(symbolstream) 
St_complex((N_samples*(n1-1)+1):(N_samples*(n1-1)+N_samples))=(symbolstream(n1)*carrier).*gt; 
end 
subplot(222)
% figure(2) 
St_real=real(St_complex); 
plot(St_real) 
title('QAM ���沨��ͼ �ز� 10Hz g(t) Ϊ���������� '); 
xlabel('������ ') 
ylabel('���� ') 
%��������� ,���ֹ����ײ��ǰ��չ�ʽֱ�Ӽ���� ,���Ƕ���������һ��ʱ���ڵ��źŵĲ�������� FFT ���õ���
spectrum=(real(fft(St_real,10*length(St_real)))).^2; 
S_spectrum=spectrum(1:length(spectrum)/2); 
subplot(223)
% figure(3) 
F=0:fs/(2*length(S_spectrum)):fs/2-fs/(2*length(S_spectrum)); 
plot(F,10*log10(S_spectrum)) 
axis([0 50 -70 60]); 
title('QAM �źŹ������ܶ� ') 
xlabel('Ƶ�� /Hz') 
ylabel('���� ')
subplot(224)
% figure(4) 
index=40:160; 
plot(F(index),10*log10(S_spectrum(index))); 
axis([4 16 0 60]); 
title('QAM �źŹ������ܶ�����Ƶ�����ķŴ�ͼ ') 
xlabel('Ƶ�� /Hz') 
ylabel('���� ')

set(gcf,'position',[300 50 900 700]);
set(gcf,'Name','~~~~QAM����չʾ')
end
