function dydx = ode3(x,y)
dydx = 2*y./x + x.^2.*exp(x);