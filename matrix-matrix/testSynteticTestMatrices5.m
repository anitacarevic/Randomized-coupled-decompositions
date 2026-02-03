warning('off','all')

m = 500;
nX = 300;
nY = 200;
x = 2;
y = 2;
ri = 10;

[X, Y] = SyntheticTestMatrices5(m,nX,nY,x,y,ri);
k = 30;

normX = norm(X,'fro');
normY = norm(Y,'fro');

kr = 1;
rezk21int = zeros(16,2);
Rint = zeros(16,1);
for q=15:30   
    [Ur21kint, Vr21kint, Wr21kint, ~, r] = RandCmfRBKI(X, Y, kr, kr, q, q, k);
    Rint(q-14) = r;
    rezk21int(q-14,1) = norm(X-Ur21kint*Vr21kint','fro')/normX;
    rezk21int(q-14,2) = norm(Y-Ur21kint*Wr21kint','fro')/normY;
end

kr = 2;
rezk22int = zeros(9,2);
R2int = zeros(9,1);
for q=8:16    
    [Ur22kint, Vr22kint, Wr22kint, ~, r] = RandCmfRBKI(X, Y, kr, kr, q, q, k);
    R2int(q-7) = r;
    rezk22int(q-7,1) = norm(X-Ur22kint*Vr22kint','fro')/normX;
    rezk22int(q-7,2) = norm(Y-Ur22kint*Wr22kint','fro')/normY;
end


[U, V, W] = cmf(X, Y, k);
cmf_err(1,1) = norm(X-U*V','fro')/norm(X,'fro');
cmf_err(1,2) = norm(Y-U*W','fro')/norm(Y,'fro');
