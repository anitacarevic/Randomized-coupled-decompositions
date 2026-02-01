function [A, B] = SyntheticTestMatrices1(m,nA,nB,rA,rB)
%Wei, Zhang, Yang, Chen - Randomized Singular Value Decomposition
%Experiment 1 - low rank matrices, no special structure for singular values

% m - number of rows of matrices A and B
% nA, nB - number of columns of matrices A and B, respecitvely
% rA, rB - rank of matrices A and B, respectively

    A1 = rand(m,rA);
    A2 = rand(rA,nA);
    A = A1*A2;
    
    B1 = rand(m,rB);
    B2 = rand(rB,nB);
    B = B1*B2;
end