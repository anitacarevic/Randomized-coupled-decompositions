function [XX,YY,U,V,W] = CMTFCP(X,Y,k)
% coupled matrix tensor factorization
% tensor in Tucker format
% X \approx S x_1 U x_2 V2 x_3 V3; Y \approx UW^T

[m,n2,n3]=size(X);
X1=tenmat1(X);
[U,V,W]=cmf(X1,Y,k);

XX1 = U*V';
XX=matten1V(XX1,m,n2,n3);
YY=U*W'; % YY=UW^T