% Parámetros de la distribución normal
media = 8;  % Media de la distribución
desviacion_estandar = 2;  % Desviación estándar de la distribución

% Generar un número aleatorio con distribución normal
numero_objetos = round(randn * desviacion_estandar + media);

% Asegurarse de que el resultado esté en el rango deseado (entre 2 y 14)
numero_objetos = max(2, min(14, numero_objetos));

% Visualizar el resultado
disp(['Número aleatorio de objetos para la compra: ' num2str(numero_objetos)]);
