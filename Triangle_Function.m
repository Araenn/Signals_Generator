a = 2; %in seconds
dt = 0.5; %sample step, in seconds
T = 10; %period
t = (-T:dt:T);
N = length(t);

for k = 1:N %create a tab from 1 to N, the length of t
  if (-a <= t(k) && t(k) <= 0)
    x3(k) = a + t(k);
  elseif (0 <= t(k) && t(k) <= a)
    x3(k) = a - t(k);
  else
    x3(k) = 0;
  end
end

 
plot(t,x3)
title('Triangle function')
xlabel('t');
ylabel('y');
grid()
