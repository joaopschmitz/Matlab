clc;
close all;
clear all;

f=@(x) x^3+4*x^2-10;
a = 1;
b = 2;
e2 = 1*10^-10;
nmax= 15;
i = 1;
fafb = f(a)*f(b);
fa=abs(f(a));
fb=abs(f(b));



if (fafb>0)
    fprintf('Intervalo inadequado [%d,%d]\n',a, b);
    
else
    while (fa>e2 && fb>e2 && i<nmax)
        dist_ab = abs(a-b);
        erro_relativo = e2*a;
        if (dist_ab < erro_relativo)
            fprintf('Saida [%d,%d] minimo', a, b)
            break
        else
            p = 0.5*(a+b);
            fp = f(p);
            %fafp = fa*fp;
            if (f(a)*f(p)<0)
                b = p;
            else
                a = p;
                
        i = i+1;
        fprintf(' %f\n', f(p));
            end
        end
    end
end
    
      
        
if i>nmax
    fprintf('As iterações excederam o número máximo permitido');
    
if abs(fa)<e2
    fprintf('p = %d', a)
    
if abs(fb)<e2
    fprintf('p = %d', b)

end
end
end

            
            
            
            
            
            
            
            
            
            
            
            