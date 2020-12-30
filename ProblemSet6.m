%% Problem Set 6
% Jonathan Babu
set(0,'defaultfigurecolor',[1 1 1])
set(0,'defaultfigureposition',[0 0 700 350]);
format compact;
clc, clear, close all
%% Problem 1
% a)
figure(1);
clear all; close all; clc;
pc = physicsConstants();
sigmaLambda = [.04 .04 .04 .04 .04 .04];
specLambda = [656.30 486.1 434.1 410.2 397.0 388.9];
deltaEnergy = ((pc.h_eV)*(pc.c))./specLambda;
sigmaEnergy = (((pc.h_eV)*(pc.c)).*sigmaLambda)./(specLambda.^2);
ni = [3 4 5 6 7 8];
nf = [2 3 4 5 6 7];
errorbar((1./(ni.^2)),deltaEnergy,sigmaEnergy,'b.');
xlabel('1/n_{i}^{2}');
ylabel('Energy [eV]');

% b)
for i = 1:6
    y(i) = ((-1.36e-08)*(1/(ni(i)^2)))+(3.4e-09);
end
hold on;
plot((1./(ni.^2)),y,'g-');
legend('data', 'fitted line');

%c)
n = ((1./(nf.^2))-(1./(ni.^2)));
m = ((-1*(pc.me)*exp(4))/(2*((4*pi*pc.epsilonNot)^2)*(pc.hbar_eV)^2))
% the m is larger than the slope of the fitted line for some reason

%% Problem 2
clear all
close all
figure(2)
% a)
C = importdata('iron55.txt', ' ', 2);
x = C.data(:,1);
y = C.data(:,2);
b_graph = x;
% b_graph(b_graph<1.7) = NaN;
% b_graph(b_graph>500) = NaN;
plot(b_graph, y, 'b.')
hold on

%b)
A1 = 5005;
A2 = 1115;
x1 = 5.60000;
x2 = 6.45000;
b1 = 0.1073;
b2 = 0.1173;
mean1 = 0;
for i = 1:length(C.data(:,1))
    mean1 = mean1 + y(i);
end

mean1 = mean1 / length(C.data(:,1));
G = @(A,x,x0,w) A * exp((-(x-x0).^2) / (2*w^2));
axis ([0 8 -1000 6000])
xlabel('Energy [keV]')
ylabel('Counts')
x = C.data(:,1);
B = 231.2;
b = 100;
Bgk = @(x) B*exp((-x)/b);
plot(x, G(A1,x,x1,b1) + G(A2,x,x2,b2) + Bgk(x),'c--')
hold on


%c)
x = C.data(:,1);
y = C.data(:,2);
Model = @(A,x,x0,w) A.*exp((-(x-x0).^2)/(2*w^2))+B*exp((-x)/b) ;
ltheory = 0:8;
try
    fittedModel = fit(x, y, Model, 'StartPoint', 8);
    plot(ltheory, Model(fittedModel.A, fittedModel.x, fittedModel.b, ltheory), 'k-')
    legend('Data', 'Preliminary estimate', 'Fitted peaks')
    legend('Location', 'northwest')
catch
end
%% Problem 3
figure(3);
% a)
I = [0 0.519 0.725 1.019 1.259 1.527 1.756 2.081 2.332 2.538 2.744 3.015...
     3.246 3.578 3.755 4.04]; % Amps
B = [0 637.0 872 1203.7 1559.8 1848.1 2193.2 2556.3 2850.5 3113.6 3309.8...
     3674.4 3842.5 4080.8 4197.2 4387.5]; % Gauss
for i = 1:16
    bError(i) = 50; % Gauss
end
errorbar(I,B,bError,'ko')
% b)
newX = 0:0.2:5;
newY = interp1(I,B,newX,'linear');
hold on;
plot(newX,newY,'r-')

errorbar(I,B,bError,'ko')
hold on;
plot(newX,newY,'r-')
plot(I,B,'b-')

% c)
figure(3);
hold on;
newX2 = [0.25 1.4 2.9 3.8]
newY2 = interp1(I,B,newX2,'linear')
plot(newX2,newY2,'ro');
xlabel('Current [Amps]')
ylabel('Magnetic Field')