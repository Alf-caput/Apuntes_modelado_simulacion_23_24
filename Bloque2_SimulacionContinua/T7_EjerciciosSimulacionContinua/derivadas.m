syms M(t) K t0 M0
ode = diff(M, t) == K;
cond = M(t0) == M0;
M(t) = dsolve(ode, cond);
M(t) = collect(M(t), K) % Para sacar factor común la K
%%
% sympref
syms M(t) K S t0 M0
ode = diff(M, t) == K-S;
cond = M(t0) == M0;
M(t) = dsolve(ode, cond);
M(t) = collect(M(t), [K, S]) % Para sacar factor común la K

% si t0 = 0
cond0 = subs(cond, t0, 0);
M(t) = dsolve(ode, cond0)
%%
% sympref
syms M(t) K S r t0 M0
S = subs(S, r*M)
ode = diff(M, t) == K-S
cond = M(t0) == M0;
M(t) = dsolve(ode, cond)
%% 
% Se estabiliza si la derivada es nula:
% 
% $0=K-\textrm{rM}$ es decir $M=\frac{K}{r}$

syms x(t) t0
ode = diff(x, t, 2) + x == 0
cond = [x(0) == 0, subs(diff(x, t), 0) == 2];
x(t) = dsolve(ode, cond)

fplot(x)
%%
syms M(t) K S r t0 M0
S = subs(S, r*M)
K = subs(K, 0)
t0 = subs(t0, 0)
ode = diff(M, t) == K-S
cond = M(t0) == M0;
M(t) = dsolve(ode, cond)

vida_media = solve(M == M0/2)
%%
syms M(t) K S r t0 M0
S = subs(S, r*M)
K = subs(K, 0)
t0 = subs(t0, 0)
ode = diff(M, t) == K+S
cond = M(t0) == M0;
M(t) = dsolve(ode, cond)
%%
syms f(x)
f(x) = x^2 - 3*sin(x) + 0.1
double(subs(f, 0))
double(subs(f, pi/2))
% Por bolzano se que hay raíz entre 0 y 1
fplot(f, [-6, 10])
%%
syms f(x)
f(x) = x^2 - 3*sin(x) + 0.1
sol = vpasolve(f==0)
%%
syms P(t) K Pmax t0 P0
ode = diff(P, t) == K*P*(1-P/Pmax)
cond = P(t0) == P0;
P(t) = dsolve(ode, cond)
%%
% x' = 0 en estabilidad (por tanto también x''=0)
% Hay que resolver 2x + x^2 =1
% x^2+2x-1 = 0

f = @(x) x^2+2*x-1;
disp(fzero(f, 0))