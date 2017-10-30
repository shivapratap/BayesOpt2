clear;clc;close all;
rng(18);

%% Original Function

x = 0:0.1:15;
%x = -5:0.1:5;
y = myfunction(x);

n = length(x);
nDim = 1;
xbounds = [min(x) ; max(x)];
ybounds = [min(y), max(y)]';
figure(1);hold on;
plot(x, y)


%% Bayes Opt Parameters

% Sample some points and get their function value
numSamples = 3; 
Xinit = getSamplesBO(numSamples, nDim, xbounds);
yinit = myfunction(Xinit);

figure(1);
scatter(Xinit, yinit);

%% Initialize the GP

%koptions = [0.1 1];
%Xinit_norm = normaliseData(Xinit, xbounds);
%yinit_norm = normaliseData(yinit, ybounds);

gp = fitGP(Xinit, yinit, xbounds);

%% BO

xnew = recommendSample(gp, 2);
ynew = myfunction(xnew);
gp = updateGP(gp, xnew, ynew);


