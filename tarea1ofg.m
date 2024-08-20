% tarea ondas en fluidos
%% datos
beta=2*10^(-11); % [1/sm]
f= 10^(-4); % [1/s]
c= 3; % [m/s]
l=0;
%% curva de dispersion suponiendo l=0
% calculamos radio de rossby
Lr= c/f;

% definimos numero de onda
N = 100; % Número de puntos para graficar

% Rango de valores para el número de onda de Rossby
k = linspace(-0.0003,0, N);

% Calcula la frecuencia angular utilizando la ecuación de dispersión de Rossby
omega = (- beta .* k) ./ (k.^2 + l.^2 + Lr.^(-2));

% Grafica la curva de dispersión de Rossby
figure
plot(k, omega);
xlabel('Número de onda de Rossby (k)');
ylabel('Frecuencia angular (\omega)');
title('Curva de dispersión de Rossby');
grid on;


%% curva de dispersion con circulos
%parametrizamos: x=c+r*cos(theta), y=c+r*sen(theta)
%seleccionamos 3 distintos omega para cada circulo
maxx=max(omega);

omega1=omega(1,11);
omega2=omega(1,57);
omega3=omega(1,93);

%definimos radio
r1= sqrt((beta/(2*omega1))^2-(f/c)^2);
r2= sqrt((beta/(2*omega2))^2-(f/c)^2);
r3= sqrt((beta/(2*omega3))^2-(f/c)^2);

%definimos el angulo theta
theta=linspace(0,2*pi);

%centro del eje x= -beta/2*omega
c1= -beta/(2*omega1);
c2= -beta/(2*omega2);
c3= -beta/(2*omega3);

%centro del eje y=yo
y_0=0;

%reemplazamos en cada ecuacion de la circunsferencia
% x=c+r*cos(theta), y=c+r*sen(theta)
x1= c1+ r1* cos(theta);
y1= y_0 + r1*sin(theta);

x2= c2 + r2*cos(theta);
y2= y_0 + r2*sin(theta);

x3= c3 + r3*cos(theta);
y3= y_0 + r3*sin(theta);

% eje x se define por k*c/f y el eje y= l*c/f, con k=x y l=y
figure
plot(x1*c/f, y1*c/f)
hold on
plot(x2*c/f, y2*c/f)
plot(x3*c/f, y3*c/f)




