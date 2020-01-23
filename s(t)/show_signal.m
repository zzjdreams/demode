function y=show_signal(t,T,st,f)
    subplot(4,1,1);
    plot(t,zqjxmc(t,T,st));
 
    grid on;
    ylabel('幅度值');
    title('输入信号');
    
    subplot(4,1,2);
    plot(t,ASK_signal(t,T,st,f));
     grid on;
    ylabel('幅度值');
    title('2ASK信号');
    
    subplot(4,1,3);
    plot(t,FSK_signal(t,T,st,f));
     grid on;
    ylabel('幅度值');
    title('2FSK信号');
    
    subplot(4,1,4);
    plot(t,PSK_signal(t,T,st,f));
     grid on;
    ylabel('幅度值');
    title('2PSK信号');
    
%     subplot(6,1,5);
%     plot(t,FSK_signal(t,T,st));
%     ylabel('幅度值');
%     title('MSK信号');
%     
%     subplot(6,1,6);
%     plot(t,FSK_signal(t,T,st));
%     ylabel('幅度值');
%     title('QAM信号');
end