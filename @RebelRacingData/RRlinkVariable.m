function RRlinkVariable (obj, var, standard)
%RRlinkVariable manually pair a variable to a standard
%   RRlinkVariable will accept character vectors or 1-by-n cell arrays
%   provided both are of the same length.
%   
%   Syntax:
%   obj.RRlinkVariable(variables,standards)
%   RRlinkVariable(obj,variables,standards)
%
%   Standards:
%   Interval
%   UTC
%   Battery
%   Acceleration_X
%   Acceleration_Y
%   Acceleration_Z
%   Yaw
%   Pitch
%   Roll
%   Engine_RPM
%   Axle_RPM
%   Latitude
%   Longitude
%   Speed
%   Distance
%   Altitude
%   GPS_Satillites
%   GPS_Quality
%   GPS_DOP
%   Lap_Count
%   Lap_Time
%   Sector
%   Sector_Time
%   Predicted_Time
%   Elapsed_Time
%   Current_Lap

%% Error Handling

%Input arguments
if nargin ~= 3
    error(sprintf('Invalid number of input arguments\nUsage - RRdefineVariable(obj, variable, standard) OR\n        obj.RRdefineVariable(variable, standard)')); %#ok<SPERR>
end

%RebelRacingData object
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%If the cell array is only of length 1, then convert to a char array
if length(var) == 1
    var = char(var);
end
if length(standard) == 1
    standard = char(standard);
end

lst = zeros(0,length(standard));
%Valid 'standard' argument
if ~iscell(standard)
    if ~isfield(obj.RRtestAccess, standard)
        error('Invalid "standard" argument, refer to the list of available standards with "help RRdefineVariable"');
    end
else
    for i = 1:length(standard)
        if ~isfield(obj.RRtestAccess, standard{i})
            lst(1,i) = 0;
        else
            lst(1,i) = 1;
        end
    end
    if ~(all(lst) == 1)
        error('Invalid "standard" argument, refer to the list of available standards with "help RRdefineVariable"');
    end
end
    
lst = zeros(0, length(var)); %#ok<PREALL>
%Valid 'var' argument
if ~iscell(var)
    checkVar = 0;
    lst = obj.RRdataProperties.VariableNames;
    for i = 1:length(lst)
        if strcmp(lst{i},var)
            checkVar = 1;
        end
    end
    if checkVar == 0
        error('Invalid variable name, please refer to the current dataset');
    end
else
    lst = zeros(0,length(var));
    props = obj.RRdataProperties.VariableNames;
    for i = 1:length(var)
        for j = 1:length(props)
            if strcmp(var{i},props{j})
                lst(1,i) = 1;
            end
        end
    end
    if ~(all(lst) == 1)
        error('Invalid "var" argument, refer to the list of available standards with "help RRdefineVariable"');
    end
end
    

%% Link Variable to Standard
%   In this case, the user only submitted a single variable and standard to
%   link together, the 'Valid' flag will be set and 'VariableName' will be
%   overwritten with whatever was passed into 'var'

if ~iscell(var) && ~iscell(standard)
    obj.RRtestAccess.(standard) = setfield(obj.RRtestAccess.(standard), 'Valid', 1); %#ok<*SFLD>
    obj.RRtestAccess.(standard) = setfield(obj.RRtestAccess.(standard), 'VariableName', var);
    
elseif (iscell(var) && iscell(standard)) && (length(var) == length(standard))
    for i = 1:length(var)
        obj.RRtestAccess.(standard{i}) = setfield(obj.RRtestAccess.(standard{i}), 'Valid', 1);
        obj.RRtestAccess.(standard{i}) = setfield(obj.RRtestAccess.(standard{i}), 'VariableName', var{i});
    end
    
else
    error('Invalid combination of cell array and character vector as input arguments');
        
end

end
