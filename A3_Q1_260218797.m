% -------------------------------------------------------------------------
% Written By: Christian Gallai
% Student Number: 260218797
% Date: Monday April 4, 2011
% Assignment: ECSE 443 Assignment 3 - Question 1
%
% Description:
% This function is used to generate the figure for Q1d
% -------------------------------------------------------------------------

function A3_Q1_260218797

    % funcion values

    % initialize loop values
    Vs = -0.2:4e-3:0.2;
    vi = [15; -0.7; 12.5; -0.7];
    es = (1e-12)*100;
    maxit = 2000;
    
    for i = 1:length(Vs)
 
        % determine values for v, ea, and iter using Newton Raphson Method
        [v, ea, iter] = newton_raphson_260218797(vi, es, maxit, Vs(i));
        vi = v;
        
        % store values
        V0(i) = v(3) - v(1);
        absError(i) = ea;
        iterations(i) = iter;
    end
    
    figure();
    
    % 1. Plot V0 vs. Vs
    subplot(1,3,1);
    plot(Vs,V0);
    
    title('V0 vs. Vs');
    xlabel('Vs');
    ylabel('V0');
    grid on
    axis tight
    
    % 2. Plot iter vs. Vs
    subplot(1,3,2);
    plot(Vs,iterations);
    
    title('iter vs. Vs');
    xlabel('Vs');
    ylabel('iter');
    grid on
    axis tight

    % 3. Plot ea vs. Vs
    subplot(1,3,3);
    plot(Vs,absError);
    
    title('ea vs. Vs');
    xlabel('Vs');
    ylabel('ea');
    grid on
    axis tight
    
end