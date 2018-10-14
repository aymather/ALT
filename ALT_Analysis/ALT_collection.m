% ALT Collection

% COLUMNS
id = ALT_columns;

% FOLDERS
infolder = '/Users/alecmather/Desktop/Wessellab/MATLAB/ALT_Final/collection_out/';
outfolder = '/Users/alecmather/Desktop/Wessellab/MATLAB/ALT_Final/Data/';
clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));
outfile = ['Analysis_' date '_' hrs '_' mins '_' '.mat'];

% FILES
files = dir(fullfile(infolder,'*.mat'));
filenames = {files.name};

collect.failstop.odd_v = []; collect.failstop.odd_h = []; collect.failstop.odd_a = []; collect.failstop.stan = [];
collect.miss.odd_v = []; collect.miss.odd_h = []; collect.miss.odd_a = []; collect.miss.stan = [];
collect.succstop.odd_v = []; collect.succstop.odd_h = []; collect.succstop.odd_a = []; collect.succstop.stan = [];
collect.error.odd_v = []; collect.error.odd_h = []; collect.error.odd_a = []; collect.error.stan = [];
collect.rt.odd_v = []; collect.rt.odd_h = []; collect.rt.odd_a = []; collect.rt.stan = [];

for is = 1:length(filenames)
    
    load(fullfile(infolder,filenames{is}));
    
    % RT collection
    collect.rt.odd_v = [collect.rt.odd_v; trialseq(trialseq(:,id.acc) == 1 & trialseq(:,id.nov_v) == 1,:)];
    collect.rt.odd_a = [collect.rt.odd_a; trialseq(trialseq(:,id.acc) == 1 & trialseq(:,id.nov_a) == 1,:)];
    collect.rt.odd_h = [collect.rt.odd_h; trialseq(trialseq(:,id.acc) == 1 & trialseq(:,id.nov_h) == 1,:)];
    collect.rt.stan = [collect.rt.stan; trialseq(trialseq(:,id.acc) == 1 & trialseq(:,id.nov_v) == 0 & trialseq(:,id.nov_a) == 0 & trialseq(:,id.nov_h) == 0,:)];
    
    % FAILSTOP collection
    collect.failstop.odd_v = [collect.failstop.odd_v; trialseq(trialseq(:,id.acc) == 3 & trialseq(:,id.nov_v) == 1,:)];
    collect.failstop.odd_a = [collect.failstop.odd_a; trialseq(trialseq(:,id.acc) == 3 & trialseq(:,id.nov_a) == 1,:)];
    collect.failstop.odd_h = [collect.failstop.odd_h; trialseq(trialseq(:,id.acc) == 3 & trialseq(:,id.nov_h) == 1,:)];
    collect.failstop.stan = [collect.failstop.stan; trialseq(trialseq(:,id.acc) == 3 & trialseq(:,id.nov_v) == 0 & trialseq(:,id.nov_a) == 0 & trialseq(:,id.nov_h) == 0,:)];
    
    % MISS collection
    collect.miss.odd_v = [collect.miss.odd_v; trialseq(trialseq(:,id.acc) == 99 & trialseq(:,id.nov_v) == 1,:)];
    collect.miss.odd_a = [collect.miss.odd_a; trialseq(trialseq(:,id.acc) == 99 & trialseq(:,id.nov_a) == 1,:)];
    collect.miss.odd_h = [collect.miss.odd_h; trialseq(trialseq(:,id.acc) == 99 & trialseq(:,id.nov_h) == 1,:)];
    collect.miss.stan = [collect.miss.stan; trialseq(trialseq(:,id.acc) == 99 & trialseq(:,id.nov_v) == 0 & trialseq(:,id.nov_a) == 0 & trialseq(:,id.nov_h) == 0,:)];
    
    % SUCCSTOP collection
    collect.succstop.odd_v = [collect.succstop.odd_v; trialseq(trialseq(:,id.acc) == 5 & trialseq(:,id.nov_v) == 1,:)];
    collect.succstop.odd_a = [collect.succstop.odd_a; trialseq(trialseq(:,id.acc) == 5 & trialseq(:,id.nov_a) == 1,:)];
    collect.succstop.odd_h = [collect.succstop.odd_h; trialseq(trialseq(:,id.acc) == 5 & trialseq(:,id.nov_h) == 1,:)];
    collect.succstop.stan = [collect.succstop.stan; trialseq(trialseq(:,id.acc) == 5 & trialseq(:,id.nov_v) == 0 & trialseq(:,id.nov_a) == 0 & trialseq(:,id.nov_h) == 0,:)];
    
    % ERROR collection
    collect.error.odd_v = [collect.error.odd_v; trialseq(trialseq(:,id.acc) == 2 & trialseq(:,id.nov_v) == 1,:)];
    collect.error.odd_a = [collect.error.odd_a; trialseq(trialseq(:,id.acc) == 2 & trialseq(:,id.nov_a) == 1,:)];
    collect.error.odd_h = [collect.error.odd_h; trialseq(trialseq(:,id.acc) == 2 & trialseq(:,id.nov_h) == 1,:)];
    collect.error.stan = [collect.error.stan; trialseq(trialseq(:,id.acc) == 2 & trialseq(:,id.nov_v) == 0 & trialseq(:,id.nov_a) == 0 & trialseq(:,id.nov_h) == 0,:)];
    
end

save(fullfile(outfolder,outfile),'collect');



















