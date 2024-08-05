clc;
clear
close all
k=100; %N/m
m=10; %kg
zeta1= [ 0.1 , 1 , 1.5] ;
for j=1:length (zeta1)
    zeta=zeta1 (j);

omega=(k/m)^.5;
omegaD=omega*(1-zeta^2)^.5;
omegaD2=omega*(-1+zeta^2)^.5;
TD=2*pi./omegaD;

t=(0:200)*0.05;



%disp( ' Initial Conditions: ' );
       x_0=20;
       v_0=50.;

    if zeta<1    
      A=x_0;
      B=(v_0+x_0*omega*zeta)/omegaD;
      X=(A^2+B^2)^.5;
      phi=atan(B/A);
      x=X*exp(-zeta*omega*t).*cos(omegaD*t-phi);
      v=-zeta*omega*x-omegaD*X*exp(-omega*zeta*t).*sin(omegaD*t-phi);
       
        l1=X*exp(-omega*zeta*t);
        l2=-X*exp(-omega*zeta*t);
              
        plot(t,x,'r', 'LineWidth', 1.5)
        hold on
        xlabel('time [s]','fontsize',14)
        ylabel('Displacement [mm]','fontsize',14)
        grid on
   
   
elseif zeta==1
x=exp(-omega*t).*(x_0*(1+omega*t)+v_0*t);

plot(t,x, "g", 'LineWidth', 1.5)
xlabel('time [s]','fontsize',14)
ylabel('Displacement [mm]','fontsize',14)
grid on
 
    else
        
        c1=x_0/2+v_0/2/omegaD+zeta*omega*x_0/omegaD2/2;
        c2=x_0/2-v_0/2/omegaD-zeta*omega*x_0/omegaD2/2;
x=exp(-zeta*omega*t).*(c1*exp(omegaD2*t)+c2*exp(omegaD2*t));
   
plot(t,x,"b", 'LineWidth', 1.5)
xlabel('time [s]','fontsize',14)
ylabel('Displacement [mm]','fontsize',14)
grid on
    end
   
end
plot (t,l1, '--'  )
plot (t,l2, '--')

legend('\zeta <1', '\zeta =1', '\zeta >1')
title ('Unforced, Damped response')



