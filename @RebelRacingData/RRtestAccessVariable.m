function out = RRtestAccessVariable(obj, fieldname)
%RRtestAccessVariable Will return a character vector of the variable linked
%to the given standard. In the case that there is nothing linked, it will
%return 0.
%   GO THROUGH AND FIX THIS BECAUSE THIS IS BAD

%% Error Handling

if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

if RRtestAccessStatus(obj,1,fieldname)
    out = getfield(obj.RRtestAccess.(fieldname),'VariableName'); %#ok<*GFLD>
else
    out = false;
end

end

