% This code generates all the model-related non-schematic figures in the
% paper Roach et al., Immunophage synergy is essential for eradicating pathogens 
% that provoke acute respiratory infections, Cell Host & Microbe, 2017.

clear
clc
close all

%% Main figures

% Fig. 2
%Caption: Phage therapy eliminates bacteria in mathematical models of 
% phage therapy in immunocompetent host. (A) Schematic diagram of models 
% with host immunity (I), bacteria (B) and phages (P) interactions accounting
% for heterogeneous mixing (HM) or phage saturation (PS), which differ only 
% in the phage lysis rate. Phages are assumed to be cleared at a constant rate. 
% Simulated bacteria, phage and immune densities with (B) HM or (C) PS parameters. 
% (D) Schematic diagram of heterogeneous mixing-resistance (HM-R) or 
% phage saturation-resistance (PS-R) models with the addition of 
% phage-resistant mutants as a subpopulation of target bacteria. 
% The dotted compartment denotes the total bacterial population, 
% which is the sum of the sensitive (S) and resistant (R) subpopulations. 
% Predicted population densities with (E) HM-R or (F) PS-R models. 
% All simulations predict phage-sensitive and phage-resistant bacterial 
% elimination during phage therapy in hosts with a fully functioning 
% innate immune response. See Table S1 for in silico simulation parameters.

% Fig. 2B
run('Time_series/HM_model/HM_WT.m')
saveas(gcf, [pwd '/figs/Fig2B'], 'fig')
saveas(gcf,[pwd '/figs/Fig2B'],'epsc')
clear

%Fig. 2C
run('Time_series/PS_model/PS_WT.m')
saveas(gcf, [pwd '/figs/Fig2C'], 'fig')
saveas(gcf,[pwd '/figs/Fig2C'],'epsc')
clear

%Fig. 2E
run('Time_series/HM-R_model/RHM_WT.m')
saveas(gcf, [pwd '/figs/Fig2E'], 'fig')
saveas(gcf,[pwd '/figs/Fig2E'],'epsc')
clear

%Fig. 2F
run('Time_series/PS-R_model/RPS_WT.m')
saveas(gcf, [pwd '/figs/Fig2F'], 'fig')
saveas(gcf,[pwd '/figs/Fig2F'],'epsc')
clear

% Fig. 3
% Caption: Phage therapy is inefficient in the innate immunity activation 
% deficient host. (A) Myeloid differentiation primary response 
% gene 88 deficient mice (MyD88-/-) had a 15% survival probability of 
% acute respiratory infection by Pseudomonas aeruginosa (105 CFU) when 
% inhaled monophage therapy (MOI of 10) was given at 2h post infection 
% compared to saline-mock treated (n=15 per group). In contrast, 
% wild-type mice recovered from the 105 CFU challenge without phage treatment 
% (B) Colonization pattern of the bioluminescent pathogen in the mouse lungs 
% plotted as mean radiance (p/s2/cm2/sr) over time to indicate phage 
% antibacterial activity by a brief reduction in bacterial load followed by
% outgrowth of phage-resistant clone post infection. Arrow marks treatment point; 
% in vivo radiance limit of detection (LOD); error bars indicate SEM. 
% [* p< 0.05; *** p< 0.001] (C) Heterogeneous mixing (HM-R) and 
% (D) phage saturation (PS-R) model simulations of hosts lacking innate immunity 
% activation and the effect on phage-sensitive and phage-resistant bacterial 
% densities during phage treatment. Both models predict that phage-resistant 
% bacteria outgrowth replaces the sensitive population. 
% (E) HM-R model prediction of the level of innate immune activation 
% relative to immunocompetent hosts needed to eliminate phage-resistant 
% bacterial outgrowth and restore phage therapy efficacy in this setting. 
% The curves show the sum of sensitive and resistant bacterial densities. 
% See Table S1 for in silico simulation parameters.

% Fig. 3C
run('Time_series/HM-R_model/RHM_myd88.m')
saveas(gcf, [pwd '/figs/Fig3C'], 'fig')
saveas(gcf,[pwd '/figs/Fig3C'],'epsc')
clear

% Fig. 3D
run('Time_series/PS-R_model/RPS_myd88.m')
saveas(gcf, [pwd '/figs/Fig3D'], 'fig')
saveas(gcf,[pwd '/figs/Fig3D'],'epsc')
clear

% Fig. 3E
run('Time_series/HM-R_model/RHM_myd88_intermediates.m')
saveas(gcf, [pwd '/figs/Fig3E'], 'fig')
saveas(gcf,[pwd '/figs/Fig3E'],'epsc')
clear

