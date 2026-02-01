 n = 100;
 r = 5;
 d = 2;
 r1 = 5;
 r2 = 10;
 r3 = 7;
 
 [Xn,Yn] = generate3(n,r,r1,r2,r3,d);


noIter = 20;

normXn = normTensor(Xn);
normYn = norm(Yn,'fro');

k = 10;

start = tic;
[XX,YY,U,V,W] = CMTFTuck(Xn,Yn,k,noIter);
time = toc(start);
cmf_errX = normTensor(Xn-XX)/normXn;
cmf_errY = norm(Yn-YY,'fro')/normYn;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RBKI test
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
l = 1;
rezRBKIl1 = zeros(26,2);
timeRBKIl1 = zeros(26,2);
for q=5:30   
    start = tic;
    [XX,YY,U,V,W,t] = CMTFTuckRBKI(Xn,Yn,k,noIter,l,l,q,q);
    timeRBKIl1(q-4,1) = toc(start);
    timeRBKIl1(q-4,2) = t;
    rezRBKIl1(q-4,1) = normTensor(Xn-XX)/normXn;
    rezRBKIl1(q-4,2) = norm(Yn-YY,'fro')/normYn;
end

l = 2;
rezRBKIl2 = zeros(13,2);
timeRBKIl2 = zeros(13,2);
for q=3:15 
    start = tic;
    [XX,YY,U,V,W] = CMTFTuckRBKI(Xn,Yn,k,noIter,l,l,q,q);
    timeRBKIl2(q-2,1) = toc(start);
    timeRBKIl2(q-2,2) = t;
    rezRBKIl2(q-2,1) = normTensor(Xn-XX)/normXn;
    rezRBKIl2(q-2,2) = norm(Yn-YY,'fro')/normYn;
end

rezRSI = zeros(10,2);
timeRSI = zeros(10,2);
for q=1:10
    start = tic;
    [XX,YY,U,V,W] = CMTFTuckRSI(Xn,Yn,k,noIter,q);
    timeRSI(q,1) = toc(start);
    timeRSI(q,2) = t;
    rezRSI(q,1) = normTensor(Xn-XX)/normXn;
    rezRSI(q,2) = norm(Yn-YY,'fro')/normYn;
end
