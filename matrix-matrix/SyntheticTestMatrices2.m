function [A, B] = SyntheticTestMatrices2(n,d,r,ri)
%Saibaba, Miedlar - Randomized low rank approximation beyond Gaussian
%random matrices
%Experiment 1 - FastDecay

% n - dimenzion of square matrices A and B
% d - degree of decay
% k - dimension of range intersection
% first matrix has fast singular decay

    S = zeros(n,n);
    for i = 1:r
        S(i,i) = 1;
    end
    for i = 2:(n-r+1)
        S(r+i-1,r+i-1) = 1/i^d;
    end
    
    UA = orth(rand(n,n));
    VA = orth(rand(n,n));
    
    A = UA*S*VA';
    
    B = zeros(n,n);
    for i = 1:2*r
        B(i,i) = 1;
    end
    for i=2:(n-2*r+1)
        B(2*r+i-1,2*r+i-1) = 1/i;
    end
    UB = ([UA(:,1:ri) orth(rand(n,n-ri))]);
    VB = ([VA(:,1:ri) orth(rand(n,n-ri))]);
    B = UB*B*VB';
end