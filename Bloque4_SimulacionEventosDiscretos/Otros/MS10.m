t = 0:0.1:10;
y = t .* sin(t);
funcion = y';
save('MS10', 'funcion')