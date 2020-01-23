clear all;
clc;
t=-100:0.0001:100;
subplot(3,1,1);
plot(t,u_t(t));
set(gca,'xtick',-10:1:10);
title('阶跃函数');
ylabel('f(t)');
xlabel('t(s)');
axis([-10,10,-1,2]);
grid on;
subplot(3,1,2);
plot(t,djxmc(t,2));
set(gca,'xtick',-10:1:10);
text(6,1.5,['脉冲宽度=2s']);
title('矩形脉冲函数');
ylabel('f(t)');
xlabel('t(s)');
axis([-10,10,-1,2]);
grid on;
subplot(3,1,3);
% abc=zqjxmc(t,2,4).*cos(t);
% plot(t,abc);
plot(t,zqjxmc(t,4,4));
set(gca,'xtick',-10:1:10);
text(6,1.5,['脉冲宽度=2s']);
text(3,1.5,['周期=4s']);
title('周期矩形脉冲函数');
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
