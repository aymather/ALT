function behav = ALT_analysis(trialseq,id)

blocks = trialseq(end,id.block);

    for ib = 1:blocks
        
        % BREAKDOWN TRIALS BY BLOCK
        blocktrials = trialseq(trialseq(:,id.block) == ib,:);
        [rt, rate] = ALT_trial_breakdown(blocktrials,id);

        % BLOCKWISE OUTPUT
        eval(['behav.block' num2str(ib) '.rate = rate;']);
        eval(['behav.block' num2str(ib) '.rt = rt;']); 
        
    end

    % OVERALL BREAKDOWN
    [rt, rate] = ALT_trial_breakdown(trialseq,id);
    behav.overall.rate = rate;
    behav.overall.rt = rt;

end




function [rt, rate, sem] = ALT_trial_breakdown(trialseq,id)

    % NOGO SUB TABLES
    nogo.odd_visual = trialseq(trialseq(:,id.nov_v) == 1 & trialseq(:,id.nogo) == 1,:);
    nogo.odd_audio = trialseq(trialseq(:,id.nov_a) == 1 & trialseq(:,id.nogo) == 1,:);
    nogo.odd_haptic = trialseq(trialseq(:,id.nov_h) == 1 & trialseq(:,id.nogo) == 1,:);
    nogo.standard = trialseq(trialseq(:,id.nov_v) == 0 & trialseq(:,id.nov_a) == 0 & trialseq(:,id.nov_h) == 0 & trialseq(:,id.nogo) == 1,:);
    
    % GO SUB TABLES
    go.odd_visual = trialseq(trialseq(:,id.nov_v) == 1 & trialseq(:,id.go) == 1,:);
    go.odd_audio = trialseq(trialseq(:,id.nov_a) == 1 & trialseq(:,id.go) == 1,:);
    go.odd_haptic = trialseq(trialseq(:,id.nov_h) == 1 & trialseq(:,id.go) == 1,:);
    go.standard = trialseq(trialseq(:,id.nov_v) == 0 & trialseq(:,id.nov_a) == 0 & trialseq(:,id.nov_h) == 0 & trialseq(:,id.go) == 1,:);

    % MISS RATES in %
    rate.miss.odd_v = 100 * sum(go.odd_visual(:,id.acc) == 99) / size(go.odd_visual,1);
    rate.miss.odd_a = 100 * sum(go.odd_audio(:,id.acc) == 99) / size(go.odd_audio,1);
    rate.miss.odd_h = 100 * sum(go.odd_haptic(:,id.acc) == 99) / size(go.odd_haptic,1);
    rate.miss.stan = 100 * sum(go.standard(:,id.acc) == 99) / size(go.standard,1);
    
    % ERROR RATES
    rate.error.odd_v = 100 * sum(go.odd_visual(:,id.acc) == 2) / size(go.odd_visual,1);
    rate.error.odd_a = 100 * sum(go.odd_audio(:,id.acc) == 2) / size(go.odd_audio,1);
    rate.error.odd_h = 100 * sum(go.odd_haptic(:,id.acc) == 2) / size(go.odd_haptic,1);
    rate.error.stan = 100 * sum(go.standard(:,id.acc) == 2) / size(go.standard,1);
    
    % FAILED STOPS (predeadline response)
    rate.failstop.odd_v = 100 * sum(nogo.odd_visual(:,id.acc) == 3) / size(nogo.odd_visual,1);
    rate.failstop.odd_h = 100 * sum(nogo.odd_haptic(:,id.acc) == 3) / size(nogo.odd_haptic,1);
    rate.failstop.odd_a = 100 * sum(nogo.odd_audio(:,id.acc) == 3) / size(nogo.odd_audio,1);
    rate.failstop.stan = 100 * sum(nogo.standard(:,id.acc) == 3) / size(nogo.standard,1);

    % SUCCESSFUL STOPS (responded postdeadline)
    rate.succstop_postDeadResp.odd_v = 100 * sum(nogo.odd_visual(:,id.acc) == 4) / size(nogo.odd_visual,1);
    rate.succstop_postDeadResp.odd_h = 100 * sum(nogo.odd_haptic(:,id.acc) == 4) / size(nogo.odd_haptic,1);
    rate.succstop_postDeadResp.odd_a = 100 * sum(nogo.odd_audio(:,id.acc) == 4) / size(nogo.odd_audio,1);
    rate.succstop_postDeadResp.stan = 100 * sum(nogo.standard(:,id.acc) == 4) / size(nogo.standard,1);
    
    % TRUE SUCCESSFUL STOPS (never responded)
    rate.succstop_true.odd_v = 100 * sum(nogo.odd_visual(:,id.acc) == 5) / size(nogo.odd_visual,1);
    rate.succstop_true.odd_h = 100 * sum(nogo.odd_haptic(:,id.acc) == 5) / size(nogo.odd_haptic,1);
    rate.succstop_true.odd_a = 100 * sum(nogo.odd_audio(:,id.acc) == 5) / size(nogo.odd_audio,1);
    rate.succstop_true.stan = 100 * sum(nogo.standard(:,id.acc) == 5) / size(nogo.standard,1);

    % SELECT TRIALS W/ CORRECT RESPONSES
    odd_visual_correct = go.odd_visual(go.odd_visual(:, id.acc) == 1,:);
    odd_audio_correct = go.odd_audio(go.odd_audio(:, id.acc) == 1,:);
    odd_haptic_correct = go.odd_haptic(go.odd_haptic(:, id.acc) == 1,:);
    standard_correct = go.standard(go.standard(:, id.acc) == 1,:);

    % GET MEAN RTs OF TRIALS W/ CORRECT RESPONSES
    rt.odd_v = nanmean(odd_visual_correct(:,id.rt));
    rt.odd_a = nanmean(odd_audio_correct(:,id.rt));
    rt.odd_h = nanmean(odd_haptic_correct(:,id.rt));
    rt.stan = nanmean(standard_correct(:,id.rt));
    rt.all = nanmean(trialseq(:,id.rt));
    
end