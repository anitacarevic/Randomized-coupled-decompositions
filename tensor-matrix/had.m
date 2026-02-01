function retval = had(A,B)
% Hadamard product (element-wise)

[m,n]=size(A);
[m1,n1]=size(B);
if (or(m1~=m,n1~=n))
    disp('Dimensions must agree')
end

for i=1:m
    for j=1:n
        C(i,j)=A(i,j)*B(i,j);
    end
end

retval=C;
