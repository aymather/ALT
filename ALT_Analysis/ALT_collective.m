% ALT ANALYSIS

clear;clc

disp('Welcome to the analysis!');
input = input('Would you like to print graphs?: ');

% COLUMNS
id = ALT_columns;

% FOLDERS
infolder = '/Users/alecmather/Desktop/Wessellab/MATLAB/ALT_Final/out/';
outfolder = '/Users/alecmather/Desktop/Wessellab/MATLAB/ALT_Final/Data/';
clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));
outfile = ['Analysis_' date '_' hrs '_' mins '_' '.mat'];

% FILES
files = dir(fullfile(infolder,'*.mat'));
filenames = {files.name};

% MAKE DATA TABLES

% OVERALL %
RESULTS.OVERALL = zeros(length(filenames),25);

% BLOCKWISE %
% --------- %
% RT %
RESULTS.BLOCKWISE.RT.stan = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RT.odd_v = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RT.odd_h = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RT.odd_a = zeros(length(filenames)+2,9);

% MISS %
RESULTS.BLOCKWISE.RATE.MISS.stan = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RATE.MISS.odd_v = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RATE.MISS.odd_h = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RATE.MISS.odd_a = zeros(length(filenames)+2,9);

% SUCCSTOP %
RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h = zeros(length(filenames)+2,9);
RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan = zeros(length(filenames)+2,9);

% FAILSTOP %
RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v = zeros(length(filenames),9);
RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a = zeros(length(filenames),9);
RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h = zeros(length(filenames),9);
RESULTS.BLOCKWISE.RATE.FAILSTOP.stan = zeros(length(filenames),9);

% ERROR %
RESULTS.BLOCKWISE.RATE.ERROR.odd_v = zeros(length(filenames),9);
RESULTS.BLOCKWISE.RATE.ERROR.odd_a = zeros(length(filenames),9);
RESULTS.BLOCKWISE.RATE.ERROR.odd_h = zeros(length(filenames),9);
RESULTS.BLOCKWISE.RATE.ERROR.stan = zeros(length(filenames),9);

% Descriptive stats %
RESULTS.DESC = zeros(length(filenames),4);

