function d=EJZ(a)
b='';
n=length(a);
if n<6
    for n1=0:6-n-1    
        b=strcat('0',b);
    end
    d=strcat(b,a);
end
if n==6
    d=a;
end
% if n>4
%     d='0000';
% end
end