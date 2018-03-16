function out = RRlinked(obj)
%RRlinked will return a cell array containing the linked standard
%fields from the current dataset

%% Error Handling
% Ensure that the passed object is of of type RebelRacingData

if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%% Function Call
% Call RRtestAccessStatus with one argument

out = obj.RRtestAccessStatus(1);

end

