function [X, Y] = TestMatrices_Sing_val_of_X_much_smaller(m,nX,nY,rX,rY,k)
% low rank matrices, singular values of matrix X are much smaller than in
% matrix Y

% m - number of rows of matrices A and B
% nA, nB - number of columns of matrices A and B, respecitvely
% rA, rB - rank of matrices A and B, respectively

%     m=500;
%     nX=200;
%     rX=100;
%     nY=300;
%     rY=150;


    UX = orth(rand(m,rX));
    SX= diag(sort(rand(rX,1),'descend'));
    VX = orth(rand(nX,rX));
    X = UX*SX*VX';
    
    UY = orth(rand(m,rY));
    %SY=diag([1000*rand(k,1);rand(rY-k,1)]);
    SY=diag(sort(100*rand(rY,1),'descend'));
    VY = orth(rand(nY,rY));
    Y = UY*SY*VY';
end