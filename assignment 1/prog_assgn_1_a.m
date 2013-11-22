q1 = 0.5;
q2 = 1.5;
q3 = 1.5;
q4 = 1.5;
q5 = 1.5;
q6 = 2.5;
es = 1;
while es>0.00001
        q3n = (6-q2.^2-q1.^2).^0.5;
        q4n = ((8+q1.^2-q2.^2)/2.0).^0.5;
        q5n = ((6+2*q2.^2-q3.^2)/4.0).^0.5;
        q6n = 4 - q4;
        q2n = 4 - q6;
        q1n = 2 - q5;

        % disp([q1n q2n q3n q4n q5n q6n]);
        q1s = abs((q1n-q1)*100/q1n);
        q2s = abs((q2n-q2)*100/q2n);
        q3s = abs((q3n-q3)*100/q3n);
        q4s = abs((q4n-q4)*100/q4n);
        q5s = abs((q5n-q5)*100/q5n);
        q6s = abs((q6n-q6)*100/q6n);

        es = max([q1s q2s q3s q4s q5s q6s]);
        q1 = q1n;
        q2 = q2n;
        q3 = q3n;
        q4 = q4n;
        q5 = q5n;
        q6 = q6n;
end
disp([sprintf('Q1\tQ2\tQ3\tQ4\tQ5\tQ6')])
disp([q1n, q2n, q3n, q4n, q5n, q6n])
                                             