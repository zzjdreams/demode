function data=readw(filename,speed)
data = importdata(filename,'',speed);
%��ȡ

[m n]= size(data);

%Ѱ�Һ���%�ĵط�

for i =1:m
    temp = find(data{i}=='%');
    if isempty(temp)
        t(i) = 0;
    else
        t(i) = temp;
    end
end
