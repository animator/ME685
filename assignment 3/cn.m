Num = 5;
a = [1:Num];
nm = zeros(Num,1);
nrmhil = zeros(Num,1);
nrmhilinv = zeros(Num,1);
for k=1:Num
    hil = zeros([a(k) a(k)]);
    for i=1:a(k)
        for j=1:a(k)
            hil(i,j)=1/(i+j-1);
        end
    end
    %nm(k) = cond(hil,inf);
    n=a(k);
    hil_inv = zeros(n,n);
    p=n;
    for i = 1:n
        r = p*p;
        hil_inv(i,i) = r/(2*i-1);
        for j = i+1:n
            r = -((n-j+1)*r*(n+j-1))/(j-1)^2;
            hil_inv(i,j) = r/(i+j-1);
            hil_inv(j,i) = r/(i+j-1);
        end
        p = ((n-i)*p*(n+i))/(i^2);
    end
    hil;
    hil_inv;
    %cnum = norm(hil,1)*norm(hil_inv,1);
    nrmhil(k) = nrm(hil);
    nrmhilinv(k) = nrm(hil_inv);
    cnum = nrmhil(k)*nrmhilinv(k);
    nm(k) = cnum;
end
plot(a,nm);
ylabel('Condition Number')
xlabel('N')