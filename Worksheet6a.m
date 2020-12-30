%% Worksheet 6a
%% Jonathan Babu, Noah Brown, Carson Rigby
set(0,'defaultfigurecolor',[1 1 1]); 
set(0,'defaultAxesFontSize',14);
set(0,'defaultfigureposition',[0 0 700 350]);
format compact;
clear all; close all;
%% Example 1
L = [0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3]; % m
T = [ 0.8446 1.0263 1.2185 1.3507 1.5359 1.6452 1.7803 1.8484 2.0009 2.0617 2.1544 2.2427]; % s
G=L./((T./(2*pi)).^2);
err=[0.022 0.022 0.022 0.022 0.022 0.022 0.022 0.022 0.022 0.022 0.022 0.022]; % ms

% part a
subplot(2,2,1)
errorbar(L,T,err,'ko')
hold on
pendulumModel= @(g,x) 2*pi*(sqrt(x./g));
tTheory=0:0.08:2;
plot(tTheory, pendulumModel(9.8,tTheory), 'b--');
[fittedModel,gof1]=fit(L',T',pendulumModel,'Weights',1./(err.^2),'StartPoint',[9.8])
plot(tTheory,pendulumModel(fittedModel.g,tTheory),'b-');
lgd=legend('Data','First Guess', 'Fitted Model');
xlabel('Length [m]');
ylabel('Period [s]');
set(lgd, 'location', 'northwest');
axis([0 1.5 0 2.5]);
hold off

% part b
T2=T.^2;
err2=[0.061 0.061 0.061 0.061 0.061 0.061 0.061 0.061 0.061 0.061 0.061 0.061]; % s^2
subplot(2,2,2)
errorbar(L,T2,err2,'ko')
hold on
pendModel= @(m,b,x) m*x+b;
tTheory2=0:0.08:1.5;
plot(tTheory2,pendModel(4,0,tTheory2),'g--');
[ft,gof]=fit(L',T2',pendModel,'Weights',1./err2.^2, 'StartPoint',[4,0])
plot(tTheory2,pendModel(ft.m,ft.b,tTheory2),'b-')
xlabel('Length [m]');
ylabel('Period Squared [s^2]');
% The fitted slope is  3.974. Calculating for g:
g=(2*pi/(sqrt(ft.m)))^2

% Part c
sum=0;
for ii=1:length(L)
   sum=sum+G(ii);
end
mean=sum/length(T);
sum2=0;
for k=1:length(L)
    sum2=sum2+((G(k)-mean)^2);
end
sig=sqrt(sum2/11)
sigma=ones(size(L))*sig;
subplot(2,2,3);
errorbar(L,G,sigma,'ko')
yline(mean,'b')
xlabel('Length [m]');
ylabel('Gravitational Acceleration [m/s^2]');

% part d
s3=0;
tTheory2=linspace(0,1.4,12);
for l=1:length(L)
    s3=(s3+((T(l)-(pendulumModel(fittedModel.g,L(l)))).^2)./err(l).^2);
end

chia=s3/11
chiA=gof1.sse/gof1.dfe

sum4=0;
for jj=1:length(L)
    sum4=(sum4+((T2(jj)-(pendModel(ft.m,ft.b,L(jj))))).^2./err2(jj).^2);
end
chib=sum4/10
chiB=gof.sse/gof.dfe

% Part b gives the most accurate measurement of g because the 
% chi squared is closest to 1 (at least closer than the 
% chi squared for part a).
