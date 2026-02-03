clear; clc;

rng('default')

m = 500;
%  rX = 100;
%  rY = 150;
rX = 35;
rY = 35;
nX = 200;
nY = 300;

rezRSI = zeros(100,1);
rezRSIone = zeros(100,1);
rezRSI_X = zeros(100,1);
rezRSIone_X = zeros(100,1);
rezRSI_Y = zeros(100,1);
rezRSIone_Y = zeros(100,1);
x = 1:100;
for i=1:100

    k = 30;
    [X, Y] = TestMatrices_Sing_val_of_X_much_smaller(m,nX,nY,rX,rY,k);
    
    
    
    normX = norm(X,'fro');
    normY = norm(Y,'fro');
    
    [URSI,VRSI,WRSI,r,QRSI] = RandCmfRSI(X,Y,k,1);
    [U1,V1,W1,rOne,Q1] = RandCmfRSIone(X,Y,k,1);
    rezRSI(i,1) = norm(X-URSI*VRSI','fro')^2 + norm(Y-URSI*WRSI','fro')^2;
    rezRSIone(i,1) = norm(X-U1*V1','fro')^2 + norm(Y-U1*W1','fro')^2;

    rezRSI_X(i,1) = norm(X-QRSI*QRSI'*X,'fro')/norm(X,'fro');
    rezRSI_Y(i,1) = norm(Y-QRSI*QRSI'*Y,'fro')/norm(Y,'fro');
    rezRSIone_X(i,1) = norm(X-Q1*Q1'*X,'fro')/norm(X,'fro');
    rezRSIone_Y(i,1) = norm(Y-Q1*Q1'*Y,'fro')/norm(Y,'fro');
end

figure(1)
hold on
semilogy(x, rezRSI, '*:','Color',[0 0.3 1],'LineWidth',1.5);
semilogy(x, rezRSIone, '+:','Color', [0 0.6 0.1],'LineWidth',1.5);
legend('Q = qr[Q_1 Q_2]', 'Q = range([X Y])')
xlabel('Generated example')
ylabel('f(U,V,W)')
%ylim([1.6*10^5 2*10^5])
%ylim([1.38*10^4 2.8*10^4])
ylim([1.6*10^5 5*10^5])
%ylim([1  100])
grid on


figure(2)
hold on
semilogy(x, rezRSI_X, '*','Color',[0 0.3 1],'LineWidth',1.5);
semilogy(x, rezRSIone_X, '+','Color', [0 0.6 0.1],'LineWidth',1.5);
legend('Q = qr[Q_1 Q_2]', 'Q = range([X Y])')
xlabel('Generated example')
ylabel('Relative projection error')
title('Matrix X')
%ylim([1.6*10^5 2*10^5])
%ylim([1.38*10^4 2.8*10^4])
%ylim([1 8])
ylim([0  1])
grid on


figure(3)
hold on
semilogy(x, rezRSI_Y, '*','Color',[0 0.3 1],'LineWidth',1.5);
semilogy(x, rezRSIone_Y, '+','Color', [0 0.6 0.1],'LineWidth',1.5);
legend('Q = qr[Q_1 Q_2]', 'Q = range([X Y])')
xlabel('Generated example')
ylabel('Relative projection error')
title('Matrix Y')
%ylim([1.6*10^5 2*10^5])
%ylim([1.38*10^4 2.8*10^4])
%ylim([450 650])
ylim([0  1])
grid on


test_X=svd(X);
test_Y=svd(Y);
test_XY=svd([X,Y]);

%%

y_X=rezRSIone_X./rezRSI_X;

figure(4)
hold on
histogram(y_X);
title('Matrix X')
xlabel('Ratio of relative error approximation')
ylabel('Frequency')
grid on
hold off

y_Y=rezRSIone_Y./rezRSI_Y;

figure(5)
hold on
histogram(y_Y);
title('Matrix Y')
xlabel('Ratio of relative error approximation')
ylabel('Frequency')
grid on
hold off
