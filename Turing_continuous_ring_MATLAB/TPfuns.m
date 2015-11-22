%     Copyright 2015 Hugo Bowne-Anderson
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
%in this script, we define the necessary functions for our Turing
%system (Turing, 1952):
%1) the initial conditions;
%2) the boundary conditions;
%3) the PDEs themseleves.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Here we use function handles to define subfunctions. This makes life
%easier. 
function funs = TPfuns
    funs.fun1 = @TPICfun;
    funs.fun2 = @TPBCfun;
    funs.fun3 = @TPPDEfun;
end

%initial conditions function
function u0 = TPICfun(x,P)
% Here we define the initial conditions for the system --
% We use a small random perturbation from the steady state for
%the activator and do not perturb the inhibitor (note: steady state
%concentrations are 1 for both activator & inhibitor).
%u0 = [ones(1,length(x)) +  rand(1,length(x))/10 ; ones(1,length(x)) ];
u0 = [rand(1,length(x))/10 ; rand(1,length(x))/10 ];

end

%boundary conditions function
function [pl,ql,pr,qr] = TPBCfun(xl,ul,xr,ur,t,P)
% Here we define the boundary conditions for the system (no flux at either end)--
pl = [0;0]; ql = [1;1];
pr = [0;0]; qr = [1;1];
end

%PDE
function [c,f,s] = TPPDEfun(x,t,u,dudx,P)
%Here we define the PDE
a = P(1);
b = P(2);
c1 = P(3);
d = P(4);
mu = P(5);
nu = P(6);
% PDE
c = [1;1];
f = [mu;nu].*dudx;
s = [ a*u(1) + b*u(2) ; c1*u(1) + d*u(2) ];
end