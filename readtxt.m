% % data = importdata("##try.txt",'',10000)
% % %��ȡ
% % 
% % [m n]= size(data)
% % 
% % %Ѱ�Һ���%�ĵط�
% % 
% % for i =1:m
% %     temp = find(data{i}=='%')
% %     if isempty(temp)
% %         t(i) = 0
% %     else 
% %         t(i) = temp
% %     end
% % end
haha=nan;
[filename, pathname] = uigetfile('*.txt','File Selector');
wenjian = [pathname filename];
fp =fopen(wenjian);
i=1;
while ~feof(fp)
strl{i}=fgetl(fp);
fprintf('%s\n',strl{i})
i=i+1;

end
fclose(fp);

% 
% set(handles.edit1,'string',strl)