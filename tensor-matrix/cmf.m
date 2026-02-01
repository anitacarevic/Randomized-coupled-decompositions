function [U, V, W] = cmf(X, Y, k)
    
    [~, n1] = size(X);
    [~, n2] = size(Y);
    
    [UXY, Sigma, VXY] = svd([X Y],'econ');
    
    U = UXY(:,1:k);
    Z = VXY(:,1:k)*Sigma(1:k,1:k);
    V = Z(1:n1,:);
    W = Z(n1+1:n1+n2,:);
end
