% This code simulates the HM model with different combinations of the
% parameters \gamma and \tilde{\phi}. The minimum bacteria density 
% within 72h (duration of experiment) is then computed.
% The parameter space of the phage sufficient, phage-immune synergistic and
% phage-immune insufficient regimes are then identified based on bacterial
% extinction in the absence and presence of innate immunity.

curfold=pwd;
close all;
clear all;

%% Initialize parameters
TT=72; % Length of time series after bacteria innoculation (h)
TT0=2; % Time of phage administration (h)
tstep=0.1; % Time step (h)
Tall=0:tstep:TT; % All time points
ntime=int64(1+TT/tstep); % Total number of time points
ptime=int64(1+TT0/tstep); % Time point to add phage

curfold=pwd;
para=struct('r',[],'KC',[],'KD',[],'phi',[],'beta',[],'omg',[], ...
    'eps',[],'alpha',[],'KI',[],'KN',[],'thres',[],'pexp',[]);

% Threshold below which extinction is assumed
para.thres=1; % (g^-1)

% Bacteria parameters
para.r=0.75; % Max growth rate of bacteria (h^-1)
para.KC=8.5e11; % Carrying capacity of bacteria (CFU/g)
para.KD=4.1e7; % Bacteria conc. at which immune response is half as effective (CFU/g)
bpop0=7.4e7; % Initial bacteria conc. (CFU/g)

% Virus parameters
para.omg=0.07; % Decay rate of phage (h^-1)
para.beta=100; % Burst size of phage
vpop0=7.4e8; % Initial phage conc. (PFU/g) in "curative" treatment

% Immune response parameters
para.eps=8.2e-8; % Killing rate parameter of immune response (g/(h cell))
para.alpha=0.97; % Max growth rate of immune response (h^-1)
para.KI=2.4e7; % Max capacity of immune response (cell/g)
para.KN=1e7; % Bacteria conc. when immune response growth rate is half its max (CFU/g)
imm0=2.7e6; % Initial immune response (cell/g)

% Define model variables time series
bpop=zeros(ptime,1); % Bacteria population
vpop=zeros(ptime,1); % Phage population
imm=zeros(ptime,1); % Immune population

% Range of phi and gamma to test
phi_range=(0.1:0.1:10).*1e-8; % Range of nonlinear adsorption rate ((g/PFU)^gamma h^-1)
pexp_range=0.5:0.01:0.7; % Range of gamma exponent

phi_len=length(phi_range);
pexp_len=length(pexp_range);

% Binary output for whether bacteria extinction occured: 1 for extinction,
% 0 for no extinction
isext=zeros(phi_len,pexp_len,2);
% Time of extinction if applicable, otherwise 0
Text=zeros(phi_len,pexp_len,2);
% Min bacterial density
Bmin=zeros(phi_len,pexp_len,2);
% Time attaining min bacterial density
Tmin=zeros(phi_len,pexp_len,2);
% Max bacterial density
Bmax=zeros(phi_len,pexp_len,2);
% Time attaining max bacterial density
Tmax=zeros(phi_len,pexp_len,2);
% Matrix identifying the regimes: phage sufficient (1), phage-immune
% synergistic (0), and phage-immune insufficient (-1)
syn=zeros(phi_len,pexp_len);

% Initial conditions for (i) phage only and (ii) phage-immune combined
pop0_sub=[[bpop0 0 0];[bpop0 0 imm0]];

vpop0_sub=[vpop0 vpop0];

% Setting up ODE simulation
    rel_tol=1e-8;
    abs_tol=1e-10;
    options0= odeset('RelTol',rel_tol,'AbsTol',abs_tol);
    options = odeset('RelTol',rel_tol,'AbsTol',abs_tol,'Events',@myEventsFcn);
tic

% Looping through phi
for iphi=1:phi_len
    para.phi=phi_range(iphi);

% Looping through gamma exponent
for ipexp=1:pexp_len
    para.pexp=pexp_range(ipexp);
    infect_red=@(t,y)hm_infection_immune(t,y,para);

% Looping through the two sets of initial conditions
for initial=1:2

    % Initial conditions
    pop0=pop0_sub(initial,:);
    vpop1=vpop0_sub(initial);

% Solving the set of ODEs
    % T=0 to T=2h (time when phage is added)
    [T0,Y] = ode45(infect_red,[0:tstep:TT0],transpose(pop0),options0);
    bpop=Y(:,1);
    vpop=Y(:,2);
    vpop(ptime)=vpop(ptime)+vpop1;
    imm=Y(:,3);
    pop1=[bpop(ptime),vpop(ptime),imm(ptime)];

    % T=2h to T=72h (end of experiment)
    [T1,Y] = ode45(infect_red,[TT0:tstep:TT],transpose(pop1),options);
    bpop=[bpop; Y(2:end,1)];
    T=[T0; T1(2:end)];

    % Output results
    isext(iphi,ipexp,initial)=bpop(end)<=1;
    Text(iphi,ipexp,initial)=T(end);
    [Bmin(iphi,ipexp,initial),imin]=min(bpop);
    Tmin(iphi,ipexp,initial)=T(imin);
    [Bmax(iphi,ipexp,initial),imax]=max(bpop);
    Tmax(iphi,ipexp,initial)=T(imax);
end
end
end
toc
Text(isext==0)=0;
syn(isext(:,:,2)==0)=-1; % Phage+immune do not clear bacteria: phage-immune insufficient
syn(isext(:,:,1)==1)=1; % Phage by itself clears bacteria: phage sufficient
% Otherwise, syn=0 for phage-immune synergy

% Plotting the figures
run('hm_plot_phase')

