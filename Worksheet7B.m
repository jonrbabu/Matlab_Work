%% Worksheet 7B
% Jonathan Babu, Noah Brown, Carson Rigby
set(0,'defaultfigurecolor',[1 1 1]); 
set(0,'defaultAxesFontSize',14);
set(0,'defaultfigureposition',[0 0 700 350]);
format compact;
%% Example 1
figure(1)
%a)
t=linspace(0,10,100);
y=exp(t-(t.^2));
plot(t,y,'r-')
hold on

%b)
myFun= @(t,y) y-(2.*t.*y);
[t,y1]=euler(myFun,0,1,0.05,200);

%c)
[t,y2]=heun(myFun,0,1,0.05,200);

%d)
[t,y3]=rungeKutta(myFun,0,1,0.05,200);

%e)
t0=0:0.05:10;
plot(t0,y1,'b-')
hold on
plot(t0,y2,'mo')
hold on
plot(t0,y3,'g.')
legend('Exact','Euler Method','Heun Method','RungeKutta Method');
xlabel('time [s]');
ylabel('height [m]');


% The step size of 0.05 converges the best, while 0.5 is too large of a
% step and 0.01 has too many points
%% Example 2
figure(2)
%a) see below

%b)
w=10; %rad/s
acc=@(t,x,v) -(w^2).*x;
[t,x,v]=newtonianODE1D(acc,0,10,200,0.01,500);
plot(t,x,'r-')
hold on

g=980; %cm/s
ac1=@(t,y,v) -w^2.*y-g;
[t,y,v]=newtonianODE1D(ac1,0,10,200,0.01,500);
plot(t,y,'b-')

b=2; % s^-1
ac2=@(t,y,v) -w^2*y-g-b*v;
[t,y,v]=newtonianODE1D(ac2,0,10,200,0.01,500);
plot(t,y,'k-')
xlabel('time [s]');
ylabel('position [cm]');
legend('Horizontal Spring','Vertical Spring','Vertical Damped Spring');

%% Functions
function [t,x,v]=newtonianODE1D(a,t0,x0,v0,dt,N)

for n=1:N
    t(1)=t0;
    x(1)=x0;
    v(1)=v0;
    tE=t(n)+dt;
    vE=v(n)+(dt*(a(t(n),x(n),v(n))));
    xE=x(n)+(dt*v(n));
    t(n+1)=t(n)+dt;
    v(n+1)=v(n)+(dt*(a(t(n),x(n),v(n))+a(tE,xE,vE))/2);
    x(n+1)=x(n)+(dt*(v(n)+v(n+1))/2);
end
end


function [t,y]=rungeKutta(dydt,t0,y0,dt,N)
h=dt;
t(1)=t0;
y(1)=y0;
dydt=@(t,y) y-(2.*t.*y);

for n=1:N
    t(n+1)=t(n)+h;
    k1=dydt(t(n),y(n));
    k2=dydt(t(n)+h/2,y(n)+(h/2.*k1));
    k3=dydt(t(n)+h/2,y(n)+(h/2.*k2));
    k4=dydt(t(n)+h/2,y(n)+(h/2.*k3));
    y(n+1)=(y(n)+(h*((k1/6)+(k2/3)+(k3/3)+(k4/6))));
end
end


function [t,y]=heun(dydt,t0,y0,dt,N)
h=dt;
t(1)=t0;
y(1)=y0;

for n=1:N
    t(n+1)=t(n)+h;
    ye=y(n)+(h.*dydt(t(n),y(n)));
    y(n+1)=y(n)+h/2.*(dydt(t(n),y(n)))+h/2.*(dydt(t(n+1),ye));
end
end


function [t,y]=euler(dydt,t0,y0,dt,N)
h=dt;
t(1)=t0;
y(1)=y0;

for n=1:N
    t(n+1)=t(n)+h;
    y(n+1)=y(n)+(h.*dydt(t(n),y(n)));
end
end