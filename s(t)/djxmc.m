function y=djxmc(t,tt)
%ttΪ������������Ŀ�ȣ�tΪ�Ա���ʱ�䣬��t=0 Ϊ�ֽ磬���Ҹ�tt/2�Ŀ��
y=u_t(t+tt/2)-u_t(t-tt/2);
end