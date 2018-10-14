%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Jan R. Wessel, University of Iowa, June 2018                            %
%   Email: jan-wessel@uiowa.edu / www.wessellab.org                       %  
%   Edited by Alec Mather, June 2018                                      %  
%                                                                         %
%   Psychtoolbox 3.0.12 / Matlab 2015a                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc
% MacOS Specific
Screen('Preference', 'SkipSyncTests', 1);

% INITIALIZE
addpath(genpath(fileparts(which('ALT.m'))));

% DESCRIPTIVES
data = ALT_data;

% INITIALIZE
settings = ALT_initialize(data);

% TRIAL SEQUENCE
trialseq = ALT_sequence(settings);

% TRIALS
trialseq = ALT_backend(settings,trialseq);

% OUTRO
ALT_outro(settings,trialseq,data);