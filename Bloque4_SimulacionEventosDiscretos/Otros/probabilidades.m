% Definir la tasa promedio de llegada de eventos
tasa_promedio = 0.1;  % Por ejemplo, un evento cada 10 unidades de tiempo

% Calcular lambda como el inverso de la tasa promedio
lambda = 1 / tasa_promedio;

% Generar intervalos de tiempo con distribución de Poisson
numEventos = 1000;  % Número de eventos que deseas generar
intervalosTiempo = poissrnd(lambda, 1);

% Visualizar histograma de los intervalos de tiempo
hist(intervalosTiempo);
xlabel('Intervalo de Tiempo');
ylabel('Frecuencia');
title('Distribución de Poisson para Intervalos de Tiempo');
