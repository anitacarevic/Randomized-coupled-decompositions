function [retval] = tenmat2(T)
% gives matricization T_(2) of T

[n1,n2,n3]=size(T);
retval=reshape(permute(T,[2,1,3]),n2,n1*n3);