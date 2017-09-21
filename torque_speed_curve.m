% Script to calculate the Torque-Speed characteristics of the motor;


r1 = 0.641;
x1 = 1.106;
r2 = 0.332;
x2 = 0.464;
xm = 26.3;
v_phase = 460/sqrt(3);
n_sync = 1800;
w_sync = 188.5;

v_th = v_phase*(xm/sqrt(r1^2 + (x1+xm)^2));
z_th = ((j*xm)*(r1+ j*x1))/(r1+j*(x1+xm));
r_th = real(z_th);
x_th = imag(z_th);

s = (0:1:50)/50;
s(1)= 0.001;
nm = (1-s)*n_sync;

for ii = 1:51
    t_ind1(ii) = (3*v_th^2 *(r2/s(ii)))/(w_sync*(((r_th +r2/s(ii))^2 + (x_th + x2)^2)));
end

for ii = 1:51
    t_ind2(ii) = (3*v_th^2 * ((2*r2)/s(ii)))/(w_sync*((r_th +r2/s(ii))^2 + (x_th + x2)^2));
end

plot(nm,t_ind1,'Color','k','LineWidth', 2.0);
hold on;
plot(nm,t_ind2,'Color','k','LineWidth',2.0,'LineStyle','-.');
xlabel('\itn_{m}','FontWeight','Bold');
ylabel('\tau_{ind}','FontWeight','Bold');
title ('Induction Motor Torque-Speed Characteristic','FontWeight','Bold');
legend('Original R_{2}','Doubled R_(2)');
grid on;
hold off;