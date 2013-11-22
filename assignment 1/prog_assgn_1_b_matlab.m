q1 = 0.5;
q2 = 1.5;
q3 = 1.5;
q4 = 1.5;
q5 = 1.5;
q6 = 2.5;
es = 1;

while  es>0.00001
        f1 = q1.^2 + q2.^2 + q3.^2 - 6;
        f2 = -q1.^2 + q2.^2 + 2*q4.^2 - 8;
        f3 = -2*q2.^2 + q3.^2 + 4*q5.^2 - 6;
        f4 = q4 + q6 - 4;
        f5 = q1 + q5 - 2;
        f6 = q2 + q6 - 4;
        A =     [[2*q1 2*q2 2*q3 0 0 0];
                [-2*q1 2*q2 0 4*q4 0 0];
                [0 -4*q2 2*q3 0 8*q5 0];
                [0 0 0 1 0 1];
                [1 0 0 0 1 0];
                [0 1 0 0 0 1]];

        B = [-f1 -f2 -f3 -f4 -f5 -f6];

        pivoting =1;
        ztol = 1.0e-8;
        siz = size(A,1);
        X= zeros(1,siz);
        R= linspace(1,siz,siz);
        C= linspace(1,siz,siz);
        code = 0;
        % Triangularization.
        for pivot = 1:(siz-1)
                absm = abs(A(pivot,pivot));
                exchrow = pivot;
                exchcol = pivot;
                if pivoting == 1 % partial pivoting.
                        for row = (pivot+2):siz
                                atestm  = abs(A(row,pivot));
                                if atestm > absm
                                        absm= atestm;
                                        exchrow = row;
                                end
                        end
                end
                if pivot ~= exchcol
                        for row = (pivot+1):siz
                                A(row,pivot), A(row,exchcol) = A(row,exchcol), A(row,pivot);
                        end
                        C(pivot) = exchcol;
                end
                if pivot ~= exchrow
                        A(exchrow),A(pivot) = A(pivot), A(exchrow);
                        B(exchrow),B(pivot) = B(pivot), B(exchrow);
                        R(pivot) = exchrow;
                end
                if absm > ztol
                        m = 1.0*A(pivot,pivot);
                        for row = (pivot +1):siz
                                kmul = 1.0*A(row,pivot)/m;
                                for col = siz:-1:(pivot+1)
                                        A(row,col) = 1.0*A(row,col) - kmul * A(pivot,col);
                                end
                                B(row) = 1.0*B(row) - kmul * B(pivot);
                                A(row,pivot) = 0.0;
                        end
                else
                        code = 1;
                end
        end
        % Perform Back substitution.
        if code == 0
                for row = (siz):-1:1
                        su = B(row);
                        for k = (row+1):siz
                                su = su - (X(k) * A(row,k));
                        end
                        X(row) = su/A(row,row);
                end
                for i = 1:size(C,1)
                        if i ~= C(i)
                        X(i), X(C(i)) =  X(C(i)), X(i);
                        end
                        end
        end
        q1 = q1 + X(1);
        q2 = q2 + X(2);
        q3 = q3 + X(3);
        q4 = q4 + X(4);
        q5 = q5 + X(5);
        q6 = q6 + X(6);

        q1s = abs(X(1)*100/q1);
        q2s = abs(X(2)*100/q2);
        q3s = abs(X(3)*100/q3);
        q4s = abs(X(4)*100/q4);
        q5s = abs(X(5)*100/q5);
        q6s = abs(X(6)*100/q6);
        es= max([q1s q2s q3s q4s q5s q6s]);
end
disp([sprintf('Q1\tQ2\tQ3\tQ4\tQ5\tQ6')])
disp([q1, q2, q3, q4, q5, q6])
