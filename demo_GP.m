
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

Xinit_norm = normaliseData(Xinit, xbounds);
yinit_norm = normaliseData(yinit, ybounds);

koptions = [.1 1];
gp = fitGP(Xinit_norm, yinit_norm, xbounds, ybounds, koptions);

%% BO

xnew_norm = recommendSample(gp, 2, koptions);
xnew = rescaleData(xnew_norm, gp.xbounds);
ynew = myfunction(xnew);
ynew_norm = normaliseData(ynew, gp.ybounds);
gp = updateGP(gp, xnew_norm, ynew_norm, koptions);

