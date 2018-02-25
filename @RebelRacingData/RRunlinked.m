function out = RRunlinked (obj)
%RRunlinked will return a cell array containing the unlinked standard
%fields from the current dataset

%% Error Handling
%   Ensure that the passed object is of of type RebelRacingData

if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

%% Function Call
%   Call RRtestAccessStatus with two arguments behind the scenes

out = obj.RRtestAccessStatus(0);

end

