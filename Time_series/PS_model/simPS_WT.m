%Function to simulate psODE for WT hosts
% inputs: (1)Ki- total immune capacity, (2)immune- initial immune response, 
%         (3)bacteria- initial bacteria conc., (4)phage- initial phage conc.
% outputs:(1)y- matrix of all of the population changes for bacteria,
%          phage and immune response.
%         (2)TB - vector of total bacteria population
%         (3)time - vector of time values over the simulation

function [ y, TB, time ] = simPS_WT( Ki, immune, bacteria, phage )

    %----------parameters-------------
    % susceptible bacteria growth rate
    p.r = 0.75;
    % total bacteria carrying capacity
    p.Kc = 1e10;
    % adsorption rate of phage:
    p.phi = 5.4e-8;
    % phage density at half saturation
    p.Pc = 1.5e7;
    % immune response killing rate parameter:
    p.ep = 8.2e-8;
    % bacterial conc. at which immune response is half as effective:
    p.Kd = 4.1e7;
    % burst size of phage:
    p.beta = 100;
    % decay rate of phage:
    p.w = 0.07;
    % maximum growth rate of immune response:
    p.a = 0.97;
    % max capacity of immune response:
    p.Ki = Ki;
    % conc. of bacteria at which imm resp growth rate is half its maximum:
    p.Kn = 1e7;

    %initial conditions
    Bo = bacteria;
    Po = 0;
    Io = immune;
    tspan = 0:2;
    y0 = [Bo;Po;Io];

    % simulating diff eq
    options = odeset('Events',@myEventsFcn);
    [t1,y1] = ode45(@psODE,tspan,y0,options,p);

    %----------------------------------------
    % Add phage dose time delay (2hrs)

    B = y1(end,1);
    P = phage;
    I = y1(end,3);
    tspan2 = 2:156;
    yi = [B;P;I];

    % simulating diff eq
    [t2,y2] = ode45(@psODE,tspan2,yi,options,p);

    %----------------------------------------
    % continue simulation after bacteria dies

    check = 0;
    currentTime = t2(end);
    if currentTime < 155
        check = 1;
        B2 = y2(end,1);
        if B2 <= 1
            B2 = 0;
        end
        P2 = y2(end,2);
        I2 = y2(end,3);
        tspan3 = currentTime:156;
        yii = [B2;P2;I2];

        % simulating diff eq
        [t3,y3] = ode45(@psODE,tspan3,yii,options,p);
    end
    if check == 1
        time = [t1; t2; t3];
        y = [y1; y2; y3];
    else
        y = [y1; y2;];
        time = [t1; t2];
    end
    TB = y(:,1);
end