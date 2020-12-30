%% Worksheet 4b
% Jonathan Babu, 
D=importdata("vbs.txt")
%polarplot(D.data(:,2),D.data(:,3))
%[x,y,z] = findpeaks(D.data(:,2),D.data(:,3))
%axis = imread('https://pbs.twimg.com/media/DXkkAnOVwAAyTiX.jpg')
%axis equal
%image(axis)
%length(D(col.turn))
%D(VertBeamSize)
num1 = 0;
num2 = 0;
for i=1:100
    num2 = num1;
    num1 = D.data(i,2);
    num1 = (num1 + num2);
end
num1


%% Example 2
P=importdata("peaksAndNoise.txt")
i = P.data(:,1)
if i < 10
    plot(P.data(:,1),P.data(:,2),"g:", "MarkerSize",20)
end
plot(P.data(:,1),P.data(:,2))
mean(P.data(:,2))
std(P.data(:,2))
mean(P.data(:,1))
std(P.data(:,1))