% Fig. 5
% Caption: Phage therapy is ineffective in the neutropenic host. Anti-granulocyte 
% receptor-1 (Gr1) monoclonal antibody was used to deplete neutrophils 
% in wild-type mice 24h before an intranasal inoculum of Pseudomonas aeruginosa
% (105 CFU; n=4 per group). After a 2h delay, these neutropenic mice received
% a single dose inhaled monophage therapy (MOI of 10), which was ineffective 
% in preventing fatal pneumonia. (B) Colonization pattern of the bioluminescent
% pathogen in the lungs of live mice plotted as mean radiance (p/s2/cm2/sr) 
% over time showed no indication of phage antibacterial activity. Arrow marks
% treatment point; in vivo radiance limit of detection (LOD); 
% error bars indicate SEM. (C-E) In silico simulations of phage therapy in 
% neutrophil-depleted hosts modeled by setting host innate immune response to zero. 
% Time series of bacteria, phage and immune cell populations from 
% (C) heterogeneous mixing (HM-R) and (D) phage saturation (PS-R) models 
% both predicting a decline of sensitive bacteria over time accompanied by 
% dominance of phage-resistant outgrowth causing phage therapy failure.  
% (E) HM-R model prediction of the level of neutrophil activity relative to 
% healthy hosts required to eliminate phage-resistant bacterial outgrowth and 
% restore phage therapy efficacy in neutropenic hosts. The curves show the 
% total bacterial population densities. See Table S1 for in silico simulation parameters.

% Fig. 5C
run('Time_series/HM-R_model/RHM_neutropenia.m')
saveas(gcf, [pwd '/figs/Fig5C'], 'fig')
saveas(gcf,[pwd '/figs/Fig5C'],'epsc')
clear

% Fig. 5D
run('Time_series/PS-R_model/RPS_neutropenia.m')
saveas(gcf, [pwd '/figs/Fig5D'], 'fig')
saveas(gcf,[pwd '/figs/Fig5D'],'epsc')
clear

% Fig. 5E
run('Time_series/PS-R_model/RPS_neutropenia_intermediates.m')
saveas(gcf, [pwd '/figs/Fig5E'], 'fig')
saveas(gcf,[pwd '/figs/Fig5E'],'epsc')
clear

% Fig. 6
% Caption: Efficient non-immune priming phage prophylaxis in the 
% immunocompetent host. (A) Wild-type mice received a single inhaled 
% monophage dose (109 PFU) which gave prophylaxis for 4d against P. aeruginosa
% (107 CFU; n=6 per group). (B) Luminescence plotted as mean radiance (p/s2/cm2/sr)
% from bacteria over time demonstrates phages maintain antibacterial activity
% after residing in the mouse lungs for 4d. Arrow indicates treatment point; 
% in vivo radiance limit of detection (LOD); error bars indicate SEM. 
% [** p< 0.01; *** p< 0.001] (C) Heterogeneous mixing (HM-R) and 
% (D) phage saturation (PS-R) model simulations of phage prophylaxis in 
% immunocompetent hosts both predict that a slow decay of phage density would 
% occur before the phage outgrowth following bacterial inoculation, which 
% leads to bacterial burden elimination. See Table S1 for in silico simulation 
% parameters. (E) Differential production of cytokines in mouse lung tissues 
% after exposure to 10 µg P. aeruginosa LPS, PBS, or phages (109 PFU) suggests
% that significant priming of host immunity by phage PAK_P1 does not occur. 
% However, IFN? and TNF? production was significantly lower in phage exposed 
% compared to PBS exposed lungs [Welches t-test; p< 0.05]. For values see Fig. S7.

% Fig. 6C
run('Time_series/HM-R_model/RHM_sim_prophylaxis.m')
saveas(gcf, [pwd '/figs/Fig6C'], 'fig')
saveas(gcf,[pwd '/figs/Fig6C'],'epsc')
clear

% Fig. 6D
run('Time_series/PS-R_model/RPS_sim_prophylaxis.m')
saveas(gcf, [pwd '/figs/Fig6D'], 'fig')
saveas(gcf,[pwd '/figs/Fig6D'],'epsc')
clear

%% Supplementary figures

