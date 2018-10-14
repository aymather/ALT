function graph_it(leg, ylim, values1, errors1, values2, errors2, values3, errors3, values4, errors4)

    % GET VALUES
    if nargin == 8
        values = [values1; values2; values3;]';
        errors = [errors1; errors2; errors3;]';
        
        % MAKE GRAPHS
        graph = figure('Position',[1 1 1200 400],'PaperPositionMode','auto','Visible','on');
        graph = bar(values);
        hold on
        X = [];
        for i = 1:length(graph)
            X = [X; graph(i).XData + graph(i).XOffset];
        end
        X = X';
        EB = errorbar(X,values,errors,'.');
        legend(leg{1}, leg{2}, leg{3});
        xlabel('Block (by 2)');
        ylim([0 ylim]);
        hold off
        
    elseif nargin == 6
        values = [values1; values2;]';
        errors = [errors1; errors2;]';
        
        % MAKE GRAPHS
        graph = figure('Position',[1 1 1200 400],'PaperPositionMode','auto','Visible','on');
        graph = bar(values);
        hold on
        X = [];
        for i = 1:length(graph)
            X = [X; graph(i).XData + graph(i).XOffset];
        end
        X = X';
        EB = errorbar(X,values,errors,'.');
        legend(leg{1}, leg{2});
        xlabel('Block (by 2)');
        ylim([0 ylim]);
        hold off
        
    elseif nargin == 4
        values = values1;
        errors = errors1;
        
        % MAKE GRAPHS
        graph = figure('Position',[1 1 1200 400],'PaperPositionMode','auto','Visible','on');
        graph = bar(values);
        hold on
        X = [];
        for i = 1:length(graph)
            X = [X; graph(i).XData + graph(i).XOffset];
        end
        X = X';
        EB = errorbar(X,values,errors,'.');
        legend(leg{1});
        xlabel('Block (by 2)');
        ylim([0 ylim]);
        hold off
        
    else
        values = [values1; values2; values3; values4;]';
        errors = [errors1; errors2; errors3; errors4;]';
        
        % MAKE GRAPHS
        graph = figure('Position',[1 1 1200 400],'PaperPositionMode','auto','Visible','on');
        graph = bar(values);
        hold on
        X = [];
        for i = 1:length(graph)
            X = [X; graph(i).XData + graph(i).XOffset];
        end
        X = X';
        EB = errorbar(X,values,errors,'.');
        legend(leg{1}, leg{2}, leg{3}, leg{4});
        xlabel('Block (by 2)');
        ylim([0 ylim]);
        hold off
    end

end