%% Worksheet 3a
% Jonathan Babu, Noah Brown, Carson Rigby
set(0,'defaultfigurecolor',[1 1 1])
set(0,'defaultAxesFontSize',14)
set(0,'defaultfigureposition',[0 0 700 350]);
format compact
%% Example 1
a = 5.5
b = 1.5
%a)
if (a < 10.0)
    true
end
%b)
if ~(a ==3*b)
    1
end
%c)
if (a<10) & (a>5)
    true
end
clear all
%% Example 2
a = 6
b = 10
c = -2
%a)
x1 = (abs(c) > 3) & (c < (b-a)) & ((b+a) > 3)
%b)
x2 = (b == 10) | (a < 4)
%c)
x3 = (a*5 >= b*3) & (c < a)
%d)
if (x1 == 1)
    'The statement x1 is true'
else
    'The statement x1 is false'
end
if (x2 == 1)
    'The statement x1 is true'
else
    'The statement x1 is false'
end
if (x3 == 1)
    'The statement x1 is true'
else
    'The statement x1 is false'
end
clear all
%% Example 3
for k = 1:1:10
    s(k) = k^3
end
clear all
%% Example 4
sum = 0;
for n = 1:1:6
    s = 2^n;
    sum = sum + s;
end
clear all
%% Example 5
%a)
figure(1);
tic
s1 = 0
for i = 1:1:10
    for j = 1:1:10
        s1(j,i) = i + j;
    end
end
toc

[I,J] = meshgrid(1:10,1:10);
surf(I,J,s1)
%b)
figure(2);
tic
s2 = 0
for i = 1:1:1000
    for j = 1:1:1000
        s2(j,i) = i + j;
    end
end
toc

[I,J] = meshgrid(1:1000,1:1000);
surf(I,J,s2) 
% It takes part b ten times longer to run than part a
clear all
%% Example 6
q = randi(100);
y = 0;
n = 0;
while y ~= q
    y = input('Guess the magic number! ')
    n = n + 1;
    if y < q
        "Your guess was too low, try again."
    elseif y > q
            "Your guess was too high, try again"
    else
        disp(['You guessed right! It took you ', num2str(n), ' guesses'])
        break
    end
end