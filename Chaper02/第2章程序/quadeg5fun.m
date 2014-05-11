function f=quadeg5fun(t,y)
f=y-2*t./y;
f=f(:);			%保证f为一个列向量