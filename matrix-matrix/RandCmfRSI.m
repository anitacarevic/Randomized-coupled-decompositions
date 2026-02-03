function [U,V,W, time,Q] = RandCmfRSI(X,Y,k,q)
    [~,n1] = size(X);
    [~,n2] = size(Y);
    
    Omega1 = randn(n1,k);
    Omega2 = randn(n2,k);
    
    for i=1:q
        [Q1,~] = qr(X*Omega1,0);
        Omega1 = X'*Q1;
        [Q2,~] = qr(Y*Omega2,0);
        Omega2 = Y'*Q2;
    end
    [Q,R,E] = qr([Q1 Q2],0);
    start = tic;
    [U,V,W] = cmf(Q'*X,Q'*Y,k);
    time = toc(start);
    U = Q*U;
end
