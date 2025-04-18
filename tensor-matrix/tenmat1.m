function [retval] = tenmat1(T)
% gives matricization T_(1) of T

[n1,n2,n3]=size(T);
retval=reshape(T,n1,n2*n3);