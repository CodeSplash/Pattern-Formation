%Written by Hugo Bowne-Anderson, 2015-10-15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%in this script, we write a function that solves 1D diffusion equation 
%as a function of (i) spatial vector x, (ii) temporal vector t, (iii) diffusion
%coefficient D, (iv) boundary condition specification BC &
%(v) initial condition specification IC.
%I do so using MATLAB's pdepe.
%Run the accompanying file diffusion_1D_solve.m for solution.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [soln] = diffusion_solve( x , t , D , BC , IC)
    
    %Here I bundle the funnctions that define the
    %(i) initial conditions, (ii) boundary conditions
    %& (iii) PDE under one handle 'funs'
    function funs = diff_funs1
        funs.fun1 = @eqn1;
        funs.fun2 = @bc1;
        funs.fun3 = @initial1;
    end


    %define PDE here:
    function [c,b,s] = eqn1(x,t,u,DuDx)
        c = 1;
        b = D*DuDx;
        s = 0;
    end
    
    %Define boundary conditions here:
    function [pl ,ql , pr , qr ] = bc1( xl , ul , xr , ur , t)
        if BC == 0
            pl = 0;
            ql = 1;
            pr = 0;
            qr = 1;
        elseif BC == 1
            pl = ul-1;
            ql = 0;
            pr = ur-1;
            qr = 0;
        elseif BC == -1
            pl = ul;
            ql = -1;
            pr = ur;
            qr = 1;
        end
    end

    %Define initial conditions here:
    function value = initial1(x)
        if IC == 0
            value = zeros(1,length(x));
        elseif IC ==1
            value = ones(1,length(x));
        elseif IC == 2
            value = exp(-(x-0.5).^2*100);
        elseif IC == 3
            value = 2 + sin(30*x) + sin(7000*x)/2 + sin(8000*x)/3;
        end
  
    end

    diff_functions = diff_funs1; %calling the functions defined above
    %to solve the PDE
    m = 0; %specifies no (spatial) symmetry

    %solve the PDE here:
    soln = pdepe(m , @diff_functions.fun1 , @diff_functions.fun3 , @diff_functions.fun2 , x , t);

end