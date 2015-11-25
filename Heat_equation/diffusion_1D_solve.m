%Written by Hugo Bowne-Anderson, 2015-10-15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%in this script, I numerically solve the 1D diffusion equation.
%I also plot the solution as a surface.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%set spatial range:
L = 1; %length of space
x = linspace(0,L,500);
%set temporal range:
t = linspace(0,1000,200);
%set diffusion coefficient
D = 0.000002;

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
IC = 3;



%Solve & Plot!
soln = diffusion_solve( x , t , D ,  BC , IC);
figure(1)
surf(x,t,soln);
title('Surface plot of diffusing morphogen')
xlabel('Distance')
ylabel('Time')

% figure(2)
% plot(x, soln(1,:))

filename = 'diff_2.avi';

   writerObj = VideoWriter(filename);
    writerObj.FrameRate = 10;
    open(writerObj);
    figure(2)
    for n = 1:length(t)
        set(gca, 'FontSize', 18, 'LineWidth', 1); %<- Set properties
        plot( x , soln(n,:), 'LineWidth',3);
        hold on
        %plot( x , sol(n,:,2), 'r', 'LineWidth',3);
        hold off
        %legend('activator', 'inhibitor', 'Location', 'SouthEast');
        title(strcat('Diffusion pattern at t =' , sprintf(' %4.1f ', t(n))));
        axis([0 L 0 max(max(max(soln(:,:,:))))+0.1])
        M(n) = getframe(figure(2));
        writeVideo(writerObj,M(n));
    end
    
    close(writerObj);

    % play as smooth movie 1 time at 5 frames per second
%     numtimes=1;
%     fps=5;
%     movie(M,numtimes,fps)