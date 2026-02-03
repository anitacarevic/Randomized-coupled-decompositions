rezRSI = zeros(100,1);
rezRSIone = zeros(100,1);
time1 = zeros(100,1);
time2 = zeros(100,1);
x = 1:100;
for i=1:100
    X = rand(500,100)*rand(100,200);
    Y = rand(500,150)*rand(150,300);
    k = 30;
    
    normX = norm(X,'fro');
    normY = norm(Y,'fro');
    
    start = tic;
    [URSI,VRSI,WRSI] = RandCmfRSI(X,Y,k,1);
    time1(i) = toc(start);
    start = tic;
    [U1,V1,W1] = RandCmfRSIone(X,Y,k,1);
    time2(i) = toc(start);
    rezRSI(i,1) = norm(X-URSI*VRSI','fro')^2 + norm(Y-URSI*WRSI','fro')^2;
    rezRSIone(i,1) = norm(X-U1*V1','fro')^2 + norm(Y-U1*W1','fro')^2;
end

figure(1)
hold on
semilogy(x, rezRSI, '*:','Color',[0 0.3 1],'LineWidth',1.5);
semilogy(x, rezRSIone, '+:','Color', [0 0.6 0.1],'LineWidth',1.5);
legend('Q = qr[Q_1 Q_2]', 'Q = range([X Y])')
xlabel('Generated example')
ylabel('err_X^2 + err_Y^2')
grid on
hold off
