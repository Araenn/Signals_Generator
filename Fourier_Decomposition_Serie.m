T = 5; %period, in seconds
theta = 1;
t = [-T/2:0.01:T/2]'; %time vector
N = length(t);
v0 = 1/T; 
n = input("Choose the n value : "); %n=100 for the best result

for k = 1:N %rectangle function
  if (abs(t(k)) < theta)
    x(k) = 1;
  elseif (abs(t(k)) == theta)
    x(k) = 0.5;
  else
    x(k) = 0;
  end
end

for k = -n:n %coefficient c
  c(k + n + 1) = ((2 .* theta)./T) .* sinc(2 .* v0 .* k .* theta); %pi inclu dans le sinc de matlab
end

f1 = zeros(N,1); %create a tab filled with 0, dimensions N and 1
for k = -n:n
    f1 = f1 + c(k + n + 1) .* exp(2 .* 1j .* pi .* v0 .* k .* t); %don't forget the j (or i), complex
end

a0 = 2 .* c(n + 1);
for k = 1:n %a and b coefficients
    a(k) = c(n + 1 - k) + c(n + 1 + k);
    b(k) = 1j .* ( c(n + 1 + k) - c(n + 1 - k) );
end

f2 = zeros(N,1) + a0/2; %same, with a0/2 for each new line
for k = 1:n
    f2 = f2 + a(k) .* cos(2 .* pi .* v0 .* k .* t) + b(k) .* sin(2 .* pi .* v0 .* k .* t);
end

f3 = zeros(N, 1); %finally, here for the absolute value of the difference
for k = 1:N 
    f3(k) = f3(k) + abs(x(k) - real(f1(k)));
end

subplot(2,1,1);
plot(t, x, 'r')
hold on
plot(t, real(f1)) %real(x) allow to represent the real part of the function
hold on
plot(t, f2, 'g.')
title('FDS of the rectangle function')
grid()
xlabel('t');
ylabel('y');
legend('rect(t)', 'f1', 'f2')

subplot(2,1,2);
plot(t, f3, 'm')
title('Difference between rect(t) and f1(t)')
grid()
xlabel('t');
ylabel('y');
legend('|f(t) - real(f1)|')
