function [XX,YY,U,B,C,W] = CMTFCPals(X,Y,p)
% coupled matrix tensor factorization+
% tensor in CP format
% X=[[U,B,C]]; Y=UW^T

[m,n1,n2]=size(X);
[m,n3]=size(Y);

%[~,U,B,C]=cpals(X,p);
 U=rand(m,p); 
 B=rand(n1,p); C=rand(n2,p); 
W=randn(n3,p);
%[U,~]=qr(U,0); [B,~]=qr(B,0); [C,~]=qr(C,0); 
%[W,~]=qr(W,0);

brit=20;
for l=1:brit
    U=(tenmat1(X)*kr(C,B)+Y*W)*pinv(W'*W+had(B'*B,C'*C));
    B=tenmat2(X)*kr(C,U)*pinv(had(U'*U,C'*C));
    C=tenmat3(X)*kr(B,U)*pinv(had(U'*U,B'*B));
    W=Y'*U*pinv(U'*U);
end

XX=outpr(U,B,C);
YY=U*W';
