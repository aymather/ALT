% ALT ANALYSIS

clear;clc

disp('Welcome to the analysis!');
response_1 = input('Would you like to print blockwise graphs?: ');
response_2 = input('Would you like to print overall graphs?: ');

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

% -- MAKE DATA GRAPHS -- %
if response_1 == 1
    
    % preassign
    rt_values = []; rt_errors = [];
    miss_values = []; miss_errors = [];
    errors_values = []; errors_errors = [];
    succstop_values = []; succstop_errors = [];
    failstop_values = []; failstop_errors = [];

    for ib = 1:blocks

        rt_values = [rt_values; RESULTS.BLOCKWISE.RT.stan(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RT.odd_v(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RT.odd_a(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RT.odd_h(length(filenames)+1,ib)];
        
        rt_errors = [rt_errors; RESULTS.BLOCKWISE.RT.stan(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RT.odd_v(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RT.odd_a(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RT.odd_h(length(filenames)+2,ib)];
        
        miss_values = [miss_values; RESULTS.BLOCKWISE.RATE.MISS.stan(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.MISS.odd_v(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.MISS.odd_a(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.MISS.odd_h(length(filenames)+1,ib)];
        
        miss_errors = [miss_errors; RESULTS.BLOCKWISE.RATE.MISS.stan(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.MISS.odd_v(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.MISS.odd_a(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.MISS.odd_h(length(filenames)+2,ib)];
        
        succstop_values = [succstop_values; RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(length(filenames)+1,ib)];
        
        succstop_errors = [succstop_errors; RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(length(filenames)+2,ib)];
        
        failstop_values = [failstop_values; RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(length(filenames)+1,ib)];
        
        failstop_errors = [failstop_errors; RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(length(filenames)+2,ib)];
        
        errors_values = [errors_values; RESULTS.BLOCKWISE.RATE.ERROR.stan(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.ERROR.odd_v(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.ERROR.odd_a(length(filenames)+1,ib), ...
            RESULTS.BLOCKWISE.RATE.ERROR.odd_h(length(filenames)+1,ib)];
        
        errors_errors = [errors_errors; RESULTS.BLOCKWISE.RATE.ERROR.stan(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.ERROR.odd_v(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.ERROR.odd_a(length(filenames)+2,ib), ...
            RESULTS.BLOCKWISE.RATE.ERROR.odd_h(length(filenames)+2,ib)];

    end
    
    % -- GRAPH STYLE SHEET -- %
    leg = {'Standard', 'Visual', 'Auditory', 'Haptic'};
    xlab = 'Block';
    ylab = 'RT (ms)';
    
    title_ = 'RT';
    lim = 350;
    graph_it(title_, leg, lim, xlab, ylab, rt_values, rt_errors);
    
    title_ = 'Errors';
    ylab = '%';
    lim = 8;
    graph_it(title_, leg, lim, xlab, ylab, errors_values, errors_errors);
    
    title_ = 'Succstop';
    lim = 100;
    graph_it(title_, leg, lim, xlab, ylab, succstop_values, succstop_errors);
    
    title_ = 'Miss';
    lim = 50;
    graph_it(title_, leg, lim, xlab, ylab, miss_values, miss_errors);

end

if response_2 == 1
    
    % RT
    rt_values = [RESULTS.OVERALL(length(filenames)+1,2), ...
        RESULTS.OVERALL(length(filenames)+1,3), ...
        RESULTS.OVERALL(length(filenames)+1,4), ...
        RESULTS.OVERALL(length(filenames)+1,5),];
    
    rt_errors = [RESULTS.OVERALL(length(filenames)+2,2), ...
        RESULTS.OVERALL(length(filenames)+2,3), ...
        RESULTS.OVERALL(length(filenames)+2,4), ...
        RESULTS.OVERALL(length(filenames)+2,5),];
    
    % Errors
    errors_values = [RESULTS.OVERALL(length(filenames)+1,6), ...
        RESULTS.OVERALL(length(filenames)+1,7), ...
        RESULTS.OVERALL(length(filenames)+1,8), ...
        RESULTS.OVERALL(length(filenames)+1,9),];
    
    errors_errors = [RESULTS.OVERALL(length(filenames)+2,6), ...
        RESULTS.OVERALL(length(filenames)+2,7), ...
        RESULTS.OVERALL(length(filenames)+2,8), ...
        RESULTS.OVERALL(length(filenames)+2,9),];
    
    % Miss
    miss_values = [RESULTS.OVERALL(length(filenames)+1,10), ...
        RESULTS.OVERALL(length(filenames)+1,11), ...
        RESULTS.OVERALL(length(filenames)+1,12), ...
        RESULTS.OVERALL(length(filenames)+1,13),];
    
    miss_errors = [RESULTS.OVERALL(length(filenames)+2,10), ...
        RESULTS.OVERALL(length(filenames)+2,11), ...
        RESULTS.OVERALL(length(filenames)+2,12), ...
        RESULTS.OVERALL(length(filenames)+2,13),];
    
    % Failstop
    failstop_values = [RESULTS.OVERALL(length(filenames)+1,14), ...
        RESULTS.OVERALL(length(filenames)+1,15), ...
        RESULTS.OVERALL(length(filenames)+1,16), ...
        RESULTS.OVERALL(length(filenames)+1,17),];
    
    failstop_errors = [RESULTS.OVERALL(length(filenames)+2,14), ...
        RESULTS.OVERALL(length(filenames)+2,15), ...
        RESULTS.OVERALL(length(filenames)+2,16), ...
        RESULTS.OVERALL(length(filenames)+2,17),];
    
    % Succstop
    succstop_values = [RESULTS.OVERALL(length(filenames)+1,22), ...
        RESULTS.OVERALL(length(filenames)+1,23), ...
        RESULTS.OVERALL(length(filenames)+1,24), ...
        RESULTS.OVERALL(length(filenames)+1,25),];
    
    succstop_errors = [RESULTS.OVERALL(length(filenames)+2,22), ...
        RESULTS.OVERALL(length(filenames)+2,23), ...
        RESULTS.OVERALL(length(filenames)+2,24), ...
        RESULTS.OVERALL(length(filenames)+2,25),];
    
    
    % -- GRAPH STYLE SHEET -- %
    leg = {'Standard', 'Visual', 'Auditory', 'Haptic'};
    ylab = 'RT (ms)';
    xlab = '';
    
    title_ = 'RT';
    lim = 350;
    graph_it(title_, leg, lim, xlab, ylab, rt_values, rt_errors);
    
    title_ = 'Errors';
    ylab = '%';
    lim = 8;
    graph_it(title_, leg, lim, xlab, ylab, errors_values, errors_errors);
    
    title_ = 'Succstop';
    lim = 100;
    graph_it(title_, leg, lim, xlab, ylab, succstop_values, succstop_errors);
    
    title_ = 'Miss';
    lim = 50;
    graph_it(title_, leg, lim, xlab, ylab, miss_values, miss_errors);
    
end
% clearvars -except RESULTS outfolder outfile

save(fullfile(outfolder,outfile),'RESULTS');


































