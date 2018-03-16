function RRlinkVariableGUI (obj)
%RRlinkVariableGUI Will offer similar functionality to RRlinkVariable,
%but offers a user interface for more rapid changes to linked variables.
%   The GUI will open within a figure window, and allow the user to change
%   which variables are linked to which standard through a series of
%   dropdown boxes.

%figure - introduced before R2006a

%% Error Handling

%RebelRacingData object
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%% Create Empty Figure
%   Construct the barebones figure, there make sure that 'Visible' is set to
%   off as components are added to the figure

fig = figure('Name','RebelRacing: Link Variables',...
             'NumberTitle','off',...
             'ToolBar','none',...
             'MenuBar','none',...
             'Units','points',...
             'Position',[250,200,750,375],...
             'Visible','off');

%% Create Panel in Appropriate Position

hPanel = uipanel('Title','Panel Title',...
         'Units', 'norm',...
         'Pos', [0.025,0.025,0.95,0.95]);
     
%% Create and Customize Table

colnames = {'Variable','Standard'};
varnames = fieldnames(obj.RRtestAccess)';
stdnames = fieldnames(obj.RRtestAccess)';
varstd = [varnames stdnames];
hTable = uitable(hPanel,...
         'Data', varstd,...
         'ColumnName', colnames,...
         'Units', 'norm',...
         'Position', [0.025, 0.025, 0.95, 0.95] );
%hButton = uicontrol('String','Button','Parent',hPanel);
         
fig.Visible = 'on';

end

