% rm_anova1() setup

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
    a = ((RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it+1))/2);
    rt.stan_values = [rt.stan_values,a];
    aa = ((RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rt.stan_errors = [rt.stan_errors, aa];
    b = ((RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it+1))/2);
    rt.visual_values = [rt.visual_values,b];
    bb = ((RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rt.visual_errors = [rt.visual_errors, bb];
    c = ((RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it+1))/2);
    rt.auditory_values = [rt.auditory_values,c];
    cc = ((RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rt.auditory_errors = [rt.auditory_errors, cc];
    d = ((RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it+1))/2);
    rt.haptic_values = [rt.haptic_values,d];
    dd = ((RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rt.haptic_errors = [rt.haptic_errors, dd];
    
    % ERROR Values
    e = ((RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it+1))/2);
    rate.error.stan_values = [rate.error.stan_values, e];
    ee = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.error.stan_errors = [rate.error.stan_errors, ee];
    f = ((RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it+1))/2);
    rate.error.visual_values = [rate.error.visual_values, f];
    ff = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.error.visual_errors = [rate.error.visual_errors, ff];
    g = ((RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it+1))/2);
    rate.error.auditory_values = [rate.error.auditory_values, g];
    gg = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.error.auditory_errors = [rate.error.auditory_errors, gg];
    h = ((RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it+1))/2);
    rate.error.haptic_values = [rate.error.haptic_values, h];
    hh = nanstd((RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.error.haptic_errors = [rate.error.haptic_errors, hh];
    
    % FAILSTOP Values
    i = ((RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it+1))/2);
    rate.failstop.stan_values = [rate.failstop.stan_values, i];
    ii = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.failstop.stan_errors = [rate.failstop.stan_errors, ii];
    j = ((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it+1))/2);
    rate.failstop.visual_values = [rate.failstop.visual_values, j];
    jj = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.failstop.visual_errors = [rate.failstop.visual_errors, jj];
    k = ((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it+1))/2);
    rate.failstop.auditory_values = [rate.failstop.auditory_values, k];
    kk = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.failstop.auditory_errors = [rate.failstop.auditory_errors, kk];
    l = ((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it+1))/2);
    rate.failstop.haptic_values = [rate.failstop.haptic_values, l];
    ll = nanstd((RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.FAILSTOP.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.failstop.haptic_errors = [rate.failstop.haptic_errors, ll];
    
    % SUCCSTOP Values
    m = ((RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it+1))/2);
    rate.succstop.stan_values = [rate.succstop.stan_values, m];
    mm = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.succstop.stan_errors = [rate.succstop.stan_errors, mm];
    n = ((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it+1))/2);
    rate.succstop.visual_values = [rate.succstop.visual_values, n];
    nn = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.succstop.visual_errors = [rate.succstop.visual_errors, nn];
    o = ((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it+1))/2);
    rate.succstop.auditory_values = [rate.succstop.auditory_values, o];
    oo = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.succstop.auditory_errors = [rate.succstop.auditory_errors, oo];
    p = ((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it+1))/2);
    rate.succstop.haptic_values = [rate.succstop.haptic_values, p];
    pp = nanstd((RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.succstop.haptic_errors = [rate.succstop.haptic_errors, pp];
    
    % MISS Values
    q = ((RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it+1))/2);
    rate.miss.stan_values = [rate.miss.stan_values, q];
    qq = nanstd((RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.miss.stan_errors = [rate.miss.stan_errors, qq];
    r = ((RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it+1))/2);
    rate.miss.visual_values = [rate.miss.visual_values, r];
    rr = nanstd((RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.miss.visual_errors = [rate.miss.visual_errors, rr];
    s = ((RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it+1))/2);
    rate.miss.auditory_values = [rate.miss.auditory_values, s];
    ss = nanstd((RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.miss.auditory_errors = [rate.miss.auditory_errors, ss];
    t = ((RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it+1))/2);
    rate.miss.haptic_values = [rate.miss.haptic_values, t];
    tt = nanstd((RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it) + RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it+1))/2) / sqrt(length(filenames));
    rate.miss.haptic_errors = [rate.miss.haptic_errors, tt];
    
end