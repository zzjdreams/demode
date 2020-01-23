function data=readw(filename,speed)
data = importdata(filename,'',speed);
%读取

[m n]= size(data);

%寻找含有%的地方

for i =1:m
    temp = find(data{i}=='%');
    if isempty(temp)
        t(i) = 0;
    else
        t(i) = temp;
    end
end
