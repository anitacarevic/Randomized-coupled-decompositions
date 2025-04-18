function [XX,YY,U,V,W] = randCMTFTuck(X,Y,k)
% randomized coupled matrix tensor factorization
% tensor in Tucker format
% X \approx S x_1 U x_2 V2 x_3 V3; Y \approx UW^T

[m,n2,n3]=size(X);
X1=tenmat1(X);

[U,V,W]=randCMF(X1,Y,k);

S=matten1V(V',k,n2,n3); % V'=S_(1), S=C x_2 V2 x_3 V3
XX=product1(S,U); % XX=S x_1 U x_2 V2 x_3 V3
YY=U*W'; % YY=UW^T