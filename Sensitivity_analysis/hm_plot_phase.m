%% Plotting the phase diagrams
% Setting plot format
    lwidth=3; lbsize=16;
    xticklabels=min(pexp_range):0.05:max(pexp_range);
    yticklabels=[min(phi_range) (0.2:0.2:1).*max(phi_range)];
    xticks = linspace(1, size(isext(:,:,1), 2), numel(xticklabels));
    yticks = linspace(1, size(isext(:,:,1), 1), numel(yticklabels));
    set(0,'DefaultTextInterpreter', 'latex')
    set(0,'DefaultLineLinewidth',lwidth)
    set(0,'DefaultAxesLinewidth',lwidth)
    %set(0,'DefaultAxesFontSize',tlbsize)
    set(0, 'DefaultAxesFontName', 'Arial')
    set(0,'DefaultFigurePaperPositionMode','manual')
    set(0,'DefaultFigurePaperPosition',[0.25 2.5 8 6])
    set(0,'DefaultFigurePaperUnits','inches')
    
    % Densities below extinction threshold are lumped together
    Bmin(Bmin<1)=1;
    Bmax(Bmax<1)=1;
    
    % Min bacteria density, phage only
    figure(1)
    imagesc(log10(Bmin(:,:,1))); 
    xlabel('$\gamma$'); ylabel('$\tilde{\phi}$ [(g/PFU)$^{\gamma}$h$^{-1}$]');
    set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
    set(gca, 'YTick', yticks, 'YTickLabel', yticklabels, 'YDir', 'normal')
    set(gca,'FontSize',lbsize,'fontweight','bold')
    set(gca, 'Units','inches','Position',[1 1 3.5 2.5])
    colormap parula;
    hcb=colorbar;
    title(hcb,'log(B)');
    %savefig('HM_Bmin_BP')
    %print('HM_Bmin_BP.eps','-depsc')

    % Min bacteria density, phage-immune
    figure(2)
    imagesc(log10(Bmin(:,:,2))); 
    xlabel('$\gamma$'); ylabel('$\tilde{\phi}$ [(g/PFU)$^{\gamma}$h$^{-1}$]');
    set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
    set(gca, 'YTick', yticks, 'YTickLabel', yticklabels, 'YDir', 'normal')
    set(gca,'FontSize',lbsize,'fontweight','bold')
    set(gca, 'Units','inches','Position',[1 1 3.5 2.5])
    colormap parula;
    hcb=colorbar;
    title(hcb,'log(B)');
    %savefig('HM_Bmin_BPI')
    %print('HM_Bmin_BPI.eps','-depsc')
    
    % Phase diagram of different regimes: phage sufficient (blue),
    % phage-immune synergistic (white) and phage-immune insufficient
    % (black)
    % Define color map
    c3_map=[0, 0, 0
    1, 1, 1
    0, 0, 1];
    figure(3)
    imagesc(syn); 
    xlabel('$\gamma$'); ylabel('$\tilde{\phi}$ [(g/PFU)$^{\gamma}$h$^{-1}$]');
    set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
    set(gca, 'YTick', yticks, 'YTickLabel', yticklabels, 'YDir', 'normal')
    set(gca,'FontSize',lbsize,'fontweight','bold')
    set(gca, 'Units','inches','Position',[1 1 3 2.5])
    colormap(c3_map);
    %hcb=colorbar;
    %savefig('HM_regime')
    %print('HM_regime.eps','-depsc')