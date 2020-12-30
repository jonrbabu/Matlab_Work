%% Worksheet 4a
set(0,'defaultfigurecolor',[1,1,1])
set(0,'defaultAxesFontSize',14)
format compact;
set(0,'defaultfigureposition',[0 0 700 350]);
clear all; close all; clc;
%% Carson Rigby, Jon Babu, Noah Brown
%% Example 1
clear all; close all; clc;
weight = input('What is your weight in kilograms?  ')
height = input('What is your height in meters?  ')
bmi = weight/(height^2)
myString = ['Your body-mass index is ', num2str(bmi), ' kg/m^2'];
disp(myString)
%% Example 2
% a)
clear all; close all; clc;
m = 0.01;
for i = 1:30
    myString = ['Day ',num2str(i),': $',num2str(m)];
    disp(myString)
    m = 2*m;
end
myString2 = ['We would take a penny doubled per day because we would end with $',num2str(m/2),' instead of $1000000.00.'];
disp(myString2)
% b)
fid = fopen('penny.txt','w');
fprintf(fid, myString);
fclose(fid);
%% Example 3
clear all; close all; clc;
figure(1);
% a)
x = linspace(0,4*pi,400);
y = exp((x.^2)/10).*sin(x);
save('expsin.mat','x','y');
% b)
clear all; 
% The x and y arrays no longer exist
% c)
load('expsin.mat');
plot(x,y,'bo--');
xlabel('This many radians');
ylabel('This many y-values');
title('This Many by This Many on a Graph');
%% Example 4
clear all; close all; clc;
figure(2);
myPic = imread('https://www.mathworks.com/help/examples/matlab/win64/MatlabLogoExample_08.png');
image(myPic)
axis equal;
%% Example 5
clear all; close all; clc;
figure(3);
% a)
A = importdata('vbs.txt',' ',1);
myString3 = ('We would rather use the importdata function over the load function because the load function is used for .mat files, and the vbs file is a .txt file.');
disp(myString3)
% b)
set(0,'defaultfigureposition',[0 0 1000 300]);
errorbar(A.data(:,1),A.data(:,2),A.data(:,3),'m*-');
% c)
hold on;
num1 = 0;
num2 = 0;
for i=1:100
    num2 = num1;
    num1 = A.data(i,2);
    num1 = (num1 + num2);
end
avg = num1/100
avgArray = [1:100];
for j = 1:100
    avgArray(j) = avg;
end
plot(A.data(:,1),avgArray,'k:');
