function [ dx ] = psODE( t,x,p )

dx = [0;0;0];

%---------------------Parameters-------------------------
% susceptible bacteria growth rate
r = p.r;
% total bacteria carrying capacity
Kc = p.Kc;
% adsorption rate of phage:
phi = p.phi;
% phage density at half saturation
Pc = p.Pc;
% immune response killing rate parameter:
ep = p.ep;
% bacterial conc. at which immune response is half as effective:
Kd = p.Kd;
% burst size of phage:
beta = p.beta;
% decay rate of phage:
w = p.w;
% maximum growth rate of immune response:
a = p.a;
% max capacity of immune response:
Ki = p.Ki;
% conc. of bacteria at which imm resp growth rate is half its maximum:
Kn = p.Kn;

B = x(1);
P = x(2);
I = x(3);

% Change in susceptible bacterial population
dx(1) = (r*B*(1-(B/Kc)))-(B*((phi*P)/(1+(P/Pc))))-(ep*I*B/(1+(B/Kd)));
% Change in phage population
dx(2) = (beta*B*((phi*P)/(1+(P/Pc))))-(w*P);
% Change immune response
dx(3) = a*I*(B/(B+Kn))*(1-(I/Ki));

end

