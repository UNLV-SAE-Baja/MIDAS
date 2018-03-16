%RRimportData
%Will take the RebelRacingData object and populate the object's properties
%with appropriate values from the input file.
%   Inputs : 2
%   obj - The RebelRacingData object that this function will interact with
%   filename - The name of the input file that holds the data

%   Outputs: N/A

%   RebelRacingData Modifications:
%   RRname
%   RRdataTable
%   RRdataProperties
%   RRinputFile
%   RRdataTable.Properties.Description
%   RRdataTable.Properties.VariableUnits

function RRimportData(obj, filename)
%% Preliminary
    %Check whether or not input file is char array
    if (~ischar(filename))
        error("Error: Not a file");
    end
    
    %Break the file down into constituent parts in order to fill in class
    %variables
    [~, name, ext] = fileparts(filename);
    obj.RRname = name;
    obj.RRinputFile = [name ext];
            
    %Import the file into memory with readTable
    obj.RRdataTable = readtable(filename);

%% Move Imported Data to RRdataTable
    
    %Set description of the RRdataTable
    obj.RRdataTable.Properties.Description = ['Data Table Generated From ',[name ext],' on ',date]; 
    
%% Variable Names and Units

    tempVar = obj.RRdataTable.Properties.VariableNames;
    unitArray = cell(1,length(tempVar));
    for i = 1:length(tempVar)
    
        cnt = 0;
        strtPos = 0; %#ok<NASGU>
        endPos = 0; %#ok<NASGU>
        columnName = ''; %#ok<NASGU>
        
        %This underscoreCheck will be used to ensure that only a single
        %space in the variable name or the variable units can be accounted
        %for
        underscoreCheck = 0;

        cellContents = tempVar{i};
                
        j = 1;
        while j <= length(cellContents)

            if (cellContents(j) <= 'z' && cellContents(j) >= 'a') || (cellContents(j) <= 'Z' && cellContents(j) >= 'A')
                cnt = cnt + 1;
                
                switch cnt
                    case 1
                        strtPos = j;
                        while (cellContents(j) <= 'z' && cellContents(j) >= 'a') || (cellContents(j) <= 'Z' && cellContents(j) >= 'A') || (cellContents(j) >= '0' && cellContents(j) <= '9') || (cellContents(j) == '_' && underscoreCheck == 0)
                            if cellContents(j) == '_'
                                underscoreCheck = 1;
                            end
                            j = j + 1;
                        end
                        endPos = j - 1;
                        if cellContents(endPos) == '_'
                            endPos = endPos - 1;
                        end
                        columnName = cellContents(strtPos:endPos);
                        obj.RRdataTable.Properties.VariableNames{i} = columnName;
                        
                    case 2
                        underscoreCheck = 0;
                        strtPos = j;
                        while (cellContents(j) <= 'z' && cellContents(j) >= 'a') || (cellContents(j) <= 'Z' && cellContents(j) >= 'A') || (cellContents(j) >= '0' && cellContents(j) <= '9') || (cellContents(j) == '_' && underscoreCheck == 0)
                            if cellContents(j) == '_'
                                underscoreCheck = 1;
                            end
                            j = j + 1;
                        end
                        endPos = j - 1;
                        if cellContents(endPos) == '_'
                            endPos = endPos - 1;
                        end
                        unitArray{i} = char(cellContents(strtPos:endPos));
                           
                end
            end
            
                %Check whether or not the Units were defined for the
                %variable
                if cnt < 2 && j == length(cellContents)
                    unitArray{i} = '';
                end
                
                j = j + 1;
                
        end 
    end
     
    %Populate variable units information
    obj.RRdataTable.Properties.VariableUnits = unitArray;
    
%% Update Properties
    %Move the properties into a class variable that is a little more
    %visible, and create more redundancy. 
    
    obj.RRdataProperties = obj.RRdataTable.Properties;
 
end