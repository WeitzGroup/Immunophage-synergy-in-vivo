% Code to simulate resistance heterogeneous mixing model (ODE)
% Neutropenia 
% Phage added two hours after infection
% Dependencies: (1) hmODE.m (2) simHM.m (3) myEventsFcn.m

clear
clc
close all

% Neutropenia parameters:
Ki = 2.4e7;
Io = 0;
B = 7.4e5;
%P = 7.4e6; % phage treatment
 P = 0; % no phage treatment

[y, TB, time] = simHM(Ki,Io,B,P);

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

%-----------------------------------------------------
xlabel('Hours post infection', 'FontSize', 16,'fontweight','bold')
set(gca,'XTick',[0:12:72])
ylabel('Density (g^{-1})', 'FontSize', 16,'fontweight','bold')
h = findobj('Color',Bvector);
g = findobj('Color',Pvector);
if P ~= 0
    % Legend for condition with phage treatment
    v = [g(1) h(1)];
    h_leg = legend(v, 'phages','sensitive-bacteria','Location','southeast');
else
    % Legend for condition with phage treatment
    v = [h(1)];
    h_leg = legend(v,'sensitive-bacteria','Location','southeast');
end
axis([0,72,1e0,1e15])
legend boxoff
set(gca,'FontSize',16,'fontweight','bold')
set(gca, 'Units','inches','Position',[1 1 3 2.5])
set(h_leg, 'FontSize',11,'fontweight','normal')
set(gcf,'PaperPositionMode','manual','PaperPosition',[0.25 2.5 8 6],'PaperUnits','inches')
% 
% saveas(gcf, 'neutropenia_no_phage', 'fig')
% saveas(gcf,'neutropenia_no_phage','epsc')
