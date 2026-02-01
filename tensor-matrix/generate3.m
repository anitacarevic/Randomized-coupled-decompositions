function [X,Y] = generate3(n,r,r1,r2,r3,d)

%example from Acar, Kolda, Dunlavy - ALL-at-once optimization for Coupled
%matrix and tensor factorizations

    S = zeros(n,n);
    for i = 1:r
        S(i,i) = 1;
    end
    for i = 2:(n-r+1)
        S(r+i-1,r+i-1) = 1/i^d;
    end
    
    UA = orth(rand(n,n));
    VA = orth(rand(n,n));
    
    Y = UA*S*VA';
    
    A = [UA(:,1:r1) orth(rand(n,n-r1))]*S*[VA(:,1:r1) orth(rand(n,n-r1))]';
    B = [UA(:,1:r2) orth(rand(n,n-r2))]*S*[VA(:,1:r2) orth(rand(n,n-r2))]';
    C = [UA(:,1:r3) orth(rand(n,n-r3))]*S*[VA(:,1:r3) orth(rand(n,n-r3))]';
    
    X = zeros(n,n,n);
    X(:,:,1) = A;
    X(:,:,2) = B;
    X(:,:,3) = C;

end
