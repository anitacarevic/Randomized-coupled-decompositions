function [XX,YY,U,V,W,time] = CMTFTuckRBKI(X,Y,k,noIter,kX,kY,qX,qY)
% coupled matrix tensor factorization
% tensor in Tucker format
% X \approx S x_1 U x_2 V2 x_3 V3; Y \approx UW^T

[m,n2,n3]=size(X);
X1=tenmat1(X);

%randomizacija
[QX,~] = MyRBKI(X1, kX, qX);
[QY,~] = MyRBKI(Y, kY, qY);
[Q,R,E] = qr([QX QY], 0);

Q = Q(:,E);

tol = m*eps;
rQ = kX*qX + kY*qY;
for i = 1:(kX*qX + kY*qY)
    if abs(R(i,i)) < tol
        rQ = i-1;
        break;
    end
end

XQ = Q(:,1:rQ)'*X1;
YQ = Q(:,1:rQ)'*Y;

start = tic;
[U,V,W]=cmf(XQ,YQ,k);
time = toc(start);
U = Q*U;
S=matten1V(V',k,n2,n3);
XX=product1(S,U); % XX=S x_1 U x_2 V2 x_3 V3
YY=U*W'; % YY=UW^T
