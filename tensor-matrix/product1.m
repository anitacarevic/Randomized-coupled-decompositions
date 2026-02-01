function [retval] = product1(T,M)
% T *_1 M
% T tensor, M matrix

[n1,n2,n3]=size(T);
[m1,m2]=size(M);
A=zeros(m1,n2,n3);

for j=1:n2
    for k=1:n3
        for l=1:m1
            sum=0;
            for i=1:n1
                sum=sum+T(i,j,k)*M(l,i);
            end
            A(l,j,k)=sum;
        end
    end
end

retval=A;