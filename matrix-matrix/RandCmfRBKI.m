function [U, V, W, r, rQ,time] = RandCmfRBKI(X, Y, kX, kY, qX, qY, k)

[mX, nX] = size(X);
[mY, nY] = size(Y);

[QX,~] = MyRBKI(X, kX, qX);
[QY,~] = MyRBKI(Y, kY, qY);

[Q,R,E] = qr([QX QY], 0);

r = diag(R);
Q = Q(:,E);

tol = mX*eps;
rQ = kX*qX + kY*qY;
for i = 1:(kX*qX + kY*qY)
    if abs(R(i,i)) < tol
        rQ = i-1;
        break;
    end
end

XQ = Q(:,1:rQ)'*X;
YQ = Q(:,1:rQ)'*Y;

start = tic;
[U, V, W] = cmf(XQ, YQ, k);
time = toc(start);

U = Q(:,1:rQ)*U;

end