a = 2; 
dt = 0.5; 
T = 10;
t = (-T:dt:T);
N = length(t);
hf = figure ();

for k = 1:N
  if (-a/2 < t(k) && t(k) < a/2)
    x2(k) = 1; 
  else
    x2(k) = 0;
  endif
  end

subplot(2,1,1);
plot(t,x2)
title('Avec les paramètres de l énoncé')
xlabel('t');
ylabel('y');
grid()


for k = 1:N
  if (abs(t(k)) < a/2)
    x2(k) = 1; 
  else
    x2(k) = 0;
  endif
  end

subplot(2,1,2);
plot(t,x2)
title('Avec la fonction abs(x)')
xlabel('t');
ylabel('y');
grid()
