clear all;
clc;
t=-100:0.0001:100;
subplot(3,1,1);
plot(t,u_t(t));
set(gca,'xtick',-10:1:10);
title('��Ծ����');
ylabel('f(t)');
xlabel('t(s)');
axis([-10,10,-1,2]);
grid on;
subplot(3,1,2);
plot(t,djxmc(t,2));
set(gca,'xtick',-10:1:10);
text(6,1.5,['������=2s']);
title('�������庯��');
ylabel('f(t)');
xlabel('t(s)');
axis([-10,10,-1,2]);
grid on;
subplot(3,1,3);
% abc=zqjxmc(t,2,4).*cos(t);
% plot(t,abc);
plot(t,zqjxmc(t,4,4));
set(gca,'xtick',-10:1:10);
text(6,1.5,['������=2s']);
text(3,1.5,['����=4s']);
title('���ھ������庯��');
ylabel('f(t)');
xlabel('t(s)');
axis([-10,10,-1,2]);
grid on
figure(1);

figure(2);
subplot(3,1,1);
plot(t,cos(4*t));
axis([-20,20,-1,1]);
grid on

subplot(3,1,2);
abc=zqjxmc(t,2,2);
plot(t,abc);
axis([-20,20,-1,1]);
grid on

subplot(3,1,3);
abc=zqjxmc(t,2,4).*cos(4*t);
plot(t,abc);
axis([-20,20,-1,1]);
grid on
