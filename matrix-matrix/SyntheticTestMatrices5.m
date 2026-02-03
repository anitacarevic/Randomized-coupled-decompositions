function [A,B] = SyntheticTestMatrices5(m,nA,nB,a,b,ri)
% Both matrices with fast decaying singular values

% m - number of rows for A and B
% nA, nB - number of columns for A and B, respectively
% a, b - basis for the diagonal element
% ri - dimension of range intersection

    A = zeros(m,nA);
    for i=1:nA
        A(i,i) = 1/a^i;
    end

    UA = orth(rand(m,m));

    A = UA*A;

    B = zeros(m,nB);
    for i=1:nB
        B(i,i) = 1/b^i;
    end

    UB = orth([UA(:,1:ri) orth(rand(m,m-ri))]);

    B = UB*B;
end


