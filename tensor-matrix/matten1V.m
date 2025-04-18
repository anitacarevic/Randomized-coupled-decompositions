function [retval] = matten1V(M,m,n2,n3)
% for mx(n2*n3) matrix M returns mxn2xn3 tensor T; T_(1)=M

T=zeros(m,n2,n3);

for i=1:m
    for j=1:n2
        for k=1:n3
            T(i,j,k)=M(i,(k-1)*n2+j);
        end
    end
end

retval=T;