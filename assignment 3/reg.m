x = [0.1 0.2 0.5 0.7 1 2 5 7 10];
y = [10.57 19.03 36.61 44.43 52.92 68.16 82.65 86.30 89.46];
n = length(x);
one_by_x = zeros([n 1]);
one_by_y = zeros([n 1]);
for i=1:n
    one_by_x(i) = 1/x(i);
    one_by_y(i) = 1/y(i);
end
%plotx,y,'.')
figure(1)
a1 = (n*sum(one_by_x'*one_by_y) - sum(one_by_x)*sum(one_by_y))/(n*sum(one_by_x'*one_by_x) - sum(one_by_x)*sum(one_by_x))
y_mean = sum(one_by_y)/n;
x_mean = sum(one_by_x)/n;
a0 = y_mean - a1*x_mean
x_var = [0:10];
y_var = a0 + a1*x_var;
plot(one_by_x,one_by_y,'r.',x_var,y_var,'r--')
ylabel('1/y')
xlabel('1/x')
alpha = 1/a0
beta = a1*alpha
figure(2)
x_new = [0:0.01:10];
y_actual = zeros([length(x_new) 1]);
for i=1:length(x_new)
    y_actual(i) = alpha*x_new(i)/(beta+x_new(i));
end
plot(x,y,'b.',x_new,y_actual,'b--')
ylabel('y')
xlabel('x')
correlation_coefficient = (n*sum(one_by_x'*one_by_y) - sum(one_by_x)*sum(one_by_y))/(((n*sum(one_by_x'*one_by_x) - sum(one_by_x)*sum(one_by_x))^0.5)*((n*sum(one_by_y'*one_by_y) - sum(one_by_y)*sum(one_by_y))^0.5))
