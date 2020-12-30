%% Worksheet 2
% Jonathan Babu

set(0,'defaultfigurecolor',[1 1 1])
set(0,'defaultAxesFontSize',14)
set(0,'defaultfigureposition',[0 0 700 350]);
format compact
%% Example 1
figure(1)
u=[0.08,0.015,0.009,0.006,0.0055];
time=[5,20,30,50,55];
plot(time,u,"r.", "MarkerSize",20)
xlabel('Temp [C]')
ylabel('\mu [mPa*s]')
clear all
%% Example 2
figure(2)
t=linspace(0,10,20);
y=4*t.^3-40*t.^2+7*t;
subplot(2,2,1)
plot(t,y,"go", "MarkerSize",10)
hold on
plot(t,y,"k:")
xlabel("time[s]")
ylabel("y[m]")
grid on
subplot(2,2,2)
plot(t,y,"b--")
hold on
plot(t,y,"mo")
xlabel("time[s]")
ylabel("y[m]")
hold on
grid on
subplot(2,2,3)
plot(t,y,"r-.")
xlabel("time[s]")
ylabel("y[m]")
hold on
grid on
subplot(2,2,4)
plot(t,y,"k+")
hold on
plot(t,y,"b")
xlabel("time[s]")
ylabel("y[m]")
grid on

clear all
%% Example 3
figure(3)
x=linspace(-1.5,1.5,25);
F=@(x)x.^2;
G=@(x)1.5*exp((-x.^2)/(2*(.5^2)));
subplot(2,2,1)
plot(F(x),"k*")
hold on
plot(F(x),"c",'HandleVisibility', 'off')
plot(G(x),"mo")
plot(G(x),"g--")
grid on
xlabel("x [m]")
ylabel('f(x) [m^{2}], g(x) [m^{3}]')
legend("f(x)=x^{2}", "g(x)=1.5e^{-x^{2}/2(.5)^{2}}")
subplot(2,2,2)
loglog(x,F(x),"c")
hold on
loglog(x,F(x),"k*")
loglog(x,G(x),"g--")
loglog(x,G(x),"mo")
grid on
subplot(2,2,3)
semilogy(x,F(x),"c")
hold on
grid on
semilogy(x,F(x),"k*")
semilogy(x,G(x),"mo")
semilogy(x,G(x),"g--")
xlabel("x [m]")
ylabel('f(x) [m^{2}],g(x) [m^{3}]')
subplot(2,2,4)
semilogx(x,F(x),"c")
hold on
semilogx(x,F(x),"k*")
semilogx(x,G(x),"g--")
semilogx(x,G(x),"mo")
xlabel("x [m]")
ylabel('f(x) [m^{2}],g(x) [m^{3}]')
grid on
%The warnings from matlab were all about ignoring the negative values
%that came out of our function. It helps keep the graph clean.
clear all
%% Example 4
figure(4)
k=19.2;
F=@(x)x*(-k);
x=[0,20,55,78,98,130,154,173,205];
xnew=x/1000;
f=linspace(0,-4,9);
sigma=[.2,.22,.02,.01,.06,.2,.11,.21,.05];
errorbar(x,f,sigma,"k.")
hold on
grid on
plot(x,F(xnew),"g")
xlabel("x [mm]")
ylabel("force [N]")
clear all
%% Example 5
figure(5)
f=@(x)sin(x)
x1=linspace(0,20,5);
x2=linspace(0,20,10);
x3=linspace(0,20,100);
plot(x1,f(x1), "r--")
hold on
plot(x2,f(x2), "g--")
hold on
plot(x3,f(x3), "b")
grid on
xlabel("x")
ylabel("f(x)")

%I think you'd need at least 80 points to get a good sense of the graph.
clear all