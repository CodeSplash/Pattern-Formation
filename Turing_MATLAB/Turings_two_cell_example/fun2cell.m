% Here we define the system of DEs that 
% describes Turing pattern formation in (Turing, 1952)
% for the 2 cell, discrete system.
function dy = fun2cell(t,y)
a = 5;
b = -6;
c = 6;
d = -7;
mu = 0.5; %diffusion coefficient of X
nu = 4.5; %diffusion coefficient of Y
%here we first initialize and then define the system of differential
%equations
dy = zeros(4,1); 
dy(1) = a*y(1) + b*y(2) + 1  + 2*mu*(y(3) - y(1));
dy(2) = c*y(1) + d*y(2) + 1  + 2*nu*(y(4) - y(2));
dy(3) = a*y(3) + b*y(4) + 1  + 2*mu*(y(1) - y(3));
dy(4) = c*y(3) + d*y(4) + 1  + 2*nu*(y(2) - y(4));