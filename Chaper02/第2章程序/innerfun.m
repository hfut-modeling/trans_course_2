function int = innerfun(fun,lowerlim,upperlim,nquad,n,level,x,quadrule)
%usage:  int = innerfun(fun,lowerlim,upperlim,nquad,n,level,x,quadrule);

int = 0;
[bp,wf]=feval(quadrule,nquad(level));

xx=x;
qx=(upperlim(level)-lowerlim(level))/2;
px=(upperlim(level)+lowerlim(level))/2;
xlevel=qx*bp+px;

if level==1,
  for i=1:nquad(level),
    xx(level)=xlevel(i);
    int = int + wf(i) * feval(fun,xx);
  end
else,
  for i=1:nquad(level),
    xx(level)=xlevel(i);
    int = int + wf(i) *  ...
	  innerfun(fun,lowerlim,upperlim,nquad,n,level-1,xx,quadrule);
  end
end

int = int * qx;
