% Error setup

data_error = zeros(length(filenames)*4,3);
data_error(:,1) = [RESULTS.OVERALL(1:length(filenames),6); RESULTS.OVERALL(1:length(filenames),7); RESULTS.OVERALL(1:length(filenames),8); RESULTS.OVERALL(1:length(filenames),9);];
data_error(1:length(filenames),2) = 1; % standard
data_error(length(filenames)+1:(length(filenames)+1)+length(filenames),2) = 2; %visual
data_error(length(filenames)*2+1:(length(filenames)*2+1)+length(filenames),2) = 3; %auditory
data_error(length(filenames)*3+1:end,2) = 4; %haptic

    sn = 1;
    for it = 1:size(data_error,1)

        data_error(it,3) = sn;

        sn = sn + 1;

        if sn > length(filenames)
            sn = 1;
        end

    end
    
% RT Setup
    
data_rt = zeros(length(filenames)*4,3);
data_rt(:,1) = [RESULTS.OVERALL(1:length(filenames),2); RESULTS.OVERALL(1:length(filenames),3); RESULTS.OVERALL(1:length(filenames),4); RESULTS.OVERALL(1:length(filenames),5);];
data_rt(1:length(filenames),2) = 1; % standard
data_rt(length(filenames)+1:(length(filenames)+1)+length(filenames),2) = 2; %visual
data_rt(length(filenames)*2+1:(length(filenames)*2+1)+length(filenames),2) = 3; %auditory
data_rt(length(filenames)*3+1:end,2) = 4; %haptic

    sn = 1;
    for it = 1:size(data_rt,1)

        data_rt(it,3) = sn;

        sn = sn + 1;

        if sn > length(filenames)
            sn = 1;
        end

    end
    
% Failstop Setup
    
data_failstop = zeros(length(filenames)*4,3);
data_failstop(:,1) = [RESULTS.OVERALL(1:length(filenames),14); RESULTS.OVERALL(1:length(filenames),15); RESULTS.OVERALL(1:length(filenames),16); RESULTS.OVERALL(1:length(filenames),17);];
data_failstop(1:length(filenames),2) = 1; % standard
data_failstop(length(filenames)+1:(length(filenames)+1)+length(filenames),2) = 2; %visual
data_failstop(length(filenames)*2+1:(length(filenames)*2+1)+length(filenames),2) = 3; %auditory
data_failstop(length(filenames)*3+1:end,2) = 4; %haptic

    sn = 1;
    for it = 1:size(data_failstop,1)

        data_failstop(it,3) = sn;

        sn = sn + 1;

        if sn > length(filenames)
            sn = 1;
        end

    end

% Succstop Setup
    
data_succstop = zeros(length(filenames)*4,3);
data_succstop(:,1) = [RESULTS.OVERALL(1:length(filenames),22); RESULTS.OVERALL(1:length(filenames),23); RESULTS.OVERALL(1:length(filenames),24); RESULTS.OVERALL(1:length(filenames),25);];
data_succstop(1:length(filenames),2) = 1; % standard
data_succstop(length(filenames)+1:(length(filenames)+1)+length(filenames),2) = 2; %visual
data_succstop(length(filenames)*2+1:(length(filenames)*2+1)+length(filenames),2) = 3; %auditory
data_succstop(length(filenames)*3+1:end,2) = 4; %haptic

    sn = 1;
    for it = 1:size(data_succstop,1)

        data_succstop(it,3) = sn;

        sn = sn + 1;

        if sn > length(filenames)
            sn = 1;
        end

    end


% Miss Setup
    
data_miss = zeros(length(filenames)*4,3);
data_miss(:,1) = [RESULTS.OVERALL(1:length(filenames),10); RESULTS.OVERALL(1:length(filenames),11); RESULTS.OVERALL(1:length(filenames),12); RESULTS.OVERALL(1:length(filenames),13);];
data_miss(1:length(filenames),2) = 1; % standard
data_miss(length(filenames)+1:(length(filenames)+1)+length(filenames),2) = 2; %visual
data_miss(length(filenames)*2+1:(length(filenames)*2+1)+length(filenames),2) = 3; %auditory
data_miss(length(filenames)*3+1:end,2) = 4; %haptic

    sn = 1;
    for it = 1:size(data_miss,1)

        data_miss(it,3) = sn;

        sn = sn + 1;

        if sn > length(filenames)
            sn = 1;
        end

    end



% -- rm_anova2 setup -- %

%data (RT)
Y = [];
for it = 1:8
    Y = [Y; RESULTS.BLOCKWISE.RT.stan(1:length(filenames),it)]; 
end
for it = 1:8
    Y = [Y; RESULTS.BLOCKWISE.RT.odd_v(1:length(filenames),it)];
end
for it = 1:8
    Y = [Y; RESULTS.BLOCKWISE.RT.odd_a(1:length(filenames),it)];
end
for it = 1:8
    Y = [Y; RESULTS.BLOCKWISE.RT.odd_h(1:length(filenames),it)];
end

% % ANOVA Error rates
% Y = [];
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.ERROR.stan(1:length(filenames),it)]; 
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.ERROR.odd_v(1:length(filenames),it)];
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.ERROR.odd_a(1:length(filenames),it)];
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.ERROR.odd_h(1:length(filenames),it)];
% end


% % ANOVA MISS RATES
% Y = [];
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.MISS.stan(1:length(filenames),it)]; 
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.MISS.odd_v(1:length(filenames),it)];
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.MISS.odd_a(1:length(filenames),it)];
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.MISS.odd_h(1:length(filenames),it)];
% end
% 

% % ANOVA SUCCSTOP
% Y = [];
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.SUCCSTOP.stan(1:length(filenames),it)]; 
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_v(1:length(filenames),it)];
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_a(1:length(filenames),it)];
% end
% for it = 1:8
%     Y = [Y; RESULTS.BLOCKWISE.RATE.SUCCSTOP.odd_h(1:length(filenames),it)];
% end


%subject number
S = [];
sn = 1;
it = 1;
while it <= size(Y,1)
    S = [S;sn];
    sn = sn+1;
    it = it+1;
    if sn > length(filenames)
        sn = 1;
    end
end

%modality code {stan: 1, visual: 2, auditory: 3, haptic: 4}
F1 = zeros(size(Y,1),1);
for it = 1:4
    F1(((length(filenames)*8)*(it-1))+1:(length(filenames)*8)*it) = it;
end

%block code (1:8)
F2 = [];
for it = 1:8
    block = zeros(length(filenames),1);
    block(:,1) = it;
    F2 = [F2; block(:,1)];
end
F2 = repmat(F2,4,1);

FACTNAMES = {'Modality', 'Block'};



