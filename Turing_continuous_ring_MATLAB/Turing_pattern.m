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

clear;
close all;


%The constants are given by:
tmax = 2000;
n =100;
L = 100;
%%Try to get "patterns" by setting
I = 0.01;
P = [I-2 ; 2.5 ; -1.25 ; I + 1.5 ; 1 ; 0.5 ];
%P = [ 0 ; 1 ; -1 ; 0 ; 0.25 ; 0.25 ];
%I = 0.2;
%P = [I-1 ; 1 ; -1 ; I ; 1 ; 0 ];
% P = [0.05 ; 0.05 ; 0.07 ];
% P = [0.4 ; 0.5 ; 0.07 ];
% P = [0.05 ; 1.4 ; 0.07 ];

%and running the solver/plotter:
soln = TP_solve(P , tmax , n , L);

