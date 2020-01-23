function test()
    Fc=10;   %��Ƶ
    Fs=40;   %ϵͳ����Ƶ��
    Fd=1;    %������
    N=Fs/Fd;
    df=10;
    numSymb=25;%���з������Ϣ�������
    M=2;       %������
    SNRpBit=60;%�����
    SNR=SNRpBit/log2(M);
    seed=[12345 54321];
    numPlot=25;
    %����25�������������
    x=randsrc(numSymb,1,[0:M-1]);%����25�������������
    figure(1)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    title('�������������')
    xlabel('Time');
    ylabel('Amplitude');
    %����
    y=fskdemod(x,Fc,Fd,Fs,M,df);
    numModPlot=numPlot*Fs;
    t=[0:numModPlot-1]./Fs;
    figure(2)
    plot(t,y(1:length(t)),'b-');
    axis([min(t) max(t) -1.5 1.5]);
    title('���ƺ���ź�')
    xlabel('Time');
    ylabel('Amplitude');
    %��ɽ��
    randn('state',seed(2));
    y=awgn(y,SNR-10*log10(0.5)-10*log10(N),'measured',[],'dB');%���ѵ��ź��м����˹������
    z1=ddemod(y,Fc,Fd,Fs,'fsk',M,df);
    %��������ε����MԪƵ�Ƽ��ؽ��
    figure(3)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    hold on;
    stem([0:numPlot-1],z1(1:numPlot),'ro');
    hold off;
    axis([0 numPlot -0.5 1.5]);
    title('��ɽ������ź�ԭ���бȽ�')
    z1=ddemod(y,Fc,Fd,Fs,'fsk',M,df);
    %��������ε����MԪƵ�Ƽ��ؽ��
    figure(4)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    hold on;
    stem([0:numPlot-1],z1(1:numPlot),'ro');
    hold off;
    axis([0 numPlot -0.5 1.5]);
    title('��ɽ������ź�ԭ���бȽ�')
    legend('ԭ����������������','��ɽ������ź�')
    xlabel('Time');
    ylabel('Amplitude');

    %����ɽ��

    z2=ddemod(y,Fc,Fd,Fs,'fsk/noncoh',M,df);

    %��������εķ����MԪƵ�Ƽ��ؽ��
    figure(5)
    stem([0:numPlot-1],x(1:numPlot),'bx');
    hold on;
    stem([0:numPlot-1],z2(1:numPlot),'ro');
    hold off;
    axis([0 numPlot -0.5 1.5]);
    title('����ɽ������ź�')
    legend('ԭ����������������','����ɽ������ź�')
    xlabel('Time');
    ylabel('Amplitude');
    %������ͳ��
    [~, ratioSym]=symerr(x,z1);
    figure(6)
    simbasebandex([0:1:5]);
    title('��ɽ����������ͳ��')
    [~, ratioSym]=symerr(x,z2);      
    figure(7)
    simbasebandex([0:1:5]);
    title('����ɽ����������ͳ��')
end