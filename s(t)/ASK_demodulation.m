function y=ASK_demodulation(inp,f,T,Psnr)
%     inp='101011';
%     T=2;
    t=0:0.01:6*T;
    st=str2num(inp(:))';
    
    y1=zqjxmc(t,T,st);
    subplot(3,2,1);
    stem(t,y1);
    title('原始信号');
    grid on;
    y2=ASK_signal(t,T,st,f);
    
%     信噪比的计量单位是dB，其计算方法是10lg(PS/PN)
    SNR=10*log(Psnr); % 2%是能量比
    y20=awgn(y2,SNR);
    
    
    y3=(fft(y1));
    subplot(3,2,2);
    plot(t,y20);
    title('加噪声后的信号');
    grid on;
    subplot(3,2,3);
    plot(t,abs(y3));
    title('进行傅里叶变换');
%     figure(2);
    fs=2000;
    y4=lowp(y2,100,500,0.1,20,fs);
    subplot(3,2,4);
    plot(t,abs(y4));
    title('进行低通滤波信号');
    grid on;
    y6=y4.*cos(t);
    y5=lowp(y6,100,400,0.1,20,fs);
    subplot(3,2,5);
    plot(t,abs(y5));
    title('二次滤波信号');
    grid on;
    subplot(3,2,6);
    y7=1*(abs(y5)>0.05);
    stem(t,y7,'r');
    title('解调信号');
    grid on;
    set(gcf,'Name','ASK解调')
    set(gcf,'position',[300 50 900 700]);

end

