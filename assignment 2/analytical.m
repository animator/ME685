%syms x
%n = [1:3]
%a = int(-(1-x)*sin(n*pi*x),x, 0, 1)

an = [1:1000];
for i=1:1000,
    an(i) = -1.0/(i*pi);
end
t_ana = 0.0; %1.06;
temp = ones([Nz+1,1]);

temp_ana_time = ones([max_count,Nz+1]);
c = 1;

while t_ana<time,
    for i=1:Nz+1,
        temp(i) = 1 - x(i);
        s = 0;
        for j=1:1000,
            s = s + an(j)*2*sin(j*pi*x(i))*exp(-t_ana*(j*pi)^2);
        end
        temp(i) = temp(i) + s;
    end
    temp_ana_time(c,:) = temp(:);
    c = c+1;
    t_ana = t_ana+dt;
end
plot(x,temp)
