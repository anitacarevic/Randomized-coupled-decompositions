function [retval] = tenmat3(T)
% gives matricization T_(3) of T

[n1,n2,n3]=size(T);
retval=reshape(permute(T,[3,1,2]),n3,n1*n2);