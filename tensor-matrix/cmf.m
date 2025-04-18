function [U,V,W] = cmf(X,Y,k)
%

[~,n1]=size(X);
[~,n2]=size(Y);

[U_XY, S, V_XY]=svd([X, Y]);
U=U_XY(:,1:k);
Z=V_XY(:,1:k)*S(1:k,1:k);
V=Z(1:n1,:);
W=Z((n1+1):(n1+n2),:);

end