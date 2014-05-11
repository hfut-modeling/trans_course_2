function dydx = ode5(x,y)
dydx = -20*(y-x.^2) + 2*x;