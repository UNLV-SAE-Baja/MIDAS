function out = RRgetUnits(obj, standard)
%RRgetUnits Will return a character vector containing the units of the
%variable currently linked to the standard.
%   Detailed explanation goes here

%% Error Handling

% ensure object is of type RebelRacingData
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

% ensure the standard valid
if ~isfield(obj.RRtestAccess, standard)
    error('Invalid "standard" argument, refer to the list of available standards with "help RRdefineVariable"');
end

%% Get Units

var = RRtestAccessVariable(obj, standard);
location = strfind(obj.RRdataProperties.VariableNames, var);

for i = 1:length(location)
    if ~isempty(location{i})
        out = obj.RRdataProperties.VariableUnits{i};
        return
    end
end

end

