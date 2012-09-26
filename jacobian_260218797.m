% -------------------------------------------------------------------------
% Written By: Christian Gallai
% Student Number: 260218797
% Date: Monday April 4, 2011
% Assignment: ECSE 443 Assignment 3 - Question 1
%
% Description:
% This function evaluates the Jacobian matrix for the given voltages and Vs
% -------------------------------------------------------------------------

function J = jacobian_260218797(V,Vs)
  
    % node voltages
    v1 = V(1);
    v2 = V(2);
    v3 = V(3);
    v4 = V(4);

    % first row
    J11 = exp((5000*Vs)/129 - (5000*v1)/129)/12900000000000 + 1/10000;
    J12 = -exp((5000*Vs)/129 - (5000*v2)/129)/25800000000000;
    J13 = 0;
    J14 = 0;
    
    % second row
    J21 = -exp((5000*Vs)/129 - (5000*v1)/129)/25800000000000;
    J22 = (101*exp((5000*Vs)/129 - (5000*v2)/129))/2580000000000000 + 1/250;
    J23 = 0;
    J24 = -1/250;
    
    % third row
    J31 = 0;
    J32 = 0;
    J33 = 1/(12900000000000*exp((5000*v3)/129)) + 1/10000;
    J34 = -1/(25800000000000*exp((5000*v4)/129));
    
    % third row
    J41 = 0;
    J42 = -1/250;
    J43 = -1/(25800000000000*exp((5000*v3)/129));
    J44 = 101/(2580000000000000*exp((5000*v4)/129)) + 1/250;
    
    % construct J
    J = [J11 J12 J13 J14; J21 J22 J23 J24; J31 J32 J33 J34; J41 J42 J43 J44];
end