% PERFORM ANALYSIS ON EACH FILE
for is = 1:length(filenames)
    
   % LOAD
   load(fullfile(infolder,filenames{is}));
   
   % DESCRIPTIVES
   RESULTS.DESC(is,1) = data.nr;
   RESULTS.DESC(is,2) = data.age;
   if strcmpi(data.gender, 'm')
       RESULTS.DESC(is,3) = 1;
   else RESULTS.DESC(is,3) = 2;
   end
   if strcmpi(data.hand, 'r')
       RESULTS.DESC(is,4) = 1;
   else RESULTS.DESC(is,4) = 2;
   end

   % ANALYSIS
   behav = ALT_analysis(trialseq,id);
      
   % WRITE DATA INTO TABLE (OVERALL)
   RESULTS.OVERALL(is,1) = data.nr;
   RESULTS.OVERALL(is,2) = behav.overall.rt.stan;
   RESULTS.OVERALL(is,3) = behav.overall.rt.odd_v;
   RESULTS.OVERALL(is,4) = behav.overall.rt.odd_a;
   RESULTS.OVERALL(is,5) = behav.overall.rt.odd_h;
   RESULTS.OVERALL(is,6) = behav.overall.rate.error.stan;
   RESULTS.OVERALL(is,7) = behav.overall.rate.error.odd_v;
   RESULTS.OVERALL(is,8) = behav.overall.rate.error.odd_a;
   RESULTS.OVERALL(is,9) = behav.overall.rate.error.odd_h;
   RESULTS.OVERALL(is,10) = behav.overall.rate.miss.stan;
   RESULTS.OVERALL(is,11) = behav.overall.rate.miss.odd_v;
   RESULTS.OVERALL(is,12) = behav.overall.rate.miss.odd_a;
   RESULTS.OVERALL(is,13) = behav.overall.rate.miss.odd_h;
   RESULTS.OVERALL(is,14) = behav.overall.rate.failstop.stan;
   RESULTS.OVERALL(is,15) = behav.overall.rate.failstop.odd_v;
   RESULTS.OVERALL(is,16) = behav.overall.rate.failstop.odd_a;
   RESULTS.OVERALL(is,17) = behav.overall.rate.failstop.odd_h;
   RESULTS.OVERALL(is,18) = behav.overall.rate.succstop_postDeadResp.stan;
   RESULTS.OVERALL(is,19) = behav.overall.rate.succstop_postDeadResp.odd_v;
   RESULTS.OVERALL(is,20) = behav.overall.rate.succstop_postDeadResp.odd_a;
   RESULTS.OVERALL(is,21) = behav.overall.rate.succstop_postDeadResp.odd_h;
   RESULTS.OVERALL(is,22) = behav.overall.rate.succstop_true.stan;
   RESULTS.OVERALL(is,23) = behav.overall.rate.succstop_true.odd_v;
   RESULTS.OVERALL(is,24) = behav.overall.rate.succstop_true.odd_a;
   RESULTS.OVERALL(is,25) = behav.overall.rate.succstop_true.odd_h;
   

   % CONTINUED... (BLOCKWISE - overall DATA per block)
   blocks = trialseq(end,id.block);
   for ii = 1:blocks
       
       % Blockwise RT
       eval(['RESULTS.BLOCKWISE.RT.stan(is, ii) = behav.block' num2str(ii) '.rt.stan']);
       eval(['RESULTS.BLOCKWISE.RT.odd_v(is, ii) = behav.block' num2str(ii) '.rt.odd_v']);
       eval(['RESULTS.BLOCKWISE.RT.odd_h(is, ii) = behav.block' num2str(ii) '.rt.odd_h']);
       eval(['RESULTS.BLOCKWISE.RT.odd_a(is, ii) = behav.block' num2str(ii) '.rt.odd_a']);
       
       % Blockwise successful stops
       eval(['RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(is, ii) = behav.block' num2str(ii) '.rate.succstop_true.odd_v']);
       eval(['RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(is, ii) = behav.block' num2str(ii) '.rate.succstop_true.odd_a']);
       eval(['RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(is, ii) = behav.block' num2str(ii) '.rate.succstop_true.odd_h']);
       eval(['RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(is, ii) = behav.block' num2str(ii) '.rate.succstop_true.stan']);
       
       % Blockwise miss rates
       eval(['RESULTS.BLOCKWISE.RATE.MISS.odd_v(is, ii) = behav.block' num2str(ii) '.rate.miss.odd_v']);
       eval(['RESULTS.BLOCKWISE.RATE.MISS.odd_a(is, ii) = behav.block' num2str(ii) '.rate.miss.odd_a']);
       eval(['RESULTS.BLOCKWISE.RATE.MISS.odd_h(is, ii) = behav.block' num2str(ii) '.rate.miss.odd_h']);
       eval(['RESULTS.BLOCKWISE.RATE.MISS.stan(is, ii) = behav.block' num2str(ii) '.rate.miss.stan']);
       
       % Blockwise error rates
       eval(['RESULTS.BLOCKWISE.RATE.ERROR.odd_v(is, ii) = behav.block' num2str(ii) '.rate.error.odd_v']);
       eval(['RESULTS.BLOCKWISE.RATE.ERROR.odd_a(is, ii) = behav.block' num2str(ii) '.rate.error.odd_a']);
       eval(['RESULTS.BLOCKWISE.RATE.ERROR.odd_h(is, ii) = behav.block' num2str(ii) '.rate.error.odd_h']);
       eval(['RESULTS.BLOCKWISE.RATE.ERROR.stan(is, ii) = behav.block' num2str(ii) '.rate.error.stan']);
       
       % Blockwise failstop rates
       eval(['RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(is, ii) = behav.block' num2str(ii) '.rate.failstop.odd_v']);
       eval(['RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(is, ii) = behav.block' num2str(ii) '.rate.failstop.odd_a']);
       eval(['RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(is, ii) = behav.block' num2str(ii) '.rate.failstop.odd_h']);
       eval(['RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(is, ii) = behav.block' num2str(ii) '.rate.failstop.stan']);
       
   end
   
   % Give each blockwise a subject number
   RESULTS.BLOCKWISE.RT.odd_v(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RT.odd_a(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RT.odd_h(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RT.stan(is, blocks + 1) = data.nr;
   
   RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(is, blocks + 1) = data.nr;
   
   RESULTS.BLOCKWISE.RATE.MISS.odd_v(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.MISS.odd_a(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.MISS.odd_h(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.MISS.stan(is, blocks + 1) = data.nr;
   
   RESULTS.BLOCKWISE.RATE.ERROR.odd_v(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.ERROR.odd_a(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.ERROR.odd_h(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.ERROR.stan(is, blocks + 1) = data.nr;
   
   RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(is, blocks + 1) = data.nr;
   RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(is, blocks + 1) = data.nr;
   
end

% Find and place MEAN/SEM -- mean == length(filenames+1) // sem == length(filenames+2)
blocks = trialseq(end,id.block);
for ib = 1:blocks
    
    % RT %
    RESULTS.BLOCKWISE.RT.stan(length(filenames)+1,ib) = nanmean(RESULTS.BLOCKWISE.RT.stan(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RT.stan(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RT.stan(1:length(filenames),ib)) / sqrt(length(filenames));
    
    RESULTS.BLOCKWISE.RT.odd_v(length(filenames)+1,ib) = nanmean(RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RT.odd_v(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RT.odd_a(length(filenames)+1,ib) = nanmean(RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RT.odd_a(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RT.odd_h(length(filenames)+1,ib) = nanmean(RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RT.odd_h(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    % FAILSTOP %
    RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),ib)) / sqrt(length(filenames));
    
    RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),ib)) / sqrt(length(filenames));
    
    % SUCCSTOP %
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),ib)) / sqrt(length(filenames));
    
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),ib)) / sqrt(length(filenames));
    
    % Error %
    RESULTS.BLOCKWISE.RATE.ERROR.odd_v(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.ERROR.odd_v(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),ib)) / sqrt(length(filenames));
    
    RESULTS.BLOCKWISE.RATE.ERROR.odd_a(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.ERROR.odd_a(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RATE.ERROR.odd_h(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.ERROR.odd_h(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),ib)) / sqrt(length(filenames)); 
    
    RESULTS.BLOCKWISE.RATE.ERROR.stan(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.ERROR.stan(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),ib)) / sqrt(length(filenames));
    
    % Miss %
    RESULTS.BLOCKWISE.RATE.MISS.odd_v(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.MISS.odd_v(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),ib)) / sqrt(length(filenames));
    
    RESULTS.BLOCKWISE.RATE.MISS.odd_a(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.MISS.odd_a(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),ib)) / sqrt(length(filenames));
    
    RESULTS.BLOCKWISE.RATE.MISS.odd_h(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.MISS.odd_h(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),ib)) / sqrt(length(filenames));
    
    RESULTS.BLOCKWISE.RATE.MISS.stan(length(filenames)+1,ib) = mean(RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),ib));
    RESULTS.BLOCKWISE.RATE.MISS.stan(length(filenames)+2,ib) = std(RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),ib)) / sqrt(length(filenames));
