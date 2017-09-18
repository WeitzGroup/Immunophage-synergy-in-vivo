% script to plot intermediate values of Ki and Io 
% neutropenia conditions
% Dependencies: (1) psODE.m (2) simPS.m (3) myEventsFcn.m

clear
clc
close all

% Parameters:
Ki_max = 2.4e7;
I_max = 2.7e6;
Bo = 7.4e5;
Po = 7.4e6;

% Calculate Ki intermediate values: Ki -> Io+(Ki_max - Io)*s
percents = [1.0 0.7 0.5 0.2 0.1 0.01];
Kis = [];
Is = [];
for i=1:length(percents)
    val = Ki_max*percents(i);
    Kis = [Kis val];
    val2 = I_max*percents(i);
    Is = [Is val2];
end

% Run functions to calculate time and total bacteria for each case
[y_100, TB_100, time_100] = simPS(Kis(1), Is(1), Bo, Po);
[y_70, TB_70, time_70] = simPS(Kis(2), Is(2), Bo, Po);
[y_50, TB_50, time_50] = simPS(Kis(3), Is(3), Bo, Po);
[y_20, TB_20, time_20] = simPS(Kis(4), Is(4), Bo, Po);
[y_10, TB_10, time_10] = simPS(Kis(5), Is(5), Bo, Po);
[y_1, TB_1, time_1] = simPS(Kis(6), Is(6), Bo, Po);

% Color vectors for plot lines
line1 = [255 0 0]./255;
line2 = [235 139 86]./255;
line3 = [21 195 90]./255;
line4 = [0 0 255]./255;
line5 = [0 0 0];
line6 = [102 0 51]./255;

% Plot default values
set(0,'DefaultAxesLinewidth',2)
set(0, 'DefaultAxesFontName', 'Arial')

semilogy(time_1,TB_1,'Color', line6,'Linewidth',2);
hold on;
semilogy(time_10,TB_10,'Color', line1,'Linewidth',2);
semilogy(time_20,TB_20,'Color', line2,'Linewidth',2)
semilogy(time_50,TB_50,'Color', line3,'Linewidth',2)
semilogy(time_70,TB_70,'Color', line4,'Linewidth',2)
semilogy(time_100,TB_100,'Color', line5,'Linewidth',2)

xlabel('Hours post infection', 'FontSize', 16,'fontweight','bold')
set(gca,'XTick',[0:24:240])
ylabel('B (CFU/g)', 'FontSize', 16,'fontweight','bold')
h = findobj('Color',line1);
j = findobj('Color',line2);
g = findobj('Color',line3);
i = findobj('Color',line4);
k = findobj('Color',line5);
l = findobj('Color',line6);
v = [l(1) h(1) j(1) g(1) i(1) k(1)];
h_leg = legend(v, '1%','10%', '20%','50%', '70%', '100%','Location','northeast');
axis([0,144,1e0,1e15])
legend boxoff
set(gca,'FontSize',16,'fontweight','bold')
set(gca, 'Units','inches','Position',[1 1 3 2.5])
set(h_leg, 'FontSize',11,'fontweight','normal')
set(gcf,'PaperPositionMode','manual','PaperPosition',[0.25 2.5 8 6],'PaperUnits','inches')

%  saveas(gcf, 'PS_neutropenia_intermediates', 'fig')
%  saveas(gcf,'PS_neutropenia_intermediates','epsc')
