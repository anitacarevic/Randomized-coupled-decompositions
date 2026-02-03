function [U,V,W,r,Q1, time] = RandCmfRSIone(X,Y,k,q)
    [~,n1] = size([X Y]);
 
    r=0;
    Omega1 = randn(n1,k+r);
    
    for i=1:q
        [Q1,~] = qr([X Y]*Omega1,0);
        Omega1 = [X Y]'*Q1;
    end
    
    start = tic;
    [U,V,W] = cmf(Q1'*X,Q1'*Y,k);
    time = toc(start);
    U = Q1*U;
end
