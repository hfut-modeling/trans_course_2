function dydx = ode4(x,y)
dydx = (y.^2 + y)./x;