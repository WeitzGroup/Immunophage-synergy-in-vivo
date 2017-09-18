% Code to simulate linear model (ODE)
% Normal Immune Response
% Phage added two hours after infection
% Dependencies: (1) linearODE.m (2) simLinear.m (3) myEventsFcn.m

clear
clc
close all

% Immunocompetence parameters:
Ki = 2.4e7;
Io = 2.7e6;
B = 7.4e7;
P = 7.4e8; % phage treatment
% P = 0; % no phage treatment

[y, TB, time] = simLinear(Ki,Io,B,P);

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
xlabel('Hours post infection', 'FontSize', 16,'fontweight','bold')
set(gca,'XTick',[0:1:5])
ylabel('Density (g^{-1})', 'FontSize', 16,'fontweight','bold')
h = findobj('Color',Bvector);
g = findobj('Color',Pvector);
i = findobj('Color',Ivector); 
if P ~= 0
    % Legend for condition with phage treatment
    v = [i(1) g(1) h(1)];
    h_leg = legend(v, 'host immunity', 'phages','sensitive-bacteria','Location','eastoutside');
else
    % Legend for condition with phage treatment
    v = [i(1) h(1)];
    h_leg = legend(v,'host immunity','sensitive-bacteria','Location','eastoutside');
end
% axis([1.8,2.2,1e0,1e15])
axis([0,5,1e0,1e15])
legend boxoff
set(gca,'FontSize',16,'fontweight','bold')
set(gca, 'Units','inches','Position',[1 1 3 2.5])
set(h_leg, 'FontSize',11,'fontweight','normal')
set(gcf,'PaperPositionMode','manual','PaperPosition',[0.25 2.5 8 6],'PaperUnits','inches')
% 
% saveas(gcf, 'linear_BPI', 'fig')
% saveas(gcf,'linear_BPI','epsc')