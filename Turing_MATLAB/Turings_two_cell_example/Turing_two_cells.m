% Here we SOLVE the system of DEs that 
% describes Turing pattern formation in (Turing, 1952)
% for the 2 cell, discrete system.
% We use ode15s but, for most parameters, ode45 should work.
%[T,Y] = ode15s(@(t,y) fun1(t,y),[t1 t0],[y1(0) y2(0) y3(0) y4(0)]) numerically
%integrates from time t0 to time t1 with inital condition vector
%[y1(0) y2(0) y3(0) y4(0)].

%[T,Y] = ode15s(@(t,y) fun2cell(t,y),[0 60],rand(1,4));
[T,Y] = ode15s(@(t,y) fun2cell(t,y),[0 5],[1.06 1.02 0.94 0.98]);

%Here we plot morphogen concentrations as a function of time t.

figure
a1 = plot(T,Y(:,1),'-','LineWidth',3)
hold on
a2 = plot(T,Y(:,2),'-','LineWidth',3)
hold on
plot(T,Y(:,3),'-','LineWidth',3)
hold on
plot(T,Y(:,4),'-','LineWidth',3)
set(gca,'FontSize',16,'LineWidth',2);
title('Turing patterns')
xlabel('time(s)');
ylabel('Morphogen Concentration ');
legend('morphogen X, cell 1', 'morphogen Y, cell 1','morphogen X, cell 2', 'morphogen Y, cell 2','Location','southwest');