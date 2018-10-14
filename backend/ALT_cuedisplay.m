function cuetime = ALT_cuedisplay(settings,it,trialseq)

% COLUMNS
id = ALT_columns;

% VISUAL
if trialseq(it, id.nov_v) == 1
    cuetime = Screen('Flip', settings.screen.outwindow);
    
    % REDRAW FIXATION
    DrawFormattedText(settings.screen.outwindow, '+', 'center', 'center', settings.layout.color.fixation);

    % CUE DURATION
    while GetSecs - cuetime < settings.duration.cue
        WaitSecs(.0001);
    end
    
    Screen('Flip', settings.screen.outwindow);
    
end

% AUDITORY
if trialseq(it,id.nov_a) == 1
    cuetime = PsychPortAudio('Start', settings.sound.audiohandle, 1, 0, 1);
end

% HAPTIC
if trialseq(it,id.nov_h) == 1
    cuetime = GetSecs;
    vibrate_handle(settings.daq, 1, 'both', 'fast'); % start vib
    while GetSecs - cuetime < settings.duration.cue
        WaitSecs(.0001);
    end
    vibrate_handle(settings.daq, 0); % vib off
end

end