% 
% function y=zqjxmc(t,tt,p)
% %t为自变量时间，tt为矩形脉冲宽度，以纵轴为分界，p为矩形脉冲的周期
% y=0;
% for n=-5:5
%     y=y+djxmc(t-n.*p,tt);
% end
% end

% function y=zqjxmc(t,tt,p)
% %t为自变量时间，tt为矩形脉冲宽度，以纵轴为分界，p为矩形脉冲的周期,ys为t/p余数
% 
% ys=mod(t,p);
% y=1.*(ys<tt./2 | ys>(p-tt./2))+0.*(ys>tt./2 & ys<(p-tt./2))+0.5.*(ys==tt./2 | ys==(p-tt./2));
% end

function y=zqjxmc(t,T,st)
% t=0:0.01:10;
% T=2;
% st=[1,0,0,1,0,1];
y=0;
for n=1:length(st)*T
    t1=mod(n,6);
    if t1==0
        t2=6;
    else
        t2=t1;
    end
    y=y+st(t2).*(t> (n-1) & t<n);
    if t2<6
        if st(t2)==st(t2+1)
            jump=diff(y)~=0;
            jump=[jump false]|[false jump];
            y(jump)=st(t2);
         end
    end 
end
% plot(t,y);