% Fig. S2
% Caption: In silico simulations of phage and bacterial densities for the 
% linear phage lysis rate model, and sensitivity analysis of the 
% heterogeneous mixing (HM) and phage saturation (PS) models, 
% Related to Figure 2. Effect of phage administration in (A) fully functioning 
% host immunity, and (B) in the absence of host immunity from the linear phage 
% lysis model. (C) The functional dependence of the per-capita phage lysis rate 
% in the linear model F(P)=?P (see Eq. 1) on phage population density. 
% The initial phage treatment dose and timing correspond to the experimental 
% curative phage therapy (related to Fig. 1). Phage causes extremely rapid 
% elimination of bacteria in this linear model, which is inconsistent with 
% our experimental bacterial infection profile in mouse lungs (Fig. 1C). 
% (D) The power-law dependence of per-capita phage lysis rate F(P) in the HM model 
% (see Eq. 4). Dependence of minimum bacterial density from the HM model 
% within 72h post infection on sublinear adsorption rate ? ? and power-law 
% exponent ? in (E) the absence of innate immunity and (F) immunocompetent host. 
% The bacterial population is assumed to be eliminated when the density 
% drops below 1 CFU/g. (G) Phase diagram showing the phage sufficient (blue), 
% phage-immune synergistic (white) and phage-immune insufficient (black) regimes. 
% (H-K) Same as (D-G) but for the PS model. (H) The per-capita phage lysis rate 
% F(P) is given by a saturating Hill function in the PS model (see Eq. 5). 
% Phage-immune synergism is robust to changes in lysis rate parameters for 
% both models. In the simulations, the carrying capacity of bacteria (K_C) 
% were fixed at 8.5×?10?^11 CFU/g in both immunocompetent and immunodeficient 
% hosts for comparative purposes. See Table S1 for in silico simulation parameters.

