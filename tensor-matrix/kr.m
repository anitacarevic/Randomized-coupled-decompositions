function AB = kr(A,B)
    
    [I,F] = size(A);
    [J,~] = size(B);
    AB = zeros(I*J,F);
    
    for f=1:F
        AB(:,f) = vec(B(:,f)*A(:,f).');
    end

end