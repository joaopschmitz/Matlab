%Resposta questão 17%
r1 = 0.075;
x1 = 0.17;
r2 = 0.065;
x2 = 0.17;
xm = 7.2;
v = 440;
v_phase = 440/sqrt(3);
n_sync = (120*50)/2;
w_sync = n_sync*(2*pi/60);
p_core = 1100;
p_misc = 150;
p_mech = 1000;

v_th = v_phase*(xm/sqrt(r1^2 + (x1+xm)^2));
z_th = ((j*xm)*(r1+ j*x1))/(r1+j*(x1+xm));
r_th = real(z_th);
x_th = imag(z_th);

s = (0:0.1:5)/50;
s(1)= 0.001;
nm = (1-s)*n_sync;
wm = (1-s)*w_sync;

for ii = 1:51
    %torque
    t_ind1(ii) = (3*v_th^2 *(r2/s(ii))/(w_sync*(((r_th +(r2/s(ii)))^2 + (x_th + x2)^2))));
    %P convertido
    p_conv(ii) = t_ind1(ii)*wm(ii);
    
    %P saída
    p_out(ii) = p_conv(ii) - p_core - p_mech - p_misc;
    
    %P entrada
    zeq = (r1 + j*x1) + (((r2/s(ii)) + j*x2)*j*xm)/((r2/s(ii)) + j*(x2+xm));
    il = v_phase/zeq;
    p_in(ii) = 3 * v_phase * abs(il) * cos(atan(imag(il)/(real(il)))); 
    
    %eficiência
    efficiency(ii) = (p_out(ii)/p_in(ii))*100; 
end

figure(1);
plot(nm, t_ind1,'Color','k','LineWidth', 2.0);
hold on;
xlabel('\itn_{m}','FontWeight','Bold');
ylabel('\tau_{ind}','FontWeight','Bold');
title ('Induction Torque-Speed Characteristic','FontWeight','Bold');
grid on;
hold off;

figure(2);
plot(nm, p_conv,'Color','k','LineWidth', 2.0);
hold on;
xlabel('\itn_{m}','FontWeight','Bold');
ylabel('\itP_{conv}','FontWeight','Bold');
title ('Induction P_{conv}-Speed Characteristic','FontWeight','Bold');
grid on;
hold off;

figure(3);
plot(nm, p_out,'Color','k','LineWidth', 2.0);
hold on;
xlabel('\itn_{m}','FontWeight','Bold');
ylabel('\itP_{out}','FontWeight','Bold');
title ('Induction P_{out}-Speed Characteristic','FontWeight','Bold');
grid on;
hold off;

figure(4);
plot(nm, efficiency,'Color','k','LineWidth', 2.0);
hold on;
xlabel('\itn_{m}','FontWeight','Bold');
ylabel('\itEff','FontWeight','Bold');
title ('Induction Efficiency-Speed Characteristic','FontWeight','Bold');
grid on;
hold off;