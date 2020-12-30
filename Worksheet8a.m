%% Worksheet 8a
% Jonathan Babu, Carson Rigby, Noah Brown
set(0,'defaultfigurecolor',[1 1 1])
set(0,'defaultAxesFontSize',14)
set(0,'defaultfigureposition',[0 0 700 350]);
format compact
%% Example 1
y=linspace(0,5,20)
dydt = @(y,t) ( (y) - (2*t.*y) );
ic = 1;
tspan = [0 5];
[t,x] = ode45(dydt,tspan,ic);
plot(t,x)
hold on
g=[0 5]
y2 = exp(g-(g.^2))

%fplot(y2,g,'b.')

% Couldn't get my function to plot

% Don't know how many steps it used
% I see the adaptive step


%% Example 2
clear all
close all
%a)
tspan = [0 5]
ic = [0.1 2]
omega = 10
sDer = @(t,v) [v(2); -omega^2*v(1)];
[t,data] = ode45(sDer, tspan, ic);
plot(t,data(:,1),'b-')
hold on
%b)
pc=physicsConstants();
sDer2 = @(t,q) [q(2); -omega^2*q(1)-pc.g];
[q,data] = ode45(sDer2, tspan, ic);
plot(q,data(:,1))
hold on
%c)
b=2
sDer3 = @(t,p) [p(2); -omega^2*p(1)-pc.g-b*t];
[p,data] = ode45(sDer3, tspan, ic);
plot(p,data(:,1))
%d) & e)
%don't know how to do



%% Example 3

% Don't know how to do it.