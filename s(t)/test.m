function test()
    Fc=10;   %载频
    Fs=40;   %系统采样频率
    Fd=1;    %码速率
    N=Fs/Fd;
    df=10;
    numSymb=25;%进行仿真的信息代码个数
    M=2;       %进制数
    SNRpBit=60;%信噪比
    SNR=SNRpBit/log2(M);
    seed=[12345 54321];
    numPlot=25;
    %产生25个二进制随机码
    x=randsrc(numSymb,1,[0:M-1]);%产生25个二进制随机码
    figure(1)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    title('二进制随机序列')
    xlabel('Time');
    ylabel('Amplitude');
    %调制
    y=fskdemod(x,Fc,Fd,Fs,M,df);
    numModPlot=numPlot*Fs;
    t=[0:numModPlot-1]./Fs;
    figure(2)
    plot(t,y(1:length(t)),'b-');
    axis([min(t) max(t) -1.5 1.5]);
    title('调制后的信号')
    xlabel('Time');
    ylabel('Amplitude');
    %相干解调
    randn('state',seed(2));
    y=awgn(y,SNR-10*log10(0.5)-10*log10(N),'measured',[],'dB');%在已调信号中加入高斯白噪声
    z1=ddemod(y,Fc,Fd,Fs,'fsk',M,df);
    %带输出波形的相干M元频移键控解调
    figure(3)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    hold on;
    stem([0:numPlot-1],z1(1:numPlot),'ro');
    hold off;
    axis([0 numPlot -0.5 1.5]);
    title('相干解调后的信号原序列比较')
    z1=ddemod(y,Fc,Fd,Fs,'fsk',M,df);
    %带输出波形的相干M元频移键控解调
    figure(4)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    hold on;
    stem([0:numPlot-1],z1(1:numPlot),'ro');
    hold off;
    axis([0 numPlot -0.5 1.5]);
    title('相干解调后的信号原序列比较')
    legend('原输入二进制随机序列','相干解调后的信号')
    xlabel('Time');
    ylabel('Amplitude');

    %非相干解调

    z2=ddemod(y,Fc,Fd,Fs,'fsk/noncoh',M,df);

    %带输出波形的非相干M元频移键控解调
    figure(5)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    hold on;
    stem([0:numPlot-1],z2(1:numPlot),'ro');
    hold off;
    axis([0 numPlot -0.5 1.5]);
    title('非相干解调后的信号')
    legend('原输入二进制随机序列','非相干解调后的信号')
    xlabel('Time');
    ylabel('Amplitude');
    %误码率统计
    [~, ratioSym]=symerr(x,z1);
    figure(6)
    simbasebandex([0:1:5]);
    title('相干解调后误码率统计')
    [~, ratioSym]=symerr(x,z2);      
    figure(7)
    simbasebandex([0:1:5]);
    title('非相干解调后误码率统计')
end