function hFig = sePlotPrioritizedDepartures(logsout)
% Helper to plot prioritized departures for the Entity Priority example

% Copyright 2015 The MathWorks, Inc.

% Simultaneous entry data
entryData = logsout.get('Entry').Values.Class.Data;
entryData = reshape(entryData, 1, length(entryData));

% Exit data after the gate opens
exitData = logsout.get('ImplicitPrioritizedExit').Values.Class.Data;
exitData = reshape(exitData, 1, length(exitData));
exitTime = logsout.get('ImplicitPrioritizedExit').Values.Class.Time';

% We want to plot both simultaneous entries and exit on the same figure
% So offset the exit time with the entry length
offsetExitTime = exitTime + length(entryData);

% Create the figure and plot
hFig = figure('Position',[402 399 874 277],'Toolbar','none','Menubar','none');
stairs(1:length(entryData), entryData, 'ro-');
hold on;
stairs(offsetExitTime, exitData, 'bo-');
set(gca, 'YLim', [0.5 3.5]);
grid on;

% All labels
xtick = [0 length(entryData) 40 60 80 100];
xlabels = {'0','0','10','30','50','70','90'};
set(gca, 'XTickMode', 'manual', 'XTick', xtick, 'XTickLabel', xlabels);
set(gca, 'XLabel', text('String','Time'), 'YLabel', text('String','Entity Priority'), ...
    'Title', text('String','Prioritized Departures for Simultaneous Arrivals'));

% Decorate the figure with event information
plot([30 30],[0.5 3.5],'m-');
txt1 = text(2, 3.25,'Simultaneous arrivals at time 0');
txt1.Color = 'r';
txt2 = text(30, 3.25, '<< Gate opens');
txt2.Color = 'm';
txt3 = text(45, 1.25, 'Departures according to entity priority');
txt3.Color = 'b';
rect = rectangle('position',[0 0.5 30 3.5]);
rect.FaceColor = [1 0 0 0.03];
rect.EdgeColor = 'none';

% LocalWords:  ro bo XLabel
