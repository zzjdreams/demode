function y=M_modulation(t,inp,w,T,M,type)
    
    % Check that M is a positive integer
    if (~isreal(M) || ~isscalar(M) || M<2 || (ceil(M)~=M) || ~isnumeric(M))
        error(message('comm:fskdemod:Mreal'));
    end

    % Check that M is of the form 2^K
    if(~isnumeric(M) || ceil(log2(M)) ~= log2(M))
        error(message('comm:fskdemod:Mpow2'));
    end
    
    k=log2(M);
    b=[];
    while mod(length(inp),k)~=0
        inp=strcat(inp,'0');
    end
    for i=1:k:length(inp)
        num=bin2dec(inp(i:i+k-1));
        b=[b num];
    end
%     每隔k个获取一次数据
    y=0;
    
%     -------------------------------ASK--------------------------------
    if strcmp(type,'ask')
        for n=1:length(b)*T
            t1=mod(n,length(b));
            if t1==0 
                t2=length(b);
            else
                t2=t1;
            end
            y=y+b(t2).*(t> (k*n-k) & t<n*k);
        end
        y=y.*cos(w*t);
       
    end
    
% ------------------------------------END----------------------------------

% ------------------------------------FSK----------------------------------
    if strcmp(type,'fsk')
        for n=1:length(b)*T
            t1=mod(n,length(b));
            if t1==0
                t2=length(b);
            else
                t2=t1;
            end
            y=y+cos((b(t2)*5+w)*t).*(t> (k*n-k) & t<n*k);
        end
        
        
    end
% ------------------------------------END----------------------------------

% ------------------------------------PSK----------------------------------
     if strcmp(type,'psk')
        for n=1:length(b)*T
            t1=mod(n,length(b));
            if t1==0
                t2=length(b);
            else
                t2=t1;
            end
            y=y+cos(w*t+(2*pi*b(t2)/M)).*(t> (k*n-k) & t<n*k);
        end
        
       
    end
    
% ------------------------------------END----------------------------------

end
