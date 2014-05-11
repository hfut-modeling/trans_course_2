function TestRK4(fun, xEnd, ini, N, result)
h = (xEnd - ini(1))/N;
[x,y] = RK4ODE(fun, xEnd, ini, h);
y0 = feval(result, x);
plot(x,y,'ro',x,y0,'b-');