function [A,B] = SyntheticTestMatrices6(m,nA,nB,a,rB)
% Matrix A has fast decaying singular values, B just rank defficient

% m - number of rows for A and B
% nA, nB - number of columns for A and B, respectively
% a - basis for the diagonal element
% rB - rank of B

    A = zeros(m,nA);
    for i=1:nA
        A(i,i) = 1/a^i;
    end

    UA = orth(rand(m,m));

    A = UA*A;

    B1 = rand(m,rB);
    B2 = rand(rB,nB);
    B = B1*B2;
end


