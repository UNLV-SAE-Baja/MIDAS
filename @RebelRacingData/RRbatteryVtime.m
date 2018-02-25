function outFig = RRbatteryVtime(obj)
%RRbatteryVtime Will create a 2D line plot with Battery on the y-axis and
%time on the x-axis
%   Time is designated by 'interval', this should be changed though to
%   remove interval as the primary name for this type of plot. The units
%   should be printed next to the standard variable name as well.

%% Error Handling

if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

if RRtestAccessStatus(obj,'unlinked','Interval') || RRtestAccessStatus(obj,'unlinked','Battery')
    error('Either standard "Interval" or "Battery" are unlinked');
end

%% Create Figure Properties

% Designate figure name
nameEnd = ': Battery vs. Time';
figName = strcat(obj.RRname,nameEnd);

fig = figure('Name',figName,...
             'NumberTitle', 'off',...
             'Visible', 'off');

batt = RRtestAccessVariable(obj,'Battery');
time = RRtestAccessVariable(obj,'Interval');

plot(obj.RRdataTable.(time),obj.RRdataTable.(batt),...
     'Color', [0.9607, 0.0, 0.1843]); %Scarlett [245, 0, 47]
 
title('Battery Voltage over Time');
axis([0 inf 0 5]);

xunits = RRgetUnits(obj, 'Interval');
xlabel(strcat('Time',xunits));

yunits = RRgetUnits(obj, 'Battery');
ylabel(strcat('Battery',yunits));

fig.Visible = 'on';

end

