function FSK_compare(inp,f,T)
%     inp='101011';
%     T=2;
    w=2*pi*f;
    t=0:0.01:6*T;
    st=str2num(inp(:))';
    y1=zqjxmc(t,T,st);
    y2=FSK_signal(t,T,st,f);
    y3=M_modulation(t,inp,w,T,4,'fsk');
    y4=M_modulation(t,inp,w,T,8,'fsk');
    subplot(4,1,1);
    plot(t,y1);
    grid on;
    title('原始电平');
    subplot(4,1,2);
    plot(t,y2);
    grid on;
    title('2FSK');
    subplot(4,1,3);
    plot(t,y3);
    grid on;
    title('4FSK');
    subplot(4,1,4);
    plot(t,y4);
    grid on;
    title('8FSK');
    set(gcf,'Name','~~~~FSK进制对比')
    set(gcf,'position',[300 50 900 700]);
end