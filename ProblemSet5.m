%% Problem Set 5
% Jonathan Babu
set(0,'defaultfigurecolor',[1 1 1])
set(0,'defaultAxesFontSize',14)
set(0,'defaultfigureposition',[0 0 700 350]);
format compact
clear all
close all
%% Problem 1
figure(1)
%a)
Ia = [0,5,10,15,20,25,30,35];
Ra = [0,9,18,20,38,39.5,50,66];
err = [3,3,3,3,3,3,3,3];
errorbar(Ia,Ra,err,'b.','Markersize',15)
hold on
%theory curve
n2 = 1.00029;
k = @(Ia,Ra) sin((1*asin(Ia))./n2);
q = @(Ia,Ra) sin((1.25*asin(Ia))./n2);
plot(Ia,k(Ia,Ra),'r-')
hold on
plot(Ia,q(Ia,Ra))
hold on
xlabel('\theta_{1} [deg]')
ylabel('\theta_{2} [deg]')
legend({'data', 'n=1','n=2','best guess'},'Location','northwest')
title('Problem 1')
%my best guess at the index of refraction would be
m = @(Ir,Ra) sin(1.16*asin(Ia)./n2);
plot(Ia,m(Ia,Ra),'k-')
%% 
%b)
%y = chi2pdf(k(Ia,Ra),2)
%plot(IR,y)

% I couldn't get my second graph to load, but I would guess the index of
% refraction would be around 1.5, because according to the graph on the
% problem statement that's where the highest probability would be.