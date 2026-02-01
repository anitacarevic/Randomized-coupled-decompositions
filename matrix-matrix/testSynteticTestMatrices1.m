m = 500;
rX = 100;
rY = 150;
nX = 200;
nY = 300;

[X, Y] = SyntheticTestMatrices1(m,nX,nY,rX,rY);

k = 30;

normX = norm(X,'fro');
normY = norm(Y,'fro');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RBKI test
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kr = 1;
rezRBKIl1 = zeros(86,2);
dimRBKIl1 = zeros(86,1);
for q=15:100   
    [URBKIl1, VRBKIl1, WRBKIl1, ~, r] = RandCmfRBKI(X, Y, kr, kr, q, q, k);
    dimRBKIl1(q-14) = r;
    rezRBKIl1(q-14,1) = norm(X-URBKIl1*VRBKIl1','fro')/normX;
    rezRBKIl1(q-14,2) = norm(Y-URBKIl1*WRBKIl1','fro')/normY;
end

kr = 2;
rezRBKIl2 = zeros(43,2);
dimRBKIl2 = zeros(43,1);
for q=8:50    
    [URBKIl2, VRBKIl2, WRBKIl2, ~, r] = RandCmfRBKI(X, Y, kr, kr, q, q, k);
    dimRBKIl2(q-7) = r;
    rezRBKIl2(q-7,1) = norm(X-URBKIl2*VRBKIl2','fro')/normX;
    rezRBKIl2(q-7,2) = norm(Y-URBKIl2*WRBKIl2','fro')/normY;
end


kr = k;
rezRBKIlk = zeros(4,2);
dimRBKIlk = zeros(4,1);

[URBKIlk, VRBKIlk, WRBKIlk, ~, r] = RandCmfRBKI(X, Y, kr/2, kr/2, 1, 1, k);
dimRBKIlk(1) = r;
rezRBKIlk(1,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(1,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;

[URBKIlk, VRBKIlk, WRBKIlk, ~, r] = RandCmfRBKI(X, Y, kr, kr, 1, 1, k);
dimRBKIlk(2) = r;
rezRBKIlk(2,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(2,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;

[URBKIlk, VRBKIlk, WRBKIlk, ~, r] = RandCmfRBKI(X, Y, kr/2, kr/2, 3, 3, k);
dimRBKIlk(3) = r;
rezRBKIlk(3,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(3,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;

[URBKIlk, VRBKIlk, WRBKIlk, ~, r] = RandCmfRBKI(X, Y, kr, kr, 2, 2, k);
dimRBKIlk(4) = r;
rezRBKIlk(4,1) = norm(X-URBKIlk*VRBKIlk','fro')/normX;
rezRBKIlk(4,2) = norm(Y-URBKIlk*WRBKIlk','fro')/normY;


kr = k+4;
rezRBKIlk4 = zeros(4,2);
dimRBKIlk4 = zeros(4,1);

[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r] = RandCmfRBKI(X, Y, kr/2, kr/2, 1, 1, k);
dimRBKIlk4(1) = r;
rezRBKIlk4(1,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(1,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r] = RandCmfRBKI(X, Y, kr, kr, 1, 1, k);
dimRBKIlk4(2) = r;
rezRBKIlk4(2,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(2,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r] = RandCmfRBKI(X, Y, kr/2, kr/2, 3, 3, k);
dimRBKIlk4(3) = r;
rezRBKIlk4(3,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(3,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

[URBKIlk4, VRBKIlk4, WRBKIlk4, ~, r] = RandCmfRBKI(X, Y, kr, kr, 2, 2, k);
dimRBKIlk4(4) = r;
rezRBKIlk4(4,1) = norm(X-URBKIlk4*VRBKIlk4','fro')/normX;
rezRBKIlk4(4,2) = norm(Y-URBKIlk4*WRBKIlk4','fro')/normY;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RSI test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rezRSI = zeros(5,2);
for q=1:5   
    [URSI,VRSI,WRSI] = RandCmfRSI(X,Y,k,q);
    rezRSI(q,1) = norm(X-URSI*VRSI','fro')/normX;
    rezRSI(q,2) = norm(Y-URSI*WRSI','fro')/normY;
end

[U, V, W] = cmf(X, Y, k);
cmf_err(1,1) = norm(X-U*V','fro')/norm(X,'fro');
cmf_err(1,2) = norm(Y-U*W','fro')/norm(Y,'fro');

