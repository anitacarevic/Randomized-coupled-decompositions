function [X,Y] = testmCMTFCP
% test tensor and matrix for 
% coupled matrix tensor factorization 
% X=[[U,B,C]]; Y=U*W^T

m=100;
n2=50;
n3=20;                                          % X... m x n2 x n3
n=30;                                           % Y... m x n
r=5;                                            % joint part

U=randn(m,r); B=randn(n2,r); C=randn(n3,r); W=randn(n,r);

X=outpr(U,B,C);                                 % exact factorization
Y=U*W';
