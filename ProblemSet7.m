%% Problem Set 7
% Jonathan Babu
set(0,'defaultfigurecolor',[1 1 1]); 
set(0,'defaultAxesFontSize',14);
set(0,'defaultfigureposition',[0 0 700 350]);
format compact;

%% Problem 1
% I didn't know what the finiteDifference method was.

clear all
%% Problem 2
%a)
t = [0, 0.146, 1.89, 2.88, 3.78, 4.61, 5.43, 6.29, 7.1, 7.92, 8.75, 9.58];
x = [0, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
subplot(2,2,1)
plot(t,x)
xlabel('time[s]')
ylabel('distance[m]')

%b)
v = diff([eps; x(:)])./diff([eps; t(:)]);
v(1)=0;
v(2)=0;
v2 = v.*2.236941852;
subplot(2,2,2)
plot(t,v)
xlabel('time[s]')
ylabel('velocity [m/s]')

a = diff([eps; v(:)])./diff([eps; t(:)]);
a(1)=0;
subplot(2,2,3)
plot(t,a)
xlabel('time[s]')
ylabel('accel. [m/(s^2)]')

subplot(2,2,4)
plot(t,v2)
xlabel('time[s]')
ylabel('velocity [mph]')
%c)
v2(7)
% his top speed is at around 7 seconds, when he is going almost 27.3 mph.

%d)
figure(2)
% F = m*a; his mass is 94 kg
F = a.*94;
subplot(2,2,1)
plot(t,F)
% Ek = 1/2*m*v.^2
Ek = (v.^2)*47;
subplot(2,2,2)
plot(t,Ek)
% Power = work / time
P = diff([eps; Ek(:)])./diff([eps; t(:)]);
subplot(2,2,3)
plot(t,P)

%% Problem 3
clear all; close all;
r = linspace(0, 2, 100);
ao = 0.0529; %nm
A = (8/(27*sqrt(6)))*(ao^(-3/2));
R31 = @(r) A.*(1-(r./6*ao)).*(r./ao).*exp(-r./3*ao);
prob = R31(r)
%func = r.*R31^2.*r^2;
plot(prob,r)
% a)
%S = mcIntegral(prob, 0, 2, 1000);

%b)
%D = mcIntegral(func, 0, 2, 1000);
%disp(S)
%disp(D)

%c)
%S* 0.20

% I could not find a way to properly plot the probability values against
% the r values. My graph always looked crazy
%% Problem 4

R = 50e-2; %m
Q = 5e-9; %C
x = linspace( -1, 1, 0.1);
y = linspace( -1, 1, 0.1);
r = linspace( -1, 1, 0.1);

try
%a)
v = sphericalConductorPotential(x, y, R, Q);
contour(x, y, v)
xlabel('x [m]')
ylabel('y [m]')
[X,Y,Z] = meshgrid(x,y,z);
xlabel('x [m]')
ylabel('y [m]')
zlabel('V [volts]')

%b)
contour(x, y, v)
xlabel('x [m]')
ylabel('y [m]')
[X,Y,Z] = meshgrid(x,y,z);

xlabel('x [m]')
ylabel('y [m]')
zlabel('V [volts]')
catch
end
%% Functions
% I could not come up with the functions and plan on stopping by Office
% hours this week and seeing how you did all of this. 