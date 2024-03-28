clear all;
clc;
addpath('./datasets')

load('iris.dat')
X = iris(:,1:end-1);
label = iris(:,end);
Nc = 2;
Nr = 2;
M = 2;
maxIter = 100;
minImprove = 1e-6;
% X = iris(:,1:end-1);
clusteringOptions = [M maxIter minImprove true];


[lambda, gamma, center, U, W, distout] = Subspace(X,Nc,Nr, clusteringOptions);

t=toc
[maxU , index] = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);


