function out = RRtestAccessStatus(obj, status, fieldname)
%RRtestAccessStatus returns a cell array containing the standard fields
%that exhibit the passed "status", which can either be a character vector
%or the numerical value.
%
%   Usage: obj.RRtestAccessStatus('status', 'fieldname')
%          RRtestAccessStatus(obj, 'status', 'fieldname')
%
%   Status List:
%   'unlinked'  OR 0
%   'linked'    OR 1
%   'conflict'  OR -1

%% Error Handling

if nargin > 3 || nargin < 2
    error(sprintf('Invalid number of input arguments\nUsage - RRdefineVariable(obj, variable, standard) OR\n        obj.RRdefineVariable(variable, standard)')); 
end

if class(obj) ~= 'RebelRacingData'
    error('Object %s is not of type RebelRacingData',obj);
end

if ischar(status)
    switch status
        
        case 'unlinked'
            status = 0;
            
        case 'linked'
            status = 1;
            
        case 'conflict'
            status = -1;
            
        otherwise
            msg = sprintf('Invalid "status" argument, approved arguments are:\n0 OR "unlinked\n1 OR "linked"\n-1 OR "conflict"');
            error(msg); %#ok<*SPERR>
            
    end        
end

%% Verify Status and Collect Field Names
%   In the case that there is only two input arguments, it is assumed the
%   user wants a cell array with all the field names that exhibit 'status'
%   behavior

fields = fieldnames(obj.RRtestAccess);

if nargin == 2
    
    cnt = 0;
    out = {};
    switch status
    
        case 0
            for i = 1:length(fields)
                id = getfield(obj.RRtestAccess.(fields{i}),'Valid'); %#ok<*GFLD>
                if id == 0 || id == -1
                    cnt = cnt + 1;
                    out{cnt} = fields{i}; %#ok<*AGROW>
                end
            end
        
        case 1
            for i = 1:length(fields)
                if getfield(obj.RRtestAccess.(fields{i}), 'Valid') == 1
                    cnt = cnt + 1;
                    out{cnt} = fields{i};
                end
            end
        
        case -1
            for i = 1:length(fields)
                if getfield(obj.RRtestAccess.(fields{i}), 'Valid') == -1
                    cnt = cnt + 1;
                    out{cnt} = fields{i};
                end
            end
        
    end 
end

%% Return Bool for Requested Field Name
%   In the case that there is three input arguments, it is expected that
%   the user wants a boolean indication on whether or not the respective
%   field exhibits the status

if nargin == 3
    try
        info = getfield(obj.RRtestAccess.(fieldname),'Valid');
        %For 'unlinked' return true if unlinked or if conflicting with
        %another variable
        if status == 0
            if info == 0 || info == -1 
                out = 1;
                return
            else
                out = 0;
                return
            end
        else
            if status == info
                out = 1;
                return
            else
                out = 0;
                return
            end
        end
    catch
        msg = sprintf('%s is not a standard fieldname, the list of standard fields can be found with "help RRdefineVariable"', fieldname);
        error(msg);
    end 
end

end

