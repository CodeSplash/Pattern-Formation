% Here we define the system of DEs that 
% describe Chromosome Oscillations in
% Mitosis (Eqn (3) from (Campàs et al., 2006))
function dy = fun1(t,y)
%below, we set all the parameters
%necessary for the simulation (see caption to Fig. 3)
kbr = 266/(y(2))^2;
N = 100;
ku = 1.65;
ns = 11.5;
neta = 5.2;
V0 = 2.38/60;
f= 2;
%here we first initialize and then define the system of differential
%equations
dy = zeros(2,1); 
dy(1) = kbr*(N - y(1)) - ku*exp(f*(ns+neta)/(y(1)+neta))*y(1);
dy(2) = V0*(y(1) - ns)/(y(1) + neta);