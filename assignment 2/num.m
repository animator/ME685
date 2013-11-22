%%% Initialize variables
Nz = 50; % Choose the number of length steps
dx = 1.0/Nz; %each length step
dt = 0.01; %Length of each time step in seconds

T = 0*ones([Nz+1,1]);  %Create temperature matrix with Nz+1 rows
                        % Initial guess is that T is 0 everywhere.
time = 0;
x = [0:dx:1];
r = dt/dx^2;
es = 1;
count = 1;
max_count = 150;
temp_num_time = ones([max_count,Nz+1]);

while es>0.00001,
    estimestep = 1;
    Tlaststep = T; %Save the temperature at last time step
    iter =0;
    while estimestep>0.00001,
        iter = iter+1;
        Tlast = T;
        T(1) = 1;  %Set x=0 temperature
        T(end) = 0;  %Set x=0 temperature     
        esT = ones([Nz+1,1]);
        esT(1) = 0;
        esT(end) = 0;
        for i=2:Nz,
            T(i) = (Tlaststep(i) + r*T(i+1) + r*T(i-1))/(1+2*r);
            esT(i) = abs(T(i)-Tlast(i))/T(i);
        end
        estimestep = max(esT);  %Find difference between last two solutions
    end
    time = time + dt;
    %break
    esTS = ones([Nz+1,1]);
    esTS(1) = 0;
    esTS(end) = 0;
    for i=2:Nz,
        esTS(i) = abs(T(i)-Tlaststep(i))/T(i);
    end 
    es = max(esTS);
    temp_num_time(count,:)=T(:);
    count = count +1;
end
plot(x,T)