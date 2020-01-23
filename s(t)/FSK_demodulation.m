function y=FSK_demodulation(inp,f,T,Psnr)
%     inp='101011';
%     T=2;
    t=0:0.01:6*T;
    st=str2num(inp(:))';
    y1=zqjxmc(t,T,st);
    subplot(3,2,1);
    stem(t,y1);
    grid on;
    title('�����ź�');
    
    y2=FSK_signal(t,T,st,f);
    subplot(3,2,2);
    plot(t,y2);
    grid on;
    title('2FSK�źŲ���');
    SNR=10*log(Psnr); % 2%��������
    y20=awgn(y2,SNR);
    
    fs=2000;
    y3=lowp(y20,200,500,0.1,20,fs);
    
  %������������źŷֳ���·�źţ�������ԭ�����ź�
    yw1=abs(y3).*y1;
    yw2=abs(y3).*zqjxmc(t,T,-1*st+1);
    yw1l=lowp(yw1,200,500,0.1,20,fs);
    yw2l=lowp(yw2,200,500,0.1,20,fs);
    
    y4=1*(abs(yw1l)>0.05);
    y5=1*(abs(yw2l)>0.05);
    
    subplot(3,2,3);
    plot(t,y20);
    title('����������ź�');
    grid on;
    
    subplot(3,2,4);
    plot(t,yw1l);hold on;
    plot(t,y4,'r');hold off;
    grid on;
    title('��һ·�ź�');
    
    subplot(3,2,5);
    plot(t,yw2l);hold on;
    plot(t,y5,'r');hold off;
    grid on;
    title('�ڶ�·�ź�');
    
    subplot(3,2,6);
    stem(t,y4);
    title('�����');
    
%     fs=2000;
%     y3=lowp(y20,200,500,0.1,20,fs);
%     subplot(5,1,3);
%     plot(t,y3);
%     title('�˲���');
%     
%     y4=y3.*cos(30*t);
%     y5=lowp(y4,200,500,0.1,20,fs);
%     subplot(5,1,4);
%     plot(t,y5);
%     title('�����˲���');
%     
%     a=max(y5)
%     b=min(y5)
%     n=(max(y5)+min(y5))/2
%     y6=1*(y5>0.3);
%     subplot(5,1,5);
%     plot(t,y6);
%     title('�����');

  
    
    set(gcf,'Name','FSK���')
    set(gcf,'position',[300 50 900 700]);


end