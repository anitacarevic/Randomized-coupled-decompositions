function [XX,YY,U,V,W,time] = CMTFTuckRBKI(X,Y,k,noIter,kX,kY,qX,qY)
% coupled matrix tensor factorization
% tensor in Tucker format
% X \approx S x_1 U x_2 V2 x_3 V3; Y \approx UW^T

[m,n2,n3]=size(X);
X1=tenmat1(X);

%randomizacija
[QX,~] = MyRBKI(X1, kX, qX);
[QY,~] = MyRBKI(Y, kY, qY);
[Q,~,~] = qr([QX QY], 0);

XQ = Q'*X1;
YQ = Q'*Y;

start = tic;
[U,V,W]=cmf(XQ,YQ,k);
time = toc(start);
U = Q*U;
S=matten1V(V',k,n2,n3);
XX=product1(S,U); % XX=S x_1 U x_2 V2 x_3 V3
YY=U*W'; % YY=UW^T