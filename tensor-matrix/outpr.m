function retval = outpr(A,B,C)
% [[A,B,C]]

[m1,n]=size(A);
[m2,~]=size(B);
[m3,~]=size(C);

D=zeros(m1,m2,m3);

for r=1:n
    D=D+outer1(A(:,r),B(:,r),C(:,r));
end

retval=D;