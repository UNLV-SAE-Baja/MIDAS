function tf = RRisVariable (obj, query)
%RRisVariable Will return a boolean value depending on whether or not the
%variable 'query' is in the current dataset.
%   Future Development:
%   -Accept cell array of variables to query

%% Error Handling

%RebelRacingData object
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%% Compare Strings

%List of variable names will be saved in 'vars'
vars = obj.RRdataProperties.VariableNames;

%Output will initialize to 'false'
tf = false;

%Output will swap to 'true' on hit
for i = 1:length(vars)
    if strcmp(query, vars{i})
        tf = true;
    end
end
    
end

