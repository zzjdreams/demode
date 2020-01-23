function y=PSK_demodulation(inp,f,T,Psnr)
%     inp='101011';
%     T=2;
    t=0:0.01:6*T;
    st=str2num(inp(:))';
    y1=zqjxmc(t,T,st);
    subplot(3,2,1);
    stem(t,y1);
    grid on;
    title('输入信号');
    
    y2=PSK_signal(t,T,st,f);
    SNR=10*log(Psnr); % 2%是能量比
    y20=awgn(y2,SNR);
    subplot(3,2,2);
    plot(t,y20);
    grid on;
    title('输出加噪信号');
    
    fs=2000;
    y3=lowp(y20,200,500,0.1,20,fs);
    subplot(3,2,3);
    plot(t,y3);
    grid on;
    title('滤波后');
    
    y4=y3.*cos(30*t);
    y5=lowp(y4,200,500,0.1,20,fs);
    subplot(3,2,4);
    plot(t,y5);
    grid on;
    title('二次滤波后');
    
    a=max(y5);
    b=min(y5);
    n=(max(y5)+min(y5))/2;
    
    
    y6=y3.*cos(2*pi*f*t);
    y7=1*(y6>0.05)+0*(y6<0);
%     y6=1*(y5>0.3);
    subplot(3,2,5);
    plot(t,y6);hold on;
    plot(t,y7,'r');hold off;
    grid on;
    title('乘以同频载波');
    
    subplot(3,2,6);
    stem(t,y7);
    grid on;
    title('乘以同频载波');
    set(gcf,'Name','PSK解调')
    set(gcf,'position',[300 50 900 700]);

end