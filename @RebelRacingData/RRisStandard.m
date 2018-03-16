function tf = RRisStandard(obj, query)
%RRisStandard Returns logical output depending on whether or not the
%particular character vector is the name of a Standard.
%   Detailed explanation goes here

%% Error Handling

%RebelRacingData object
if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%% Determine Validity

fields = fieldnames(obj.RRtestAccess);
tf = false;

for i = 1:length(fields)
    if strcmp(fields{i}, query)
        tf = true;
    end
end

end

