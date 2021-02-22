a = 2; %in seconds
dt = 0.5; %sampling step, in seconds
T = 10; %data range, in seconds
t = (-T:dt:T); %time, seconds too
N = length(t);

for k = 1:N %create a tab from 1 to N, where N is the length of t
  if (-a/2 < t(k) && t(k) < a/2)
    x2(k) = 1; %definition of the rectangle function
  else
    x2(k) = 0; %same
  end
end

subplot(2,1,1);
plot(t,x2)
title('Without the abs(x) function')
xlabel('t');
ylabel('y');
grid()


for k = 1:N
  if (abs(t(k)) < a/2) %abs(x) is the fastest way to write -a/2 < t < a/2
    x2(k) = 1; 
  else
    x2(k) = 0;
  end
end

subplot(2,1,2);
plot(t,x2)
title('With abs(x)')
xlabel('t');
ylabel('y');
grid()
