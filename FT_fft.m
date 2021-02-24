T = 5; %period, in seconds
dt = 10^-3; %sampling step, in seconds
t = [-T/2:dt:T/2]; %time vector

Fs = 1000; %sampling frequency
L = 1500; %length of signal
df = 10^-2; %sampling step, in Hertz
f = Fs*(0:(L/2))/L; %frequency domain

f1 = 20; %Hz
f2 = 21;
f3 = 20.5;

x1 = cos(2 .* pi .* f1 .* t); %signals
x2 = 1.5 .* cos(2 .* pi .* f2 .* t);
x3 = 0.1 .* cos(2 .* pi .* f3 .* t);
xs = x1 + x2;
xw = xs + x3;


Y1 = fft(x1); %fourier transform of x1
P2 = abs(Y1/L); %two-sided spectrum
P1 = P2(1:L/2+1); %single-sided spectrum
P1(2:end-1) = 2*P1(2:end-1);

Y2 = fft(x2);
P2 = abs(Y2/L);
P3 = P2(1:L/2+1);
P3(2:end-1) = 2*P3(2:end-1);

Y3 = fft(x3);
P2 = abs(Y3/L);
P4 = P2(1:L/2+1);
P4(2:end-1) = 2*P4(2:end-1);

YS = fft(xs);
P2 = abs(YS/L);
PS = P2(1:L/2+1);
PS(2:end-1) = 2*PS(2:end-1);

YW = fft(xw);
P2 = abs(YW/L);
PW = P2(1:L/2+1);
PW(2:end-1) = 2*PW(2:end-1);

figure(1)
subplot(2,1,1)
plot(t, x1, 'g')
hold on
plot(t, x2, 'y')
hold on
plot(t, x3, 'b')
title('Signals x1, x2, x3')
grid()
legend('x1(t)', 'x2(t)', 'x3(t)')

subplot(2,1,2)
plot(f, P1, 'g')
hold on
plot(f, P3, 'y')
hold on
plot(f, P4, 'b')
title('FT of P1, P2, P3')
grid()
legend('|P1(t)|', '|P2(t)|', '|P3(t)|')

figure(2)
subplot(2,1,2)
plot(f, PS, 'r')
hold on
plot(f, PW, 'y')
grid()
title('FT of PS, PW')
legend('|PS(t)|', '|PW(t)|')

subplot(2,1,1)
plot(t, xs, 'r')
hold on
plot(t, xw, 'y')
grid()
title('Signals xs, xw')
legend('xs(t)', 'xw(t)')
