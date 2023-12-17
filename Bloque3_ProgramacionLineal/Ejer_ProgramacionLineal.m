%% Ejercicio Simplex
f = [-120, -100];
A = [2, 2;
    5, 3];
b = [8, 15];

[x, G] = linprog(f, A, b)

%% Ejercicio Simplex con x_i >= 0
f = [-120, -100];
A = [2, 2;
    5, 3;
    -1, 0;
    0, -1]; % Nota: x_i >= 0 no es estándar se tiene que hacer -x_i <= 0
b = [8, 15, 0, 0];

[x, G] = linprog(f, A, b)

%% Ejercicio: Rentabilidad inversión
f = [-0.1, -0.07];
A = [1, 1;
    1, 0;
    0, -1;
    -1, 1]
b = [10000, 6000, -2000, 0];

[x, G] = linprog(f, A, b)

%% Ejercicio Simplex con x_i >= 0 (simplificado Alf)
f = [120, 100];

A = [2, 2;
    5, 3];
b = [8, 15];

Aeq = [];
beq = [];

lb = zeros(size(f));
ub = [];

[x, G] = linprog(-f, A, b, Aeq, beq, lb, ub)

%% Ejercicio ruta aérea
f = [10, 15];

A = [40, 60;
    2, 3];
b = [-300, 12];

Aeq = [];
beq = [];

lb = zeros(size(f));
ub = [];

[x, G] = linprog(f, A, b, Aeq, beq, lb, ub)
% No tiene solución => resultado es vector vacío
% Hay que reducir el número de pasajeros

%% Problema 1
c1 = 1;
f = [c1, 1];

A = [1, 1;
    1, 2];
b = [6, 10];

Aeq = [];
beq = [];

lb = zeros(size(f));
ub = [];

[x, G] = linprog(-f, A, b, Aeq, beq, lb, ub)

% Habría que hacerlo usando solve, para ver el valor de c1

%% Problema 2: Técnicos CPD
c1 = 1;
f = [c1, 1];

A = [1, 1;
    1, 2];
b = [6, 10];

Aeq = [];
beq = [];

lb = zeros(size(f));
ub = [];

[x, G] = linprog(-f, A, b, Aeq, beq, lb, ub)