end

% GET OVERALL SEM's
for ii = 2:size(RESULTS.OVERALL,2)   
    RESULTS.OVERALL(length(filenames)+1, ii) = mean(RESULTS.OVERALL(1:length(filenames),ii));
    RESULTS.OVERALL(length(filenames)+2, ii) = std(RESULTS.OVERALL(1:length(filenames),ii)) / sqrt(length(filenames));   
end

% if response == 1
%     
%     % GET VALUES
%     values = [RESULTS.BLOCKWISE.RT.odd_v(length(filenames) + 1,1:8); RESULTS.BLOCKWISE.RT.odd_a(length(filenames) + 1,1:8); RESULTS.BLOCKWISE.RT.odd_h(length(filenames) + 1,1:8); RESULTS.BLOCKWISE.RT.stan(length(filenames) + 1,1:8);]';
%     errors = [RESULTS.BLOCKWISE.RT.odd_v(length(filenames) + 2,1:8); RESULTS.BLOCKWISE.RT.odd_a(length(filenames) + 2,1:8); RESULTS.BLOCKWISE.RT.odd_h(length(filenames) + 2,1:8); RESULTS.BLOCKWISE.RT.stan(length(filenames) + 2,1:8);]';
% 
%     % MAKE GRAPHS
%     graph = figure('Position',[1 1 1200 400],'PaperPositionMode','auto','Visible','on');
%     graph = bar(values);
%     hold on
%     X = [];
%     for i = 1:length(graph)
%         X = [X; graph(i).XData + graph(i).XOffset];
%     end
%     X = X';
%     EB = errorbar(X,values,errors,'.');
%     legend('Visual', 'Auditory', 'Haptic', 'Standard');
%     xlabel('Block');
%     ylabel('% of Successful Stops');
%     ylim([0 400]);
%     hold off
% 
% end

