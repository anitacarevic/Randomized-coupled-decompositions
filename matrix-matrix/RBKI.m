function [Q] = RBKI(A,k,q)
%  Randomized block krylov iterations (simple version)
[m,n]=size(A);

omega=randn(n,k);
Q={};


for i=1:q
   Q{i}=A*omega;
      
   if i>1
     sum=zeros(m,k);
     for j=1:i
         sum=sum+ Q{j}*(Q{j}'*Q{i});
     end
     Q{i}=Q{i}-sum;
     % repeat for stability
     sum=0;
     for j=1:i
         sum=sum+ Q{j}*(Q{j}'*Q{i});
     end
     Q{i}=Q{i}-sum;
   end

   [Q{i},~]=qr(Q{i},0);
   omega=A'*Q{i};
end

Q=[Q{:}];

end