% Fig. S2A
run('Time_series/Linear_model/linear_Immune.m')
saveas(gcf, [pwd '/figs/supp/FigS2A'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS2A'],'epsc')
clear

% Fig. S2B
run('Time_series/Linear_model/linear_noImmune.m')
saveas(gcf, [pwd '/figs/supp/FigS2B'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS2B'],'epsc')
clear

close all
% Phage lysis rates of the linear, HM and PS models
run('Lysis_rate/plot_rates.m')
% Fig. S2C
saveas(figure(1), [pwd '/figs/supp/FigS2C'], 'fig')
saveas(figure(1),[pwd '/figs/supp/FigS2C'],'epsc')
% Fig. S2D
saveas(figure(2), [pwd '/figs/supp/FigS2D'], 'fig')
saveas(figure(2),[pwd '/figs/supp/FigS2D'],'epsc')
% Fig. S2H
saveas(figure(3), [pwd '/figs/supp/FigS2H'], 'fig')
saveas(figure(3),[pwd '/figs/supp/FigS2H'],'epsc')
clear
close all

 close all
% Figs. S2E-G
    run('Sensitivity_analysis/HM_phase.m')
% Fig. S2E
    saveas(figure(1), [pwd '/figs/supp/FigS2E'], 'fig')
    saveas(figure(1),[pwd '/figs/supp/FigS2E'],'epsc')
% Fig. S2F
    saveas(figure(2), [pwd '/figs/supp/FigS2F'], 'fig')
    saveas(figure(2),[pwd '/figs/supp/FigS2F'],'epsc')
% Fig. S2G
    saveas(figure(3), [pwd '/figs/supp/FigS2G'], 'fig')
    saveas(figure(3),[pwd '/figs/supp/FigS2G'],'epsc')
    clear
    close all

% Figs. S2I-K
    run('Sensitivity_analysis/PS_phase.m')
% Fig. S2I
    saveas(figure(1), [pwd '/figs/supp/FigS2I'], 'fig')
    saveas(figure(1),[pwd '/figs/supp/FigS2I'],'epsc')
% Fig. S2J
    saveas(figure(2), [pwd '/figs/supp/FigS2J'], 'fig')
    saveas(figure(2),[pwd '/figs/supp/FigS2J'],'epsc')
% Fig. S2K
    saveas(figure(3), [pwd '/figs/supp/FigS2K'], 'fig')
    saveas(figure(3),[pwd '/figs/supp/FigS2K'],'epsc')
    clear
    close all
    
% Fig. S3
% Caption: Control simulations of the mathematical models, 
% Related to Figure 1. (A) Predicted P. aeruginosa population densities 
% in the lungs of immunocompetent mice in the absence of phage therapy and 
% without phage-resistant, or with phage-resistant bacteria emergence and 
% outgrowth (related to Fig. 1).  (B) Predicted bacterial densities in 
% Myd88 deficient hosts without phage resistance, or with resistance. 
% Phage therapy in Myd88 deficient hosts simulated using the 
% heterogeneous mixing (HM) and the phage saturation (PS) models without 
% phage resistance development (related to Fig. 3).  (C) Predicted bacterial 
% densities in neutropenic hosts without phage resistance, or with resistance. 
% Phage therapy in neutropenic hosts simulated using the HM and PS models 
% without phage resistance development (related to Fig. 5). 
% See Table S1 for in silico simulation parameters.

% Fig. S3A1
run('Time_series/Control_no_phage/WT/WT_no_phage.m')
saveas(gcf, [pwd '/figs/supp/FigS3A1'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3A1'],'epsc')
clear
% Fig. S3A2
run('Time_series/Control_no_phage/WT/R_WT_no_phage.m')
saveas(gcf, [pwd '/figs/supp/FigS3A2'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3A2'],'epsc')
clear

% Fig. S3B1
run('Time_series/Control_no_phage/Myd88/Myd88_no_phage.m')
saveas(gcf, [pwd '/figs/supp/FigS3B1'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3B1'],'epsc')
clear
% Fig. S3B2
run('Time_series/Control_no_phage/Myd88/R_Myd88_no_phage.m')
saveas(gcf, [pwd '/figs/supp/FigS3B2'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3B2'],'epsc')
clear
% Fig. S3B3
run('Time_series/HM_model/HM_myd88.m')
saveas(gcf, [pwd '/figs/supp/FigS3B3'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3B3'],'epsc')
clear
% Fig. S3B4
run('Time_series/PS_model/PS_myd88.m')
saveas(gcf, [pwd '/figs/supp/FigS3B4'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3B4'],'epsc')
clear

% Fig. S3C1
run('Time_series/Control_no_phage/neutropenia/neutropenia_no_phage.m')
saveas(gcf, [pwd '/figs/supp/FigS3C1'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3C1'],'epsc')
clear
% Fig. S3C2
run('Time_series/Control_no_phage/neutropenia/R_neutropenia_no_phage.m')
saveas(gcf, [pwd '/figs/supp/FigS3C2'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3C2'],'epsc')
clear
% Fig. S3C3
run('Time_series/HM_model/HM_neutropenia.m')
saveas(gcf, [pwd '/figs/supp/FigS3C3'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3C3'],'epsc')
clear
% Fig. S3C4
run('Time_series/PS_model/PS_neutropenia.m')
saveas(gcf, [pwd '/figs/supp/FigS3C4'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS3C4'],'epsc')
clear

% Fig. S4
% Caption: Simulated time series of restoration of phage therapy efficacy 
% in hosts with partial Myd88 deficiency and reduced neutrophil activity, 
% Related to Figure 3 and 5. Predicted time series of total bacterial densities 
% in hosts with different levels of innate immune activation (i.e. Myd88 deficiency) 
% accounting for (A) the phage saturation with phage resistance (PS-R), 
% (B) phage saturation (PS) without phage resistance, and 
% (C) heterogeneous mixing (HM) without phage resistance. (D-F) Time series 
% of total bacterial densities accounting for different lung neutrophil levels 
% to simulate mild to severe neutropenia in mice (related to Fig.3). 
% (D), (E) and (F) correspond to simulations of HM-R, PS and HM models, 
% respectively (related to Fig.5). See Table S1 for in silico simulation 
% parameters for immunodeficient hosts.

% Fig. S4A
run('Time_series/PS-R_model/RPS_myd88_intermediates.m')
saveas(gcf, [pwd '/figs/supp/FigS4A'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS4A'],'epsc')
clear
% Fig. S4B
run('Time_series/PS_model/PS_myd88_intermediates.m')
saveas(gcf, [pwd '/figs/supp/FigS4B'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS4B'],'epsc')
clear
% Fig. S4C
run('Time_series/HM_model/HM_myd88_intermediates.m')
saveas(gcf, [pwd '/figs/supp/FigS4C'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS4C'],'epsc')
clear

% Fig. S4D
run('Time_series/HM-R_model/RHM_neutropenia_intermediates.m')
saveas(gcf, [pwd '/figs/supp/FigS4D'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS4D'],'epsc')
clear
% Fig. S4E
run('Time_series/PS_model/PS_neutropenia_intermediates.m')
saveas(gcf, [pwd '/figs/supp/FigS4E'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS4E'],'epsc')
clear
% Fig. S4F
run('Time_series/HM_model/HM_neutropenia_intermediates.m')
saveas(gcf, [pwd '/figs/supp/FigS4F'], 'fig')
saveas(gcf,[pwd '/figs/supp/FigS4F'],'epsc')
clear