% -- MAKE DATA GRAPHS -- %
if input == 1
    % preassign
    rt.stan_values = []; rt.visual_values = []; rt.auditory_values = []; rt.haptic_values = [];
    rt.stan_errors = []; rt.visual_errors = []; rt.auditory_errors = []; rt.haptic_errors = [];

    rate.error.stan_values = []; rate.error.visual_values = []; rate.error.auditory_values = []; rate.error.haptic_values = [];
    rate.error.stan_errors = []; rate.error.visual_errors = []; rate.error.auditory_errors = []; rate.error.haptic_errors = [];

    rate.failstop.stan_values = []; rate.failstop.visual_values = []; rate.failstop.auditory_values = []; rate.failstop.haptic_values = [];
    rate.failstop.stan_errors = []; rate.failstop.visual_errors = []; rate.failstop.auditory_errors = []; rate.failstop.haptic_errors = [];

    rate.succstop.stan_values = []; rate.succstop.visual_values = []; rate.succstop.auditory_values = []; rate.succstop.haptic_values = [];
    rate.succstop.stan_errors = []; rate.succstop.visual_errors = []; rate.succstop.auditory_errors = []; rate.succstop.haptic_errors = [];

    rate.miss.stan_values = []; rate.miss.visual_values = []; rate.miss.auditory_values = []; rate.miss.haptic_values = [];
    rate.miss.stan_errors = []; rate.miss.visual_errors = []; rate.miss.auditory_errors = []; rate.miss.haptic_errors = [];

    for it = 1:2:8

        % RT Values
        a = nanmean((RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it+1))/2);
        rt.stan_values = [rt.stan_values,a];
        aa = nanstd((RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rt.stan_errors = [rt.stan_errors, aa];
        b = nanmean((RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it+1))/2);
        rt.visual_values = [rt.visual_values,b];
        bb = nanstd((RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rt.visual_errors = [rt.visual_errors, bb];
        c = nanmean((RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it+1))/2);
        rt.auditory_values = [rt.auditory_values,c];
        cc = nanstd((RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rt.auditory_errors = [rt.auditory_errors, cc];
        d = nanmean((RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it+1))/2);
        rt.haptic_values = [rt.haptic_values,d];
        dd = nanstd((RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rt.haptic_errors = [rt.haptic_errors, dd];

        % ERROR Values
        e = mean((RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it+1))/2);
        rate.error.stan_values = [rate.error.stan_values, e];
        ee = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.error.stan_errors = [rate.error.stan_errors, ee];
        f = mean((RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it+1))/2);
        rate.error.visual_values = [rate.error.visual_values, f];
        ff = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.error.visual_errors = [rate.error.visual_errors, ff];
        g = mean((RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it+1))/2);
        rate.error.auditory_values = [rate.error.auditory_values, g];
        gg = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.error.auditory_errors = [rate.error.auditory_errors, gg];
        h = mean((RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it+1))/2);
        rate.error.haptic_values = [rate.error.haptic_values, h];
        hh = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.error.haptic_errors = [rate.error.haptic_errors, hh];

        % FAILSTOP Values
        i = mean((RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it+1))/2);
        rate.failstop.stan_values = [rate.failstop.stan_values, i];
        ii = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.failstop.stan_errors = [rate.failstop.stan_errors, ii];
        j = mean((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it+1))/2);
        rate.failstop.visual_values = [rate.failstop.visual_values, j];
        jj = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.failstop.visual_errors = [rate.failstop.visual_errors, jj];
        k = mean((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it+1))/2);
        rate.failstop.auditory_values = [rate.failstop.auditory_values, k];
        kk = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.failstop.auditory_errors = [rate.failstop.auditory_errors, kk];
        l = mean((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it+1))/2);
        rate.failstop.haptic_values = [rate.failstop.haptic_values, l];
        ll = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.failstop.haptic_errors = [rate.failstop.haptic_errors, ll];

        % SUCCSTOP Values
        m = mean((RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it+1))/2);
        rate.succstop.stan_values = [rate.succstop.stan_values, m];
        mm = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.succstop.stan_errors = [rate.succstop.stan_errors, mm];
        n = mean((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it+1))/2);
        rate.succstop.visual_values = [rate.succstop.visual_values, n];
        nn = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.succstop.visual_errors = [rate.succstop.visual_errors, nn];
        o = mean((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it+1))/2);
        rate.succstop.auditory_values = [rate.succstop.auditory_values, o];
        oo = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.succstop.auditory_errors = [rate.succstop.auditory_errors, oo];
        p = mean((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it+1))/2);
        rate.succstop.haptic_values = [rate.succstop.haptic_values, p];
        pp = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.succstop.haptic_errors = [rate.succstop.haptic_errors, pp];

        % MISS Values
        q = mean((RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it+1))/2);
        rate.miss.stan_values = [rate.miss.stan_values, q];
        qq = nanstd((RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.miss.stan_errors = [rate.miss.stan_errors, qq];
        r = mean((RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it+1))/2);
        rate.miss.visual_values = [rate.miss.visual_values, r];
        rr = nanstd((RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.miss.visual_errors = [rate.miss.visual_errors, rr];
        s = mean((RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it+1))/2);
        rate.miss.auditory_values = [rate.miss.auditory_values, s];
        ss = nanstd((RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.miss.auditory_errors = [rate.miss.auditory_errors, ss];
        t = mean((RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it+1))/2);
        rate.miss.haptic_values = [rate.miss.haptic_values, t];
        tt = nanstd((RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
        rate.miss.haptic_errors = [rate.miss.haptic_errors, tt];

    end

    graph_it(rt.stan_values, rt.visual_values, rt.auditory_values, rt.haptic_values, rt.stan_errors, rt.visual_errors, rt.auditory_errors, rt.haptic_errors, 400);
    graph_it(rate.error.stan_values, rate.error.visual_values, rate.error.auditory_values, rate.error.haptic_values, rate.error.stan_errors, rate.error.visual_errors, rate.error.auditory_errors, rate.error.haptic_errors, 6);
    graph_it(rate.failstop.stan_values, rate.failstop.visual_values, rate.failstop.auditory_values, rate.failstop.haptic_values, rate.failstop.stan_errors, rate.failstop.visual_errors, rate.failstop.auditory_errors, rate.failstop.haptic_errors, 75);
    graph_it(rate.succstop.stan_values, rate.succstop.visual_values, rate.succstop.auditory_values, rate.succstop.haptic_values, rate.succstop.stan_errors, rate.succstop.visual_errors, rate.succstop.auditory_errors, rate.succstop.haptic_errors, 100);
    graph_it(rate.miss.stan_values, rate.miss.visual_values, rate.miss.auditory_values, rate.miss.haptic_values, rate.miss.stan_errors, rate.miss.visual_errors, rate.miss.auditory_errors, rate.miss.haptic_errors, 40); 
end
% clearvars -except RESULTS outfolder outfile

save(fullfile(outfolder,outfile),'RESULTS');


































