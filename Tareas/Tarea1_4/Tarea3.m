%Pimera parte
t=-0.04:0.001:0.04;
x=20*exp(j*(80*pi*t-0.4*pi));
plot3(t, real(x), imag(x)); grid
title('20*e^{j*(80\pi-0.4\pi)}')
xlabel('Tiempo, s'); ylabel('Real');
waitfor(zlabel('Imag'));

plot(t, real(x),'b'); hold on
plot(t, imag(x),'r'); grid
title('Rojo - Componente Imaginario, Azul - Componente Real de la Exponencial')
xlabel('Tiempo'); waitfor(ylabel('Amplitud'));

%Segunda parte
n=-1000:1000;
x=exp(j*2*pi*0.01*n);
plot(n,real(x));
y=exp(j*2*pi*2.01*n);
hold
waitfor(plot(n,real(y),'r'));

%Tercera parte
n=-50:50;
x=cos(pi*0.1*n); y=cos(pi*0.9*n); z=cos(pi*2.1*n);
subplot(311); plot(n,x); title('x[n]=cos(0.1\pin)'); grid
subplot(312); plot(n,y); title('y[n]=cos(0.9\pin)'); grid
subplot(313); plot(n,z); title('z[n]=cos(2.1\pin)'); grid
waitfor(xlabel('n'));

%Cuarta parte
n=-3:7;
x=0.55.^(n+3);
h=[1 1 1 1 1 1 1 1 1 1 1];
y=conv(x,h);
subplot(311); stem(x); title('Señal Original')
subplot(312); stem(h);
title('Respuesta al Impulso / Segunda Señal')
subplot(313); stem(y);
waitfor(title('Convulción Resultante'));
