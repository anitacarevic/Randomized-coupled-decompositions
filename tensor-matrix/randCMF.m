function [U,V,W] = randCMF_basic(X,Y,p)
% randomized coupled matrix factorization
% X=UV^T; Y=UW^T

[m,n1]=size(X);
[m,n2]=size(Y);

O1=randn(n1,p);
O2=randn(n2,p);
[Q1,~]=qr(X*O1,0);
[Q2,~]=qr(Y*O2,0);
[Q,~]=qr([Q1,Q2],0);

X=Q'*X;
Y=Q'*Y;

[U,V,W] = cmf(X,Y,p);

U=Q*U;