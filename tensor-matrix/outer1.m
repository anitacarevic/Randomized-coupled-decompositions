function retval = outer1(a,b,c)

[m1,~]=size(a); [m2,~]=size(b); [m3,~]=size(c);
T=zeros(m1,m2,m3);
for i=1:m1
    for j=1:m2
        for k=1:m3
            T(i,j,k)=a(i)*b(j)*c(k);
        end
    end
end
retval=T;