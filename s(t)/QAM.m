
function QAM(str)
st=str2num(str(:))';
% 产生基带符号流
M=16;   %进制
N=4;    %信源比特流长度，为保证对齐，选择 log2（M）的整倍数

bitstream=zeros(1,N); 
symbolstream=zeros(1,N/log2(M));
% for n1=1:N
%     bitstream(n1)=binornd(1,0,5,1,1);
% end


bitstream=st(1:4);

%格雷码编码
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
title('16QAM 星座图 '); 
xlabel('同相支路 ') 
ylabel('正交支路 ') 
%产生载波
fc=10; %载波频率
fs=100; %采样频率
T=1; %每符号持续时间
N_samples=T*fs; % 每符号内的采样点数
t=0:T/N_samples:(T-T/N_samples); 
carrier=exp(1i*2*pi*fc*t); 
%产生信号脉冲 g(t) 
%gt=ones(1,length(carrier)); 
gt=1-cos(2*pi*(1/T)*t); 

%生成调制信号 S(t) 
St_complex=zeros(1,length(carrier)*length(symbolstream)); 
for n1=1:length(symbolstream) 
St_complex((N_samples*(n1-1)+1):(N_samples*(n1-1)+N_samples))=(symbolstream(n1)*carrier).*gt; 
end 
subplot(222)
% figure(2) 
St_real=real(St_complex); 
plot(St_real) 
title('QAM 仿真波形图 载波 10Hz g(t) 为升余弦脉冲 '); 
xlabel('采样点 ') 
ylabel('幅度 ') 
%求出功率谱 ,这种功率谱不是按照公式直接计算的 ,而是对所产生的一段时间内的信号的采样点进行 FFT 所得到的
spectrum=(real(fft(St_real,10*length(St_real)))).^2; 
S_spectrum=spectrum(1:length(spectrum)/2); 
subplot(223)
% figure(3) 
F=0:fs/(2*length(S_spectrum)):fs/2-fs/(2*length(S_spectrum)); 
plot(F,10*log10(S_spectrum)) 
axis([0 50 -70 60]); 
title('QAM 信号功率谱密度 ') 
xlabel('频率 /Hz') 
ylabel('功率 ')
subplot(224)
% figure(4) 
index=40:160; 
plot(F(index),10*log10(S_spectrum(index))); 
axis([4 16 0 60]); 
title('QAM 信号功率谱密度在载频附近的放大图 ') 
xlabel('频率 /Hz') 
ylabel('功率 ')

set(gcf,'position',[300 50 900 700]);
set(gcf,'Name','~~~~QAM波形展示')
end
