function [tf, out] = RRisLinked(obj, query)
%RRisLinked Will return a boolean true or false value based on whether or
%not the passed 'query' is both a variable in the current dataset AND that
%variable is linked to a standard. Will return the name of the standard
%that the variable is linked to if the output argument is defined.
%   THIS NEEDS TO BE TESTED

%% Error Handling

%RebelRacingData object
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%RRisVariable to make sure 'query' is variable or standard
if ~RRisVariable(obj, query) && ~RRisStandard(obj, query)
    error('Input argument is not a variable in the current dataset');
end

%% Function Call

fields = fieldnames(obj.RRtestAccess);
tf = false;
out = '';

%query is Variable
if RRisVariable(obj, query)
    for i = 1:length(fields)
        if RRtestAccessStatus(obj, 1, fields{i}) &&...
                strcmp(getfield(obj.RRtestAccess.(fields{i}),'VariableName'), query) %#ok<*GFLD>
            tf = true;
            out = fields{i};
        end
    end
%query is Standard
else
    if RRtestAccessStatus(obj, 1, query)
        tf = true;
        out = getfield(obj.RRtestAccess.(query),'VariableName');
    end
end 

end

