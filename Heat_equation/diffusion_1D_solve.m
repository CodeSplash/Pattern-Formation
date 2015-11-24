%Written by Hugo Bowne-Anderson, 2015-10-15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%in this script, I numerically solve the 1D diffusion equation.
%I also plot the solution as a surface.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%set spatial range:
x = linspace(0,1,500);
%set temporal range:
t = linspace(0,1,50);
%set diffusion coefficient
D = 0.005;

%Now to specify boundary conditions
%Currently:
%BC = 0 gives reflecting boundary conditions;
%BC = 1 gives flux in from boundaries until concentration = 1;
%BC = -1 give absorbing boundary conditions;
BC = 0;

%Now to specify initial conditions
%Currently:
%IC = 0 gives zero concentration throughout;
%IC = 1 gives concentration = 1 throughout;
%IC = 2 gives a Gaussian concentration profile (try it!)
IC = 2;



%Solve & Plot!
soln = diffusion_solve( x , t , D ,  BC , IC);
figure(1)
surf(x,t,soln);
title('Surface plot of diffusing morphogen')
xlabel('Distance')
ylabel('Time')

% figure(2)
% plot(x, soln(1,:))