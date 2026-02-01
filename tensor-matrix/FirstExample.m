brit=100;

for i=1:brit;
    x(i)=i;
    [X,Y]=testmCMTFCP;                              % generiranje tenzora i matrice
    [XXa,YYa,~,~,~,~] = CMTFCPals(X,Y,3);       % CMTF-CP ALS 
    [XXt,YYt,~,~]=CMTFTucker(X,Y,3);              % CMTF Tucker 
    errals(i)=normTensor(X-XXa)^2+norm(Y-YYa,'fro')^2;
    errT(i)=normTensor(X-XXt)^2+norm(Y-YYt,'fro')^2;
end

