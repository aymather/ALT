function [visualcue, hapticcue] = ALT_cueprep(settings,trialseq,it)

% COLUMNS
id = ALT_columns;

% PREASSIGN
hapticcue = []; visualcue = [];

% VISUAL
if trialseq(it,id.odd_v) == 1
    visualcue = ['Screen(' char(39) 'FillPoly' char(39) ', settings.screen.outwindow ,settings.layout.color.diamond,settings.coordinates)'];
end 

% AUDITORY
if trialseq(it,id.odd_a) == 1
    PsychPortAudio('FillBuffer', settings.sound.audiohandle, settings.sound.novelsounds{sum(trialseq(1:it,id.odd_a))}');
end

% HAPTIC
if trialseq(it, id.odd_h) == 1
    hapticcue = ['vibrate_handle(settings.daq, 1,' char(39) 'both' char(39) ',' char(39) 'fast' char(39) ');'];
end