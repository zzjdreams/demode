function y=jump(Y)
    jump=diff(Y)~=0;
    jump=[jump false]|[false jump];
    Y(jump)=nan;
    y=Y;
end