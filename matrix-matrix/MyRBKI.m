function [X,AX] = MyRBKI(A, k, q)
    

    [L,N] = size(A);
    
    Y = randn(N,k);
    
    X = [];
    for i=1:q
        X = [X A*Y(:,(i-1)*k+1:i*k)];
        for j = 1:(i-1)
            X(:,(i-1)*k+1:i*k) = X(:,(i-1)*k+1:i*k) - X(:,(j-1)*k+1:j*k)*...
               (X(:,(j-1)*k+1:j*k)'*X(:,(i-1)*k+1:i*k));
        end
        for j = 1:(i-1)
            X(:,(i-1)*k+1:i*k) = X(:,(i-1)*k+1:i*k) - X(:,(j-1)*k+1:j*k)*...
               (X(:,(j-1)*k+1:j*k)'*X(:,(i-1)*k+1:i*k));
        end
        [X(:,(i-1)*k+1:i*k),~] = qr(X(:,(i-1)*k+1:i*k),0);
        Y = [Y A'*X(:,(i-1)*k+1:i*k)];
    end
    AX = Y(:,k+1:end)';

end