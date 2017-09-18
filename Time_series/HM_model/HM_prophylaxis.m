% Code to simulate resistance heterogeneous mixing model (ODE)
% Prophylaxis
% Phage added 4 days before infection
% Dependencies: (1) hmODE.m (2) myEventsFcn.m

clear
clc
close all

%--------parameters for prophylaxis-------
% susceptible bacteria growth rate
p.r = 0.75;
% total bacteria carrying capacity
p.Kc = 1e10;
% nonlinear adsorption rate of phage:
p.phi = 5.4e-8;
% power law exponent in phage infection:
p.g = 0.6;
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

%----------------------------------------
% prophylaxic case - phage added 4 days before infection
Bo = 0;
Po = 7.4e9;
% Po = 0;
Io = 2.7e6;
tspan = 0:96;
y0 = [Bo;Po;Io];

% simulating diff eq
options = odeset('Events',@myEventsFcn);
[t1,y1] = ode45(@hmODE,tspan,y0,options,p);

%----------------------------------------
% Add bacteria

B = 7.4e7;
P = y1(end,2);
I = y1(end,3);
tspan2 = 96:168;
yi = [B;P;I];

% simulating diff eq
[t2,y2] = ode45(@hmODE,tspan2,yi,options,p);

%----------------------------------------
% continue simulation after bacteria dies

check = 0;
currentTime = t2(end);
if currentTime < 167 % Bacterial pop died before end of simulation
    check = 1;
    B2 = y2(end,1);
    if B2 <= 1
        B2 = 0;
    end
    P2 = y2(end,2);
    I2 = y2(end,3);
    tspan3 = currentTime:167;
    yii = [B2;P2;I2];

    % simulating diff eq
    [t3,y3] = ode45(@hmODE,tspan3,yii,options,p);
end
if check == 1
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
Pvector = [0 171 169]./255;
Ivector = [159 0 197]./255;

figure(1)
semilogy(time,y(:,1),'Color', Bvector, 'Linewidth',2);
hold on;
semilogy(time,y(:,2),'LineStyle','--','Color', Pvector,'Linewidth',2)
semilogy(time,y(:,3),'LineStyle','--','Color', Ivector,'Linewidth',2)

%-----------------------------------------------------
xlabel('Days post infection', 'FontSize', 16,'fontweight','bold')
set(gca,'XTick',[-4:1:3])
ylabel('Density (g^{-1})', 'FontSize', 16,'fontweight','bold')
h = findobj('Color',Bvector);
g = findobj('Color',Pvector);
i = findobj('Color',Ivector);
if Po ~= 0
    % Legend for condition with phage treatment
    v = [g(1) i(1) h(1)];
    h_leg = legend(v, 'phages','host immunity','sensitive-bacteria','Location','southwest');
else
    % Legend for condition with phage treatment
    v = [i(1) h(1)];
    h_leg = legend(v,  'host immunity','sensitive-bacteria','Location','southwest');
end
axis([-4,3,1e0,1e15])
legend boxoff
set(gca,'FontSize',16,'fontweight','bold')
set(gca, 'Units','inches','Position',[1 1 3 2.5])
set(h_leg, 'FontSize',11,'fontweight','normal')
set(gcf,'PaperPositionMode','manual','PaperPosition',[0.25 2.5 8 6],'PaperUnits','inches')
% 
%  saveas(gcf, 'HM_prophylaxis', 'fig')
%  saveas(gcf,'HM_prophylaxis','epsc')
