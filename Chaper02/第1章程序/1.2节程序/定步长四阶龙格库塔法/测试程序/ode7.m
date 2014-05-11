function dydx = ode7(x,y)
dydx = -20*(y - exp(x).*sin(x)) + exp(x).*(sin(x) + cos(x));