n = 1000;
r = 15;
d = 2;

ri = 50;

[X, Y] = SyntheticTestMatrices2(n,d,r,ri);

k = 50;

normX = norm(X,'fro');
normY = norm(Y,'fro');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RBKI test
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kr = 1;
rezRBKIl1 = zeros(76,2);
dimRBKIl1 = zeros(76,1);
timeRBKIl1 = zeros(76,2);
for q=25:100
    start = tic;
    [URBKIl1, VRBKIl1, WRBKIl1, ~, r, t] = RandCmfRBKI(X, Y, kr, kr, q, q, k);
    timeRBKIl1(q-24,1) = toc(start);
    timeRBKIl1(q-24,2) = t;
    dimRBKIl1(q-24) = r;
    rezRBKIl1(q-24,1) = norm(X-URBKIl1*VRBKIl1','fro')/normX;
    rezRBKIl1(q-24,2) = norm(Y-URBKIl1*WRBKIl1','fro')/normY;
end

kr = 2;
rezRBKIl2 = zeros(38,2);
dimRBKIl2 = zeros(38,1);
timeRBKIl2 = zeros(38,2);
for q=13:50
    start = tic;
    [URBKIl2, VRBKIl2, WRBKIl2, ~, r, t] = RandCmfRBKI(X, Y, kr, kr, q, q, k);
    timeRBKIl2(q-12,1) = toc(start);
    timeRBKIl2(q-12,2) = t;
    dimRBKIl2(q-12) = r;
    rezRBKIl2(q-12,1) = norm(X-URBKIl2*VRBKIl2','fro')/normX;
    rezRBKIl2(q-12,2) = norm(Y-URBKIl2*WRBKIl2','fro')/normY;
end


kr = k;
rezRBKIlk = zeros(4,2);
dimRBKIlk = zeros(4,1); 
timeRBKIlk = zeros(4,2);

start = tic;
[URBKIlk, VRBKIlk, WRBKIlk, ~, r,t] = RandCmfRBKI(X, Y, kr/2, kr/2, 1, 1, k);
timeRBKIlk(1,1) = toc(start);
timeRBKIlk(1,2) = t;
dimRBKIlk(1) = r;
rezRBKIlk(1,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(1,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;

start = tic;
[URBKIlk, VRBKIlk, WRBKIlk, ~, r, t] = RandCmfRBKI(X, Y, kr, kr, 1, 1, k);
timeRBKIlk(2,1) = toc(start);
timeRBKIlk(2,2) = t;
dimRBKIlk(2) = r;
rezRBKIlk(2,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(2,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;

start = tic;
[URBKIlk, VRBKIlk, WRBKIlk, ~, r, t] = RandCmfRBKI(X, Y, kr/2, kr/2, 3, 3, k);
timeRBKIlk(3,1) = toc(start);
timeRBKIlk(3,2) = t;
dimRBKIlk(3) = r;
rezRBKIlk(3,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(3,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;

start = tic;
[URBKIlk, VRBKIlk, WRBKIlk, ~, r, t] = RandCmfRBKI(X, Y, kr, kr, 2, 2, k);
timeRBKIlk(4,1) = toc(start);
timeRBKIlk(4,2) = t;
dimRBKIlk(4) = r;
rezRBKIlk(4,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(4,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;


kr = k+4;
rezRBKIlk4 = zeros(4,2);
dimRBKIlk4 = zeros(4,1);
timeRBKIlk4 = zeros(4,2);

start = tic;
[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r, t] = RandCmfRBKI(X, Y, kr/2, kr/2, 1, 1, k);
timeRBKIlk4(1,1) = toc(start);
timeRBKIlk4(1,2) = t;
dimRBKIlk4(1) = r;
rezRBKIlk4(1,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(1,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

start = tic;
[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r, t] = RandCmfRBKI(X, Y, kr, kr, 1, 1, k);
timeRBKIlk4(2,1) = toc(start);
timeRBKIlk4(2,2) = t;
dimRBKIlk4(2) = r;
rezRBKIlk4(2,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(2,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

start = tic;
[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r, t] = RandCmfRBKI(X, Y, kr/2, kr/2, 3, 3, k);
timeRBKIlk4(3,1) = toc(start);
timeRBKIlk4(3,2) = t;
dimRBKIlk4(3) = r;
rezRBKIlk4(3,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(3,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

start = tic;
[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r, t] = RandCmfRBKI(X, Y, kr, kr, 2, 2, k);
timeRBKIlk4(4,1) = toc(start);
timeRBKIlk4(4,2) = t;
dimRBKIlk4(4) = r;
rezRBKIlk4(4,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(4,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RSI test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rezRSI = zeros(5,2);
timeRSI = zeros(5,2);
for q=1:5
    start = tic;
    [URSI,VRSI,WRSI, t] = RandCmfRSI(X,Y,k,q);
    timeRSI(q,1) = toc(start);
    timeRSI(q,2) = t;
    rezRSI(q,1) = norm(X-URSI*VRSI','fro')/normX;
    rezRSI(q,2) = norm(Y-URSI*WRSI','fro')/normY;
end

start = tic;
[U, V, W] = cmf(X, Y, k);
time = toc(start);
cmf_err(1,1) = norm(X-U*V','fro')/norm(X,'fro');
cmf_err(1,2) = norm(Y-U*W','fro')/norm(Y,'fro');