% Here we SOLVE the system of DEs that 
% describe Chromosome Oscillations in
% Mitosis (Eqn (3) from (Campàs et al., 2006))
% We use ode15s but, for most parameters, ode45 should work.
%[T,Y] = ode15s(@(t,y) fun1(t,y),[t1 t0],[n(0) r(0)]) numerically
%integrates from time t0 to time t1 with inital condition vector
%[n(0) r(0)].

[T,Y] = ode15s(@(t,y) fun1(t,y),[0 1000],[40 11]);

%Here we plot n/N (n = number of bound chromokinesins, N = total number)
%& chromosome position r as functions of time t

N = 100
figure
plot(T,Y(:,1)/N,'-','LineWidth',3)
set(gca,'FontSize',16,'LineWidth',2);
title('Chromosome Oscillations in Mitosis')
xlabel('time(s)');
ylabel('n/N');

figure
plot(T,Y(:,2),'-','LineWidth',3)
%plot(T,Y(:,1)/N,'-','LineWidth',3)
set(gca,'FontSize',16,'LineWidth',2);
title('Chromosome Oscillations in Mitosis')
xlabel('time(s)');
ylabel('Chromosome position (um)');