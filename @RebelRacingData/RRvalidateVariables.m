function RRvalidateVariables(obj)
%RRvalidateVariables will parse and compare RRdictionary and the variable
%names supplied to the RebelRacingData object. Depending on whether or not
%a match is found, the RRtestAccess property will be set accordingly.
%   When a key-value match is found, the RRtestAccess struct properties
%   'VariableName' and 'Valid' flag will be set. However there are several
%   events that will cause a warning or an error. The 'Valid' field will be
%   set with the following value based on the criteria:
%    0:Unset - No variable has been linked to this standard
%    1:Set - One variable has been linked to this standard
%   -1:Conflict - Two (or more) variables are mapped to the same standard data type
%   -2:Under-Defined - A variable is mapped to two (or more) standards
%    ~:Miss - A variable does not match any defined standard data type

%% Instantiate Variables 

vars = obj.RRdataProperties.VariableNames;
conflicts = 0;
conflictVariables = {};
miss = 0;
missVariables = {};
underdefined = 0;
underdefinedVariables = {};
keyset = {};

%% Compare Each Variable with Dictionary

%Test each and every variable name through the dictionary
for i=1:length(vars)
    keyset{1} = vars{i};
    try
       %Check whether or not there is multiple standard names linked to a
       %single variable identifier.
       FieldName = values(obj.RRdictionary,keyset);
       
       %In the event that a variable identifier is UNDERDEFINED, then set
       %the valid flag for both of the fields accordingly (-2)
       if length(FieldName) > 1
           underdefined = underdefined + 1;
           underdefinedVariables{underdefined} = vars{i}; %#ok<*AGROW>
           for j = 1:length(FieldName)
               obj.RRtestAccess.(FieldName{i}) = setfield(obj.RRtestAccess.(FieldName{i}),'Valid',-2); %#ok<*SFLD>
           end
       else
            flag = getfield(obj.RRtestAccess.(FieldName{1}),'Valid'); %#ok<*GFLD>
            switch flag
                
                %In the event that there is a 'Hit' then set the 'Valid'
                %flag and 'VariableName' as appropriate (1)
                case 0
                    obj.RRtestAccess.(FieldName{1}) = setfield(obj.RRtestAccess.(FieldName{1}),'Valid',1);
                    obj.RRtestAccess.(FieldName{1}) = setfield(obj.RRtestAccess.(FieldName{1}),'VariableName',vars{i});
                    
                %In the event that there is a CONFLICT, defined when a
                %variable identifier is mapped to an already defined
                %standard, set the 'Valid' flag and set the 'VariableName'
                %field to '' (-1)
                case 1
                    obj.RRtestAccess.(FieldName{1}) = setfield(obj.RRtestAccess.(FieldName{1}),'Valid',-1);
                    tempName = getfield(obj.RRtestAccess.(FieldName{1}),'VariableName');
                    obj.RRtestAccess.(FieldName{1}) = setfield(obj.RRtestAccess.(FieldName{1}),'VariableName','*');
                    conflicts = conflicts + 2;
                    conflictVariables{conflicts-1} = tempName;
                    conflictVariables{conflicts} = vars{i};
                    
                %In the event that there was a previous CONFLICT, the flag
                %should already be set and the counter needs to be
                %incremented by just 1
                case -1
                    conflicts = conflicts + 1;
                    conflictVariables{conflicts} = vars{i};
           
            end
       end
    %In the event that the key is not in the dictionary list that is
    %created from the KeyValues.txt file, an error will be thrown which
    %will be caught here. This will be counted as a MISS and the proper
    %error will be hidden from the user. There will be a warning issued to
    %the user instead, at the end of the function.
    catch ME
        if strcmp(ME.identifier,'MATLAB:Containers:Map:NoKey')
            miss = miss + 1;
            missVariables{miss} = vars{i};
        end
    end
end

%% Present Warnings to User (If Necessary)

conflictStr = '';
missStr = '';
underdefinedStr = '';

if (conflicts ~= 0) || (miss ~= 0) || (underdefined ~= 0)
    if conflicts ~= 0
        tmpmsg = sprintf('%s',conflictVariables{1});
        for k = 2:length(conflictVariables)
           tmpmsg = strcat(tmpmsg, sprintf(', %s',conflictVariables{k})); 
        end
        conflictStr = tmpmsg;
    end
    if miss ~= 0
        tmpmsg = sprintf('%s',missVariables{1});
        for k = 2:length(missVariables)
           tmpmsg = strcat(tmpmsg, sprintf(', %s',missVariables{k})); 
        end
        missStr = tmpmsg;
    end
    if underdefined ~= 0
        tmpmsg = sprintf('%s',underdefinedVariables{1});
        for k = 2:length(underdefinedVariables)
           tmpmsg = strcat(tmpmsg, sprintf(', %s',underdefinedVariables{k})); 
        end
        underdefinedStr = tmpmsg;
    end
    
    
    msg = sprintf('Some variables are in need of attention. Use "help RRdefineVariable" for information to set variables manually, as necessary.\nConflict Count: %i\nConflict Variables: %s\nMiss Count: %i\nMissed Variables: %s\nUnderdefined Count: %i\nUnderdefined Variables: %s',...
                  conflicts,conflictStr,miss,missStr,underdefined,underdefinedStr);
    warning(msg); %#ok<SPWRN>
end
end

