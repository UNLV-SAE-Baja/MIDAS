function outFig = RRplot(obj, x, y)
%RRplot Will plot, label, and format a 2D plot with respect to UNLV SAE
%Baja Rebel Racing team standards.
%   This function should:
%   -accept variable names from the input file
%   -accept standard names
%   -in case of standard names passed, make sure linked
%   -accept any number of pairs of input (formatted in cell array)
%   -accept one x term and any number of y terms
%   -plot in professional/academic manner
%   -plot in scarlett and black
%   -create a legend for all plotted data
%   -have plot created with, and version number

%% Error Handling

%RebelRacingData object
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%If X is passed as a cell array, but only has one member, convert to char
if iscell(x) && length(x) == 1
    x = x{1};
end

%If Y is passed as a cell array, but only has one member, convert to char
if iscell(y) && length(y) == 1
    y = y{1};
end

%Validate correct variable/standard inputs for variable 'y'
if iscell(x)
    for i = 1:length(x)
        rs = RRisStandard(obj, x{i});
        rv = RRisVariable(obj, x{i});
        rl = RRisLinked(obj, x{i});
        if ~rv && ~rs
            error('"x" argument is not a variable nor standard');
        elseif ~rl && rs
            error('The provided "x" standard is not linked to any variable in the current dataset');
        end
    end
    tmp = x{i};
    for i = 2:length(x)
        if ~strcmp(tmp, x{i})
            error('All inputs for "x" axis are not the same');
        end
    end
else
    rs = RRisStandard(obj, x);
    rv = RRisVariable(obj, x);
    rl = RRisLinked(obj, x);
    if ~rs && ~rv
        error('"x" argument is not a variable nor standard');
    elseif ~rl && rs
        error('The "x" input provided is not linked to any variable/standard in the current dataset');
    end
end

%Validate correct variable/standard for input 'y'
if iscell(y)
    for i = 1:length(y)
        rs = RRisStandard(obj, y{i});
        rv = RRisVariable(obj, y{i});
        rl = RRisLinked(obj, y{i});
        if ~rv && ~rs
            error('"y" argument is not a variable nor standard');
        elseif ~rl && rs
            error('The provided "y" standard is not linked to any variable in the current dataset');
        end
    end
else
    rs = RRisStandard(obj, y);
    rv = RRisVariable(obj, y);
    rl = RRisLinked(obj, y);
    if ~rs && ~rv
        error('"y" argument is not a variable nor standard');
    elseif ~rl && rs
        error('The provided "y" standard is not linked to any variable in the current dataset');
    end
end

%% Set X Axis Properties

%Create hidden figure
fig = figure('NumberTitle', 'off',...
             'Visible', 'off');
         
%Get information for x axis
if RRisStandard(obj, x)
    xvar = RRtestAccessVariable(obj, x);
    xstd = true;
    xname = x;
    xunits = RRgetUnits(obj, xvar);
    xlabel(strcat(xname, ' (', xunits, ')'));
elseif RRisVariable(obj, x) && RRisLinked(obj, x)
    xvar = x;
    xstd = true;
    xname = RRgetStandard(obj, x);
    xunits = RRgetUnits(obj, x);
else
    xvar = x;
    xstd = false;
    xname = x;
    xunits = RRgetUnits(obj, x);
end

%Set x label, if no units omit the parentheses
if ~strcmp(xunits,'')
    xlabel(strcat(xname, ' (', xunits, ')'));
else
    xlabel(xname);
    
%Format x axis

%% Set Y Axis Properties
% The y axis will be more tricky becauase there is a possibility that the
% axes will be scaled differently, and there are many possible y axes that
% can be specified.
% Need to Determine:
%   -when to use yyaxis
%   -how to name the figure
%   -when to specifically change the axis to fit a determined variable
%   (battery 0-5V)



%Name Figure window
figname = strcat(obj.RRname, ': ', yname, 'vs. ', xname);
fig.Name = figname;

end

