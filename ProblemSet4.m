%% Problem Set 4
% Jonathan Babu
set(0,'defaultfigurecolor', [1 1 1])
set(0,'defaultAxesFontSize', 14)
set(0,'defaultfigureposition', [0 0 700 350]);
format long;
format compact;
%% Problem 1
figure(1)
Array = csvread('coastline.csv');
plot(Array(:,1),Array(:,2))
hold on;
B = importdata('cities.csv');
c1 = B.data(:,1);
c2 = B.data(:,2);
c3 = B.data(:,3);
scale=0;
for k=1:length(c3)
    if c3(k)>=1000000;
        scale=c3(k)/1000000;
        plot(c2(k),c1(k),'r.', 'MarkerSize',scale)
    end
end
xlabel('Longitude [deg]');
ylabel('Lattitude [deg]');
clear all
%% Problem 2
figure(2)
load('SLO_extended.mat');
load('bath_topo_cmap.mat');
x0 = find(z(:,:)==0);
slo = imagesc(x,flip(y),z);
hold on
colormap(bath_topo_cmap)
caxis([-2000 2000])
cb = colorbar;
set(get(cb,'Title'),'String','Elevation [m]')
xlabel('Longtitude')
ylabel('Latitude')
text(-120.6689, flip(36.267),'San Luis Obispo')

%Couldn't get the contour lines
clear all;
%% Problem 3
figure(3)
B = importdata('barium133.txt',' ',18);
Energy = B.data(:,1);
Counts = B.data(:,2);
x = 0:0.1:600;

mean1= 29;
SD1= 20/2;
x1 = mean1-2.35*SD1:0.1:mean1+2.35*SD1;
A1= 1050;
Gaus1 = A1*exp(-(x-mean1).^2 /(2*SD1^2));

mean2=82;
SD2= 25/2;
x2 = mean2-2.35*SD2:0.1:mean2+2.35*SD2;
A2= 515;
Gaus2 = A2*exp(-(x-mean2).^2 /(2*SD2^2));

mean3= 358;
SD3= 50/2;
x3 = mean3-2.35*SD3:0.1:mean3+2.35*SD3;
A3= 195;
Gaus3 = A3*exp(-(x-mean3).^2 /(2*SD3^2));
Gaus = Gaus1+Gaus2+Gaus3;

mean1= 29;
SD1= 18/2;
x1 = mean1-2.35*SD1:0.1:mean1+2.35*SD1;
A1= 1050;
Gausb1 = A1*exp(-(x-mean1).^2 /(2*SD1^2));

mean2=80;
SD2= 25/2;
x2 = mean2-2.35*SD2:0.1:mean2+2.35*SD2;
A2= 480;
Gausb2 = A2*exp(-(x-mean2).^2 /(2*SD2^2));

mean3= 358;
SD3= 45/2;
x3 = mean3-2.35*SD3:0.1:mean3+2.35*SD3;
A3= 190;
Gausb3 = A3*exp(-(x-mean3).^2 /(2*SD3^2));

mean4= 166;
SD4= 75/2;
x4 = mean4-2.35*SD4:0.1:mean4+2.35*SD4;
A4= 120;
Gaus4 = A4*exp(-(x-mean4).^2 /(2*SD4^2));

mean5= 230;
SD5= 80/2;
x5 = mean5-2.35*SD5:0.1:mean5+2.35*SD5;
A5= -8;
Gaus5 = A5*exp(-(x-mean5).^2 /(2*SD5^2));
 
mean6= 290;
SD6= 40/2;
x5 = mean5-2.35*SD6:0.1:mean5+2.35*SD6;
A6= 100;
Gaus6 = A6*exp(-(x-mean6).^2 /(2*SD6^2));
Gaus2 = Gausb1+Gausb2+Gausb3+Gaus4+Gaus5+Gaus6;

plot(Energy,Counts,'b.')
xlabel(B.colheaders{1})
ylabel(B.colheaders{2})
axis([0 600 0 1200])
hold on
plot(x,Gaus,'g-')
hold on
plot(x,Gaus2,'k-')
hold on
clear all

%The energies of the most common X-Rays in the spectrum are around 29, 88,
%and 352 KeV. My answers were not close to what I found online, I found
%values 32, 4.46, and 36 KeV, but they do fall close within the width of my
%peaks.