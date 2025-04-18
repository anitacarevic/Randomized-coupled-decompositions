function [U,V,W] = RSI_CMF(X,Y,k)
% Randomized subspace iterations (RSI) coupled matrix factorization
% X=UV^T; Y=UW^T

[m,n1]=size(X);
[m,n2]=size(Y);
   q=2;             % q is a number between 2 and 5
O1=randn(n1,k);
O2=randn(n2,k);

for i=1:q        % RSI
 [Q1,~]=qr(X*O1,0);
 O1=X'*Q1;
 [Q2,~]=qr(Y*O2,0);
 O2=Y'*Q2;
end

[Q,~]=qr([Q1,Q2],0);

X=Q'*X; Y=Q'*Y;
  

[U,V,W] = cmf(X,Y,k);

U=Q*U;