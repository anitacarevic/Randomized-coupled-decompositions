function [U,V,W] = RandCMFrbki_2(X,Y,kQ,q,k)
% Randomized CMF using rbki - two Krylov subspaces


QX=RBKI(X,kQ,q);
QY=RBKI(Y,kQ,q);
[Q,~]=qr([QX, QY]);
XQ=Q'*X;
YQ=Q'*Y;

[U,V,W]=cmf(XQ,YQ,k);

U=Q*U;
end

