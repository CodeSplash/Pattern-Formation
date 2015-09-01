%     Copyright 2014 Hugo Bowne-Anderson
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%in this script, solve the Gierer-Meinhardt system for a variety of 
%parameters. We also plot the solutions.
%The partial differential equations are the dimensionless G-M system:
% da/dt = D*Delta(a) + a^2/h - a + sigma (Eqn 1)
% dh/dt = Delta(h) + mu*(a^2 - h) (Eqn 2)
%Notes: (1) the derivates are partial derivatives; (2) Delta(a) is the
%Laplacian of a; (3) t,a,h, & Delta are all dimensionless so should really
%have bars above them; (4)D is ratio of diffusion constants--
% activator/inhibitor -- , mu is a reaction term & sigma is a baseline
%synthesis term for a.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GM_solve takes 5 parameters:
%P(1) = D in PDE;
%P(2) = mu in PDE;
%P(3) = sigma in PDE;
%tmax = amount of time that we run the system;
%n = number of time points that we integrate over;
%L = length (spatial) of system;
%GM_solve outputs the solution (concentrations of activator-inhibitor system
%over the time course and plots the solution: 
%1) as a surface & 2) as an animation.

%We consider the phase plane of the G-M system with axes given by
%D (ratio of diffusion constants: activator/inhibitor) and mu (reaction
% term) while keeping everything else constant.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The constants are given by:
tmax = 100;
n =100;
L = 10;
%Try to get "patterns" by setting
P = [0.1 ; 1.25 ; 0.07 ];
P = [0.05 ; 0.05 ; 0.07 ];
P = [0.4 ; 0.5 ; 0.07 ];
P = [0.05 ; 1.4 ; 0.07 ];

%and running the solver/plotter:
soln = GM_solve(P , tmax , n , L);


%%
%In this cell and those below we'll give you typical parameters for the other regions
%of the phase plane:
%YOUR 1ST JOB IS TO QUALITATIVELY DESCRIBE THESE DIFFERENT REGIONS!
%So try:
P = [0.4 ; 1.25 ; 0.07 ];
soln = GM_solve_record(P , tmax , n , L, 'test_pattern2whaat!.avi');

%%
%Now try:
P = [0.4 ; 0.5 ; 0.07 ];
soln = GM_solve_record(P , tmax , n , L, 'test_pattern3.avi');

%%
%And lastly, try this one:
P = [0.05 ; 0.05 ; 0.07 ];
soln = GM_solve_record(P , tmax , n , L, 'test_pattern4.avi');

%%
%Next: alter P(1) = D and P(2) = mu to move around the phase plane &
%finally draw a phase diagram for this Gierer-Meinhardt system.
%Describe what you see.

