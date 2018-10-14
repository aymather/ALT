function trialseq = ALT_backend(settings,trialseq)

% SHORTCUTS
FC = settings.layout.color.fixation;
OW = settings.screen.outwindow;
owd = settings.screen.outwindowdims;

% COLUMNS
id = ALT_columns;

% INTRO
ALT_intro(settings, trialseq, 1);

% TRIAL LOOP
for it = 1:size(trialseq,1)
    
    % START TIME
    if it == 1; begintime = GetSecs; end
    trialseq(it, id.time) = GetSecs - begintime;
    
    % FIXATION
    DrawFormattedText(OW, '+', 'center', 'center', FC);
    trial_start = Screen('Flip', OW);
    WaitSecs(settings.duration.fixation);
    
    % MAP BUTTONS
    if trialseq(it, id.go) == 1
        stim = settings.general.buttons{1};
    else
        stim = settings.general.buttons{2};
    end
    if trialseq(it, id.side) == 1
        side = -settings.layout.size.offset-settings.layout.size.text/2;
    else
        side = settings.layout.size.offset-settings.layout.size.text/2;
    end
    
    % DRAW STIMULUS
    DrawFormattedText(OW, '+', 'center', 'center', FC);
    DrawFormattedText(OW, stim, owd(3)/2+side, 'center', settings.layout.color.text);
    stimonset = Screen('Flip', OW);
    
    % PREP V NOVEL
    if trialseq(it, id.nov_v) == 1
          Screen('FillRect', settings.screen.outwindow, settings.screen.bg_novel);
          DrawFormattedText(OW, stim, owd(3)/2+side, 'center', settings.layout.color.text);
          DrawFormattedText(OW, '+', 'center', 'center', FC);
    end
    
    % CHECK FOR RESPONSE
    [trialseq(it,id.rt), trialseq(it,id.resp)] = handle_response_ALT(settings.daq,(trialseq(it,id.deadline)+settings.duration.post_deadline)*1000,settings,trialseq,it,OW,stim,owd,side);

    % CODE RESPONSE - (accuracy_legend.m for key)
    if trialseq(it,id.go) == 1
        if trialseq(it,id.resp) == 0 || trialseq(it,id.rt) >= trialseq(it,id.deadline)*1000
            trialseq(it,id.acc) = 99;
        elseif trialseq(it,id.resp) == trialseq(it,id.side) && trialseq(it,id.rt) < trialseq(it,id.deadline)*1000
            trialseq(it,id.acc) = 1;
        elseif trialseq(it,id.resp) ~= trialseq(it,id.side) && trialseq(it,id.rt) < trialseq(it,id.deadline)*1000
            trialseq(it,id.acc) = 2;
        end
    else
        if trialseq(it,id.rt) <= trialseq(it,id.deadline)*1000 && trialseq(it,id.resp) ~= 0
            trialseq(it,id.acc) = 3;
        elseif trialseq(it,id.rt) >= trialseq(it,id.deadline)*1000
            trialseq(it,id.acc) = 4;
        elseif trialseq(it,id.rt) == 0 && trialseq(it,id.resp) == 0
            trialseq(it,id.acc) = 5;
        end
    end
    
    % feedback
    if trialseq(it,id.acc) == 99
        DrawFormattedText(settings.screen.outwindow, 'TOO SLOW!', 'center', 'center', settings.layout.color.SLOW);
        Screen('Flip', settings.screen.outwindow);
    end
    
    % SAVE
    save(fullfile(settings.files.outfolder,settings.files.outfile),'trialseq','settings');
    
    if it < size(trialseq,1)
        % adjust deadline
        if trialseq(it,id.acc) == 99;
            trialseq(it+1:end,id.deadline) = trialseq(it,id.deadline) + settings.duration.deadlineadjust;
        else
            % get go trials
            gos = trialseq(trialseq(1:it,id.go)==1,:);
            if size(gos,1) >=5 && gos(end,id.acc) == 1 && gos(end-1,id.acc) == 1 && gos(end-2,id.acc) == 1
                trialseq(it+1:end,id.deadline) = trialseq(it,id.deadline) - settings.duration.deadlineadjust;
            end
        end  
    end
    
    % PREVENT TRIAL OVERLOAD
    if it+1 < size(trialseq,1)
        if trialseq(it+1,id.deadline) < .25
            trialseq(it+1:end,id.deadline) = .25;
        end    
    end
    
    WaitSecs(settings.duration.iti);
    
    % BLOCK BREAK
    if it == size(trialseq,1) || trialseq(it,id.block) ~= trialseq(it+1,id.block)
        ALT_blockfeedback(settings,trialseq,it)
    end
    
end