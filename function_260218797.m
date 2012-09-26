% -------------------------------------------------------------------------
% Written By: Christian Gallai
% Student Number: 260218797
% Date: Monday April 4, 2011
% Assignment: ECSE 443 Assignment 3 - Question 1
%
% Description:
% This function evauates the function values for the given voltage array
% and Vs
% -------------------------------------------------------------------------

function f = function_260218797(V,Vs)

    % constants
    Vcc = 15;
    Rc = 10000;
    R = 250;
    I = 0.25e-3;
    Is = 1e-15;
    Bf = 100;
    Br = 1;
    Vt = 25.8e-3;
    
    % node voltages
    v1 = V(1);
    v2 = V(2);
    v3 = V(3);
    v4 = V(4);
    
    % voltages
    VBE1 = Vs - v2;
    VBC1 = Vs - v1;
    VBE2 = -v4;
    VBC2 = -v3;

    % transport model currents
    IBE1 = Is/Bf*(exp(VBE1/Vt) - 1);
    IBE2 = Is/Bf*(exp(VBE2/Vt) - 1);
    IBC1 = Is/Br*(exp(VBC1/Vt) - 1);
    IBC2 = Is/Br*(exp(VBC2/Vt) - 1);
    IT1 = Is*(exp(VBE1/Vt) - 1) - Is*(exp(VBC1/Vt) - 1);
    IT2 = Is*(exp(VBE2/Vt) - 1) - Is*(exp(VBC2/Vt) - 1);

    % determine row values
    f11 = (v1-Vcc)/Rc - IBC1 + IT1;
    f21 = I + (v2-v4)/R - IBE1 - IT1;
    f31 = (v3 - Vcc)/Rc - IBC2 + IT2;
    f41 = I + (v4 - v2)/R - IBE2 - IT2;
    
    % construct f vector
    f = [f11;f21;f31;f41];
    
end