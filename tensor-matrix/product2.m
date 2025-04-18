function [retval] = product2(T,M)
% T *_2 M
% T tensor, M matrix

[n1,n2,n3]=size(T);
[m1,m2]=size(M);
A=zeros(n1,m1,n3);

for i=1:n1
    for k=1:n3
        for l=1:m1
            sum=0;
            for j=1:n2
                sum=sum+T(i,j,k)*M(l,j);
            end
            A(i,l,k)=sum;
        end
    end
end

retval=A;