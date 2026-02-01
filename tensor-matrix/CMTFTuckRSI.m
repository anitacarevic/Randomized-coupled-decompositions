function [XX,YY,U,V,W,time] = CMTFTuckRSI(X,Y,k,noIter,q)
% coupled matrix tensor factorization
% tensor in Tucker format
% X \approx S x_1 U x_2 V2 x_3 V3; Y \approx UW^T

[m,n2,n3]=size(X);
X1=tenmat1(X);

%randomizacija
[~,n1] = size(X1);
[~,n2] = size(Y);

Omega1 = randn(n1,k);
Omega2 = randn(n2,k);

for i=1:q
    [Q1,~] = qr(X1*Omega1,0);
    Omega1 = X1'*Q1;
    [Q2,~] = qr(Y*Omega2,0);
    Omega2 = Y'*Q2;
end
[Q,~,~] = qr([Q1 Q2],0);
XQ = Q'*X1;
YQ = Q'*Y;

start = tic;
[U,V,W]=cmf(XQ,YQ,k);
time = toc(start);
U = Q*U;
S=matten1V(V',k,n2,n3);
XX=product1(S,U); % XX=S x_1 U x_2 V2 x_3 V3
YY=U*W'; % YY=UW^T