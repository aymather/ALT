% Screen
settings.screen.bg_novel = [0 0 255]; %novel background color
settings.screen.bg_stan = [0 0 0]; %standard background color
screens = Screen('Screens');
settings.screen.screenNumber = max(screens);
[outwindow, outwindowdims] = Screen('OpenWindow', settings.screen.screenNumber, settings.screen.bg_stan, [0 0 500 500]);% make screen, black bg
Priority(MaxPriority(outwindow));
commandwindow;

strings = {'mean rt: ','percent succstop: '};
stats = [255, 35.2];
textColor = [128 5 33];

glo_blockfeedback(outwindow, strings, stats, textColor);