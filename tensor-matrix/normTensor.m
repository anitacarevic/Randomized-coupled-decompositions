function rez = normTensor(X)

    [I,J,K] = size(X);
    
    rez = 0;
    for i=1:I
        for j=1:J
            for k=1:K
                rez = rez + X(i,j,k)^2;
            end
        end
    end
    rez = sqrt(rez);
end