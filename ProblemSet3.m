%% Problem Set 3
% Jonathan Babu
set(0,'defaultfigurecolor',[1 1 1])
set(0,'defaultAxesFontSize',14)
set(0,'defaultfigureposition',[0 0 700 350]);
format compact
restoredefaultpath
savepath
%% Problem 1
figure(1)
n_terms=100;
fib1=0;
fib2=1;

fib_total=zeros(n_terms,1);
fib_total(1)=fib1;
fib_total(2)=fib2;

for n=3:n_terms %This generates our graph
    fib_total(n)=fib_total(n-2)+fib_total(n-1);
end

%This part is just to calculate the 1000th term
n_terms2=1000;
fibt2 = zeros(n_terms2,1);
fibt2(1)=fib1;
fibt2(2)=fib2;

for ii=3:n_terms2
    fibt2(ii)=fibt2(ii-2)+fibt2(ii-1);
end

fib_total(10)
fib_total(100)
fibt2(1000)

loglog(fib_total,':','Color','b')
xlabel('n')
ylabel('Fibonacci Series')
clear all
%% Problem 2
figure(2)
%a)
s=15;
syms total
n_terms=15;
x=zeros(n_terms,1);
l=exp(1)/(exp(1)-1); %1.582
for n=1:15
    x(n)=exp(-(n-1))
    total(n)=sum(x)
end
x(5)
x(10)
x(15)
y2=(exp(1)/(exp(1)-1))
series_total=y2%The total goes to 1.582, which is equivalent to y2
plot(total,'Color', 'b', 'LineStyle', 'none', 'Marker', 'o')
hold on
yline(l,'r--')
clear all
%% Problem 3
t = linspace(0,10,100);
[x,y] = projectileSimple(0,0,20,50,t);
figure(1)
plot(x,y,'r--')
xlabel('x position')
ylabel('y position')
hold on
p1=plot(x(1),y(1),'k.','Markersize',35);
for j=2:length(x);
    set(p1,'XData',x(j),'YData',y(j));
    pause(0.05);
end
%%
%d)
%G=linspace(0,2*pi,10)
%z = 100
%[A,B] = pol2cart(G,sqrt(z))

%for ii=1:10
%    projectileSimple(0,0,A,B,t);
%    plot(x,y,'k--')
%    p2=plot(x(1),y(1),'r.','Markersize',10);
%    for jj=1:length(t)
%        set(p1,'XData',x(j),'YData',y(j));
%        pause(0.05);
%    end
%    xlabel('x position')
%    ylabel('y position')
%    hold on
%end
%[x,y] = projectileSimple(0,0,20,50,t);
%[x,y] = projectileSimple(x_0,y_0,v_x0,v_y0,t)

% Now, suppose we keep the initial speed constant, v0 = 100 m/s, but we 
% shoot the projectile at a variety of angles theta, 0 < theta < pi/2. Use 
%the function you created in Example 1 to convert
% the v and theta to V_0x and V_0y. For each value of theta, plot the projectile’s path y vs. x. (Plot at
% least 10 trajectories on your plot.)
% • Which angle has the largest range?
% • Find a pair of angles that land at the same place on the horizontal axis. Do they land at the
% same time? Which cannonball arrives first? Print out the two times that your projectiles
% land.

%I could not get 3d to work.
%% Problem 4
format long
%a)
pc=physicsConstants()

format longEng
%b)
format short
lamb1 = 700e-9; %nm
E=(pc.h_eV*pc.c)/(lamb1) %eV
%c)
F=(pc.K*(1.23e-9)*(-2.67e-9))/((1e-7)^2)
%d)
B=((pc.muNot)*(2e-3)*((0.1)^2))/((2*pi)*(((0.25)^2)+(0.1)^2)^(3/2))
clear all
%% Problem 5
figure(6)
figure(5)
figure(4)
figure(3)

%a)
A=30;
A2=60;
k2=2;
k=1;
w=10;
psi0=0;
psi1=5;
t=0:0.01:10;
x=0:0.01:10;
D=A*sin(k.*x-w.*t+psi0)
plot(t,D,'b--');
xlabel('time [s]')
ylabel('displacement[cm]')
hold on

%b)The minus sign makes the graph go down first, if it was
% a plus, then the graph would go up from the initial position.
try
p1 = plot(t(1),D(1),'r.','markersize',30);
hold on
for n=1:length(t)
    set(p1, 'XData', t(n), 'YData', D(n));
    pause(0.05)
end
catch
end
%c)wavelength= 1/wavenumber, wavelength = 1m
%frequency = 10Hz
%wavespeed = 10 m/s
%d)
D2=(A*sin(k.*x-w.*t+psi0))+(A2*sin(k2*x-w.*t+psi0))
plot(t,D2,'g--');
xlabel('time [s]')
ylabel('displacement[cm]')
hold on
try
p2 = plot(t(1),D2(1),'b.','markersize',30);
for ii=1:length(t)
    set(p2,'XData', t(ii), 'YData', D2(ii));
    pause(0.01)
end
catch
end
%e)
D3=(A2*sin(k2.*x-w.*t+psi0))-(A*sin(k*x-w.*t+psi1))
plot1=plot(t,D3,'g.');
xlabel('time [s]')
ylabel('displacement[cm]')
hold on
try
p3 = plot(t(1),D3(1),'m.','markersize',30);
for jj=1:length(t)
    set(p3,'XData', t(jj), 'YData', D3(jj));
    pause(0.01)
end
catch
end
%f)
%%
A = 0.3;
w = 10;
D = @(x,t) A*sin(k*x - w*t + psi0) + A*sin(k*x + w*t + psi0);
x = 0:0.1:10;
p1 = plot(x,D(x,0),'b-');
axis([0 10 -1 1])
hold on
t = 0;
try
while t<10;
    set(p1,'YData',real(D(x,t)))
    t = t + 0.01;
    pause(0.01)
end
catch
end
clear all