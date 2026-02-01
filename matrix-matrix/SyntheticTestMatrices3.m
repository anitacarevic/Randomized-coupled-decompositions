function [A, B] = SyntheticTestMatrices3(m,n,r)
%Saibaba, Miedlar - Randomized low rank approximation beyond Gaussian
%random matrices
%Experiment 2 - ContolledFap

% m,n - dimenzion of rectangular matrices A and B
% m > n
    
    A = zeros(m,n);
    B = zeros(m,n);
    for i = 1:r
        x = sprand(m,1,0.25);
        y = sprand(n,1,0.25);
        A = A+(10/i)*(x*y');
    end
    B = A;
    for i = r+1:n
        x = sprand(m,1,0.25);
        y = sprand(n,1,0.25);
        A = A+(1/i)*x*y';
        x = sprand(m,1,0.25);
        y = sprand(n,1,0.25);
        B = B+(1/i)*x*y';
    end
end