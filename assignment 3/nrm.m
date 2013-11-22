function res = nrm(A)
%NRM Summary of this function goes here
%   Detailed explanation goes here
    %res = norm(A);
    n_val = length(A);
    %res = log(n_val) + 0.5772156649 + 1/(2*n_val) - 1/(12*n_val^2) + 1/(120*n_val^4)
    colwise = zeros(n_val,1);
    for o=1:n_val
        colwise(o) = sum(abs(A(:,o)));
    end
    res_1 = max(colwise);
    %res = res_1;
    Asq = A*A;
    res = max(eig(Asq))^0.5;
end

