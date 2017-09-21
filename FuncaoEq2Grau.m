function y = FuncaoEq2Grau(a,b,c)
x = [-10: 0.1: 10];
y=x.^2+b*x+c;
plot(x,y);
