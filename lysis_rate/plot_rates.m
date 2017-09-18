%% Plotting lysis rates of phage in linear, HM and PS models
    lwidth=3; lbsize=25; tlbsize=20; 
    set(0,'DefaultLineLinewidth',lwidth)
    set(0,'DefaultAxesLinewidth',lwidth)
    set(0,'DefaultAxesFontSize',tlbsize)
    phi=5.4e-8; KC=8.5e11; gamma=0.6; PC=1.5e7; 
    Prange=0:1e7:1e9;
    xtick=0:2e8:1e9;
    
    % Linear model
    figure(1);
    plot(Prange,phi.*Prange,'-k');
    xlabel('P (PFU/g)','FontSize',lbsize)
    ylabel('F(P) (h^{-1})','FontSize',lbsize)
    set(gca,'Xtick',xtick);
    %saveas(gcf,'lin_rate.fig')
    %print('lin_rate.eps','-depsc')
    
    % HM model
    figure(2);
    plot(Prange,phi.*Prange.^gamma,'-k');
    xlabel('P (PFU/g)','FontSize',lbsize)
    ylabel('F(P) (h^{-1})','FontSize',lbsize)
    set(gca,'Xtick',xtick);
    %saveas(gcf,'HM_rate.fig')
    %print('HM_rate.eps','-depsc')
    
    % PS model
    figure(3);
    plot(Prange,phi.*Prange./(1+Prange./PC),'-k');
    xlabel('P (PFU/g)','FontSize',lbsize)
    ylabel('F(P) (h^{-1})','FontSize',lbsize)
    set(gca,'Xtick',xtick);
    %saveas(gcf,'PS_rate.fig')
    %print('PS_rate.eps','-depsc')