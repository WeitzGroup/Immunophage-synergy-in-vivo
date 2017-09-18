% Code to simulate phage saturation with resistance (ODE)
% Prophylaxis
% Phage added 4 days before infection
% Dependencies: (1) rpsODE.m (2) myEventsFcn.m

clear
clc
close all

%-------parameters for prophylaxis----------
% susceptible bacteria growth rate
p.r = 0.75;
% resistant bacteria growth rate
p.rp = 0.675;
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
p.Ki = 2.4e7;
% conc. of bacteria at which imm resp growth rate is half its maximum:
p.Kn = 1e7;
% probability of emergence of phage-resistant mutation per cell division
p.m = 2.85e-8;

%----------------------------------------
% prophylaxic case - phage added 4 days before infection
Bo = 0;
Ro = 0;
Po = 7.4e9;
% Po = 0; % no phage treatment
Io = 2.7e6;
tspan = 0:96;
y0 = [Bo;Ro;Po;Io];

% simulating diff eq
options = odeset('Events',@myEventsFcn);
[t1,y1] = ode45(@rpsODE,tspan,y0,options,p);

%----------------------------------------
% Add bacteria

B = 7.4e7;
R = 0;
P = y1(end,3);
I = y1(end,4);
tspan2 = 96:168;
yi = [B;R;P;I];

% simulating diff eq
[t2,y2] = ode45(@rpsODE,tspan2,yi,options,p);

time = [t1; t2];
y = [y1; y2];
%----------------------------------------
% continue simulation after susceptibles or resistants die

check = 0;
currentTime = t2(end);
if currentTime < 167
    check = 1;
    B2 = y2(end,1);
    if B2 <= 1
        B2 = 0;
    end
    R2 = y2(end,2);
    if R2 <= 1
        R2 = 0;
    end
    P2 = y2(end,3);
    I2 = y2(end,4);
    tspan3 = currentTime:168;
    yii = [B2;R2;P2;I2];

    % simulating diff eq
    [t3,y3] = ode45(@rpsODE,tspan3,yii,options,p);
end
%----------------------------------------
% continue simulation after susceptibles or resistants die

% Check if run completed without bacteria dying
if check == 1
    currentTime2 = t3(end);
else
    currentTime2 = 168;
end
if currentTime2 < 167
    B3 = y3(end,1);
    if B3 <= 1
        B3 = 0;
    end
    R3 = y3(end,2);
    if R3 <= 1
        R3 = 0;
    end
    P3 = y3(end,3);
    I3 = y3(end,4);
    tspan4 = currentTime2:168;
    yiii = [B3;R3;P3;I3];

    % simulating diff eq
    [t4,y4] = ode45(@rpsODE,tspan4,yiii,options,p);

    time = [t1; t2; t3; t4];
    y = [y1; y2; y3; y4];
elseif check == 1
    time = [t1; t2; t3];
    y = [y1; y2; y3];
else
    y = [y1; y2;];
    time = [t1; t2];
end

%convert time to days
time = (time-96)/24;

%----------------------------------------
% plotting
%----------------------------------------

% Plot default values
set(0,'DefaultAxesLinewidth',2)
set(0, 'DefaultAxesFontName', 'Arial')

% Define color vectors
Bvector = [235 140 87]./255;
Rvector = [204 204 0]./255;
Pvector = [0 171 169]./255;
Ivector = [159 0 197]./255;

figure(1)
%-----------------------------------------------------
% Supplementary figure

% semilogy(time,y(:,1),'Color', Bvector,'Linewidth',3);
% hold on;
% semilogy(time,y(:,2),'Color', Rvector,'Linewidth',3)
% semilogy(time,y(:,3),'Color', Pvector,'Linewidth',3)
% semilogy(time,y(:,4),'Color', Ivector,'Linewidth',3)

%-----------------------------------------------------
% Main paper figures

semilogy(time,y(:,1),'Color', Bvector, 'Linewidth',2);
hold on;
semilogy(time,y(:,2),'Color', Rvector,'Linewidth',2)
semilogy(time,y(:,3),'LineStyle','--','Color', Pvector,'Linewidth',2)
semilogy(time,y(:,4),'LineStyle','--','Color', Ivector,'Linewidth',2)

%-----------------------------------------------------
xlabel('Days post infection', 'FontSize', 16,'fontweight','bold')
set(gca,'XTick',[-4:1:3])
ylabel('Density (g^{-1})', 'FontSize', 16,'fontweight','bold')
h = findobj('Color',Bvector);
j = findobj('Color',Rvector);
g = findobj('Color',Pvector);
i = findobj('Color',Ivector);
if Po ~= 0
    % Legend for condition with phage treatment
    v = [g(1) i(1) h(1) j(1)];
    h_leg = legend(v, 'phages','host immunity','sensitive-bacteria','resistant-bacteria','Location','northwest');
else
    % Legend for condition with phage treatment
    v = [i(1) h(1) j(1)];
    h_leg = legend(v,  'host immunity','sensitive-bacteria','resistant-bacteria','Location','northwest');
end
axis([-4,3,1e0,1e15])
legend boxoff
set(gca,'FontSize',16,'fontweight','bold')
set(gca, 'Units','inches','Position',[1 1 3 2.5])
set(h_leg, 'FontSize',11,'fontweight','normal')
set(gcf,'PaperPositionMode','manual','PaperPosition',[0.25 2.5 8 6],'PaperUnits','inches')
% 
%  saveas(gcf, 'RPS_prophylaxis_bold', 'fig')
%  saveas(gcf,'RPS_prophylaxis_bold','epsc')
