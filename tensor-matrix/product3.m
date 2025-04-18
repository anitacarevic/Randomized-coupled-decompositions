function [retval] = product3(T,M)
% T *_1 M
% T tensor, M matrix

[n1,n2,n3]=size(T);
[m1,m2]=size(M);
A=zeros(n1,n2,m1);

for i=1:n1
    for j=1:n2
        for l=1:m1
            sum=0;
            for k=1:n3
                sum=sum+T(i,j,k)*M(l,k);
            end
            A(i,j,l)=sum;
        end
    end
end

retval=A;