function y=show_signal(t,T,st,f)
    subplot(4,1,1);
    plot(t,zqjxmc(t,T,st));
 
    grid on;
    ylabel('����ֵ');
    title('�����ź�');
    
    subplot(4,1,2);
    plot(t,ASK_signal(t,T,st,f));
     grid on;
    ylabel('����ֵ');
    title('2ASK�ź�');
    
    subplot(4,1,3);
    plot(t,FSK_signal(t,T,st,f));
     grid on;
    ylabel('����ֵ');
    title('2FSK�ź�');
    
    subplot(4,1,4);
    plot(t,PSK_signal(t,T,st,f));
     grid on;
    ylabel('����ֵ');
    title('2PSK�ź�');
    
%     subplot(6,1,5);
%     plot(t,FSK_signal(t,T,st));
%     ylabel('����ֵ');
%     title('MSK�ź�');
%     
%     subplot(6,1,6);
%     plot(t,FSK_signal(t,T,st));
%     ylabel('����ֵ');
%     title('QAM�ź�');
end