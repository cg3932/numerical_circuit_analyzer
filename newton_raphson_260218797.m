% -------------------------------------------------------------------------
% Written By: Christian Gallai
% Student Number: 260218797
% Date: Monday April 4, 2011
% Assignment: ECSE 443 Assignment 3 - Question 1
%
% Description:
% This function uses the newton raphson method to solve for the voltages v
% given an initial guess v0 and parameters es, maxit, and Vs
% -------------------------------------------------------------------------

function [v, ea, iter] = newton_raphson_260218797(v0, es, maxit, Vs)

    % initialize loop values
    v = v0;
    iter = 0;
    
    % loop until maxit or es are reached
    while( 1 )

        % Determine the Jacobian for input x
        J = jacobian_260218797(v,Vs);

        % Determine f
        f = function_260218797(v,Vs);

        % calculate J/f
        dv = J\f ;
        warning off all;

        % determine the new value of x for this iteration
        v = v - dv;

        % increment the iteration count
        iter = iter + 1 ;
        
        % calculate the percent relative error
        ea = 100*max(abs(dv./v));

        % if the iteration exceeds maxit or ea<=ea then exit
        if iter>=maxit || ea<=es, break, end

    